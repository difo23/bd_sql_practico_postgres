-- SELECT * FROM platzi.alumnos;

SELECT IF(400>200 , 3, 4);

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
WHERE row_id = 1 OR row_id < 6;



-- Otros apuntes

SELECT *
FROM platzi.alumnos AS alumnos
FETCH FIRST 5 ROWS ONLY;

SELECT *
FROM platzi.alumnos
LIMIT 5;

SELECT *
FROM (
	SELECT ROW_NUMBER () OVER() AS row_id, *
	FROM platzi.alumnos
 )AS alumnos_with_row_nums
 WHERE row_id < 6
;

SELECT *
FROM (
	SELECT ROW_NUMBER () OVER() AS row_id, *
	FROM platzi.alumnos
 )AS alumnos_with_row_nums
 WHERE row_id <=5
;

SELECT *
FROM (
	SELECT ROW_NUMBER () OVER() AS row_id, *
	FROM platzi.alumnos
 )AS alumnos_with_row_nums
 WHERE row_id BETWEEN 1 and 5
;