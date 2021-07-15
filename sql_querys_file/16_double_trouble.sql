/**
  * RETO: Filtrar los alumnos que se inscribieron en mayo de 2018
  */

-- Extract --
SELECT *
FROM platzi.alumnos
WHERE (EXTRACT(YEAR FROM fecha_incorporacion)) = 2018
	AND (EXTRACT(MONTH FROM fecha_incorporacion)) = 5;

-- Date_Part --
SELECT *
FROM platzi.alumnos
WHERE (DATE_PART('YEAR', fecha_incorporacion)) = 2018
	AND (DATE_PART('MONTH', fecha_incorporacion)) = 5;

-- Subquery Date_Part --
SELECT	*
FROM (
	SELECT	*,
			DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion,
			DATE_PART('MONTH', fecha_incorporacion) AS mes_incorporacion
	FROM platzi.alumnos
) AS alumnos_con_anio_mes
WHERE	anio_incorporacion = 2018
	AND	mes_incorporacion = 5;

/**
  * Borrar los registros duplicados de una tabla
  */

-- Subquery by id --
SELECT	*
FROM 	platzi.alumnos ou
WHERE (
	SELECT	COUNT(*)
	FROM	platzi.alumnos inr
	WHERE	inr.id = ou.id
) > 1;

-- Hash text --
SELECT (platzi.alumnos.*)::text, COUNT(*)
FROM platzi.alumnos
GROUP BY platzi.alumnos.*
HAVING COUNT(*) > 1;

-- Hash excluyendo ID --
SELECT (
	platzi.alumnos.nombre,
	platzi.alumnos.apellido,
	platzi.alumnos.email,
	platzi.alumnos.colegiatura,
	platzi.alumnos.fecha_incorporacion,
	platzi.alumnos.carrera_id,
	platzi.alumnos.tutor_id
)::text, COUNT(*)
FROM platzi.alumnos
GROUP BY platzi.alumnos.nombre,
	platzi.alumnos.apellido,
	platzi.alumnos.email,
	platzi.alumnos.colegiatura,
	platzi.alumnos.fecha_incorporacion,
	platzi.alumnos.carrera_id,
	platzi.alumnos.tutor_id
HAVING COUNT(*) > 1;

-- Partición por todos los campos excepto ID --
SELECT	*
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
		ORDER BY id asc
	) AS row,
	*
	FROM platzi.alumnos
) duplicados
WHERE duplicados.row > 1;
