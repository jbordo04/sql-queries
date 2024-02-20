USE tienda;

-- QUERIES --
SELECT nombre  FROM producto; -- 1
SELECT nombre, precio FROM producto p; -- 2
-- SELECT nombre, '€'+ CAST(precio AS text) precio FROM producto p;
-- SELECT p.nombre, CONCAT('€', CAST(p.precio AS VARCHAR(15))) AS precio FROM producto p;
-- SELECT p.nombre, '€'+ convert(text, p.precio) AS p.precio FROM producto p;
SELECT * FROM producto; -- 3 --
SELECT nombre, precio as 'Price in €', precio * 1.0783 AS 'Price in $'FROM producto; -- 4
SELECT nombre AS 'nom de producte', precio as 'euros', precio * 1.0783 AS 'dolars'FROM producto; -- 5
SELECT UPPER(nombre) AS nombre , precio from producto;
SELECT LOWER(nombre) AS nombre , precio from producto; -- 7
SELECT nombre, UPPER(LEFT(nombre,2)) AS siglas from fabricante; -- 8
SELECT nombre, ROUND(precio) AS precio_redondeado FROM producto;
SELECT nombre, FLOOR(precio) AS precio_truncado FROM producto; -- 10
SELECT p.nombre AS producto, f.nombre AS fabricante FROM producto p 
INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante;
SELECT DISTINCT(f.nombre) AS fabricante FROM producto p 
INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante; -- 12
SELECT nombre AS Alfabeticamente FROM fabricante ORDER BY nombre ASC;
SELECT nombre AS NO_Alfabeticamente FROM fabricante ORDER BY nombre DESC; -- 14
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5; -- 16
SELECT * FROM fabricante LIMIT 4,2; 
SELECT  nombre, precio FROM producto ORDER BY precio ASC LIMIT 1; -- 18
SELECT  nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT p.nombre, p.precio FROM producto p
INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE codigo_fabricante = 2; -- 20