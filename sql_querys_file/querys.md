

# Esenciales



```sql
 
 
 SELECT * FROM platzi.alumnos;

--  Traer el primer registro

SELECT * 
FROM platzi.alumnos
FETCH FIRST 1 ROWS ONLY;

SELECT * 
FROM platzi.alumnos
LIMIT 1; 


-- Primer registro mas complejo

SELECT * 
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, * 
	FROM platzi.alumnos
) AS alumnos_with_row_num
WHERE  row_id < 6;

-- Segunda colegiatura mas alta

-- Esta solucion me parece muy complicado
SELECT DISTINCT colegiatura
FROM platzi.alumnos AS a1
WHERE 2 = (
	-- El dos toma el segundo elemento de este query
	-- Hacemos un conteo de las colegiaturas
	SELECT COUNT(DISTINCT colegiatura)
	FROM platzi.alumnos AS a2
	WHERE a1.colegiatura <= a2.colegiatura
);


-- Mucho mejor solucion, mas rapida y entendible
SELECT DISTINCT colegiatura
FROM platzi.alumnos
ORDER BY colegiatura DESC
limit 1 OFFSET 1;  -- OFFSET en 1 se salta el primer resultado.


SELECT DISTINCT colegiatura, tutor_id
FROM platzi.alumnos
WHERE tutor_id = 20
ORDER BY colegiatura DESC
limit 1 OFFSET 1;  -- OFFSET en 1 se salta el primer resultado.

-- Nota esta toma el where del tutor_id fuera del subquery y
-- solo toma los datos con el tutor_id (Esta es la solucion real)
SELECT *
FROM platzi.alumnos AS datos_alumnos
INNER JOIN (
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
) AS segunda_mayor_colegiatura
ON datos_alumnos.colegiatura = segunda_mayor_colegiatura.colegiatura
WHERE tutor_id = 20;

-- Esta toma los datos del tuto_id dentro del subquery.
SELECT *
FROM platzi.alumnos AS datos_alumnos
INNER JOIN (
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
) AS segunda_mayor_colegiatura
ON datos_alumnos.colegiatura = segunda_mayor_colegiatura.colegiatura

-- Sacar la segunda mitad de los registros
SELECT * 
    FROM platzi.alumnos
    OFFSET ( SELECT COUNT(*)/2 FROM platzi.alumnos );
	
-- Solo la primera mitad
SELECT * 
    FROM platzi.alumnos
    LIMIT ( SELECT COUNT(*)/2 FROM platzi.alumnos );
	
-- Querry alumnos que no tengan el tutor_id 30
SELECT *
FROM platzi.alumnos
WHERE id NOT IN (
	SELECT id
	FROM platzi.alumnos
	WHERE tutor_id = 30
)

-- Traer una lista de valores prefijados
SELECT * 
FROM (
 SELECT ROW_NUMBER() OVER() AS row_id,  *
	FROM platzi.alumnos
) AS alumnos_with_row_num
WHERE row_id IN (1, 3, 10, 12, 15, 20);

-- Cuando no conozco la lista de antemano
SELECT * 
FROM platzi.alumnos
WHERE id IN (
	SELECT id
	FROM platzi.alumnos
	WHERE tutor_id = 30
);


-- TRABAJANDO CON FECHAS TIMESTAMP

SELECT EXTRACT(YEAR FROM fecha_incorporacion) AS year_incoporation;
FROM platzi.alumnos; 

SELECT DATE_PART('YEAR', fecha_incorporacion) AS year_incorporation
FROM platzi.alumnos;

SELECT DATE_PART('MINUTE', fecha_incorporacion) AS minute_incorporation
FROM platzi.alumnos;

SELECT *
FROM platzi.alumnos
WHERE (EXTRACT(YEAR FROM fecha_incorporacion)) = '2019';


-- Otros apuntes

SELECT *
FROM (
	SELECT ROW_NUMBER () OVER() AS row_id, *
	FROM platzi.alumnos
 )AS alumnos_with_row_nums
 WHERE row_id BETWEEN 1 and 5
;
```

# Double trouble



```sql
-- Creamos un duplicado para pruebas
INSERT INTO platzi.alumnos (id, nombre, apellido, email, colegiatura, fecha_incorporacion, carrera_id, tutor_id) 
VALUES (1001, 'Pamelina', null, 'pmylchreestrr@salon.com', 4800, '2020-04-26 10:18:51', 12, 16);

```

```sql
-- Buscar duplicados

SELECT * 
FROM platzi.alumnos AS exterior
WHERE (
	SELECT COUNT(*)
	FROM platzi.alumnos AS  interior
	WHERE  exterior.email = interior.email -- el id no es recomendado para buscar duplicados
) > 1;


SELECT * 
FROM (
	SELECT id,
	ROW_NUMBER() OVER(
		PARTITION BY 
			nombre,
			apellido,
			email,
			colegiatura,
			fecha_incorporacion,
			carrera_id,
			tutor_id
	ORDER BY id ASC
) AS row,
*
FROM platzi.alumnos
) AS duplicados
WHERE duplicados.row  > 1; 


-- Borrar duplicados

DELETE FROM platzi.alumnos
WHERE id in (
SELECT id 
FROM (
	SELECT id,
	ROW_NUMBER() OVER(
		PARTITION BY 
			nombre,
			apellido,
			email,
			colegiatura,
			fecha_incorporacion,
			carrera_id,
			tutor_id
	ORDER BY id ASC
) AS row
FROM platzi.alumnos
) AS duplicados
WHERE duplicados.row  > 1); 

-- :: es equivalente a hacer un cast

```

# Rangos

Los tipos de rango que vienen en PostgreSQL son:

- int4range: Que trae un rango de enteros.

- int8range: Es un rango de enteros grandes.

- numrange: Es un rango numérico.

- tsrange: Es un rango del tipo timestamp pero sin la zona horaria.

- tstzrange: Es un rango del tipo timestamp con la zona horaria

- daterange: Es un rango del tipo fecha.

  Esos son los que podemos usar como selectores de rango dentro de PostgreSQL si les interesa conocer más [Acá](https://www.postgresql.org/docs/9.2/rangetypes.html)

```sql

-- ¿En rango? --
SELECT int4range(10, 20) @> 3;
-- @> pregunta si 3 esta dentro del rango de 10 a 20, en este caso no esta y retorna false

-- ¿Se solapan? --
SELECT numrange(11.1, 22.2) && numrange(20.0, 30.0);

-- && Indica solapamiento entre dos rangos, en este caso retorna true


-- Obtener el límite superior --
SELECT UPPER(int8range(15, 25));
 -- UPPER trae el mayor elemento del rango
 -- LOWER trae el menor elemento del rango
 
 
-- Calcular la intersección --
SELECT int4range(10, 20) * int4range(15, 25);

-- ¿Rango vacío?
SELECT isempty(numrange(1, 5));

-- Filtrar alumnos cuyo tutor_id esté entre 1 y 10 --
SELECT *
FROM platzi.alumnos
WHERE int4range(10, 20) @> tutor_id;
```

## Encontrar los maximos

```sql
/**
  * Encontrar máximos
  */

-- Máximo absoluto de la tabla --
SELECT	fecha_incorporacion
FROM	platzi.alumnos
ORDER BY fecha_incorporacion DESC
LIMIT 1;

-- Intento por GROUP BY --
SELECT	carrera_id, fecha_incorporacion
FROM	platzi.alumnos
GROUP BY carrera_id, fecha_incorporacion
ORDER BY fecha_incorporacion DESC;

-- Funcion MAX --
SELECT	carrera_id, MAX(fecha_incorporacion)
FROM	platzi.alumnos
GROUP BY carrera_id
ORDER BY carrera_id;
```

