/**
  * RETO: Extraer los campos de hora de una fecha
  */
-- Extract --
SELECT	EXTRACT(HOUR FROM fecha_incorporacion) AS hora_incorporacion,
		EXTRACT(MINUTE FROM fecha_incorporacion) AS minuto_incorporacion,
		EXTRACT(SECOND FROM fecha_incorporacion) AS segundo_incorporacion
FROM platzi.alumnos;

-- Date_Part --
SELECT  DATE_PART('HOUR', fecha_incorporacion) AS hora_incorporacion,
        DATE_PART('MINUTE', fecha_incorporacion) AS minuto_incorporacion,
        DATE_PART('SECOND', fecha_incorporacion) AS segundo_incorporacion
FROM platzi.alumnos;

/**
  * Filtrar los alumnos que se inscribieron en 2019
  */

-- Filtro EXTRACT --
SELECT *
FROM platzi.alumnos
WHERE (EXTRACT(YEAR FROM fecha_incorporacion)) = 2019;

-- Filtro DATE_PART --
SELECT *
FROM platzi.alumnos
WHERE (DATE_PART('YEAR', fecha_incorporacion)) = 2019;

-- Filtro subquery DATE_PART --
SELECT	*
FROM (
	SELECT	*,
			DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion
	FROM platzi.alumnos
) AS alumnos_con_anio_mes
WHERE	anio_incorporacion = 2019;
