USE universidad;
 
-- SQL QUERIES -- 
SELECT apellido1, apellido2, nombre FROM persona ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p WHERE p.tipo = 'alumno' AND p.telefono IS NULL;

SELECT nombre, apellido1, apellido2, fecha_nacimiento FROM persona WHERE fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31' ;

SELECT p.nif, p.nombre, p.apellido1, p.apellido2 FROM persona p WHERE p.telefono IS NULL AND RIGHT(p.nif, 1) = 'K';

SELECT a.nombre FROM asignatura a
INNER JOIN  grado g ON g.id = a.id_grado WHERE a.curso = 3 AND a.cuatrimestre = 1 AND g.id = 7; 

SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS 'departamento' FROM profesor f
INNER JOIN persona p ON p.id = f.id_profesor
INNER JOIN departamento d ON d.id = f.id_departamento ORDER BY p.apellido1 ASC, p.nombre ASC;

SELECT a.nombre AS 'asignatura', c.anyo_inicio, c.anyo_fin FROM alumno_se_matricula_asignatura am 
INNER JOIN asignatura a ON am.id_asignatura = a.id
INNER JOIN persona p ON p.id = am.id_alumno
INNER JOIN curso_escolar c ON c.id = am.id_curso_escolar WHERE p.nif = '26902806M';

SELECT d.nombre AS departamento FROM profesor p
INNER JOIN departamento d ON d.id = p.id_departamento
INNER JOIN asignatura a ON a.id_profesor = p.id_profesor 
INNER JOIN grado g ON g.id = a.id_grado WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)' GROUP BY d.nombre;

SELECT CONCAT(p.nombre,' ', p.apellido1) AS 'Alumnos 2018/2019' FROM alumno_se_matricula_asignatura al
INNER JOIN persona p ON p.id = al.id_alumno 
INNER JOIN curso_escolar c ON c.id = al.id_curso_escolar WHERE c.anyo_inicio = 2018 AND c.anyo_fin = 2019 GROUP BY p.nombre, p.apellido1;

-- LEFT/RIGHT JOIN QUERIES --
SELECT d.nombre AS departamento, p.apellido1, p.apellido2, p.nombre FROM persona  p
LEFT JOIN profesor pr ON p.id = pr.id_profesor
LEFT JOIN departamento d ON d.id = pr.id_departamento WHERE p.tipo = 'profesor' ORDER BY d.nombre ASC,
    p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC; 

SELECT p.nombre, p.apellido1 FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor 
WHERE pr.id_departamento IS NULL AND p.tipo = 'profesor';

SELECT d.nombre FROM departamento d
LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_departamento IS NULL;

SELECT p.apellido1, p.apellido2, p.nombre, a.nombre AS nombre_asignatura FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor
LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;

SELECT a.nombre, p.nombre AS nombre_profesor FROM asignatura a
LEFT JOIN profesor pr ON a.id_profesor = pr.id_profesor
LEFT JOIN persona p ON pr.id_profesor = p.id WHERE pr.id_profesor IS NULL;

SELECT DISTINCT d.id, d.nombre FROM departamento d
LEFT JOIN profesor pr ON d.id = pr.id_departamento
LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor
LEFT JOIN curso_escolar c ON a.id = c.id WHERE a.id IS NULL;

-- RESUMEN QUERIES -- 
SELECT COUNT(*) AS total_alumnos FROM persona
WHERE tipo = 'alumno';

SELECT COUNT(*) AS alumnos_1999 FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

SELECT departamento.nombre AS nombre_departamento, COUNT(profesor.id_profesor) AS cantidad_profesores
FROM departamento
LEFT JOIN profesor ON departamento.id = profesor.id_departamento
GROUP BY departamento.nombre HAVING COUNT(profesor.id_profesor) > 0
ORDER BY cantidad_profesores DESC;

SELECT d.nombre AS nombre_departamento, COUNT(p.id_profesor) AS cantidad_profesores
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre ORDER BY cantidad_profesores DESC;

SELECT grado.nombre AS nombre_grado, COUNT(asignatura.id) AS cantidad_asignaturas FROM grado
LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre
ORDER BY cantidad_asignaturas DESC;

SELECT grado.nombre AS nombre_grado, COUNT(asignatura.id) AS cantidad_asignaturas FROM grado
LEFT JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre HAVING COUNT(asignatura.id) > 40
ORDER BY cantidad_asignaturas DESC;