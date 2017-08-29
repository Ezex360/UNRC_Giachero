/*
-- Ejercicio 1
USE ejercicio1anio2017;
SELECT * FROM producto WHERE (PRECIO >= 999);

SELECT DISTINCT COD_PRODUCTO,producto.PRECIO
	FROM producto JOIN itemfactura USING (COD_PRODUCTO)
		WHERE (CANTIDAD < 5)
			ORDER BY producto.PRECIO desc;
SELECT COD_PRODUCTO,PRECIO FROM producto WHERE COD_PRODUCTO IN 
	(SELECT COD_PRODUCTO FROM itemfactura WHERE (CANTIDAD < 5))
		ORDER BY PRECIO desc;

SELECT * FROM cliente WHERE NRO_CLIENTE NOT IN 
	(SELECT NRO_CLIENTE FROM factura)
		ORDER BY APELLIDO,NOMBRE desc;

SELECT * FROM producto WHERE COD_PRODUCTO NOT IN
	(SELECT COD_PRODUCTO FROM itemfactura);

SELECT * FROM producto WHERE COD_PRODUCTO IN
(SELECT COD_PRODUCTO FROM itemfactura GROUP BY COD_PRODUCTO HAVING (SUM(CANTIDAD) > 5)); 
*/
/*
-- Ejercicio 2
USE ejercicio2anio2017;
SELECT * FROM competencia WHERE (CATEGORIA < 5);
SELECT * FROM club WHERE NRO_CLUB IN
	(SELECT NRO_CLUB 
		FROM participacion JOIN competencia USING (NRO_COMPETENCIA)
			WHERE  (CATEGORIA = 5));
SELECT NOMBRE_CLUB 
	FROM participacion NATURAL JOIN competencia NATURAL JOIN club
		WHERE (CATEGORIA = 5); 
*/
/*
-- Ejercicio 4
USE ejercicio4anio2017;
SELECT competidor.* 
	FROM competidor NATURAL JOIN deporte
		WHERE (denominacion = 'natacion');

SELECT pais FROM competicion WHERE pais NOT IN
	(SELECT pais FROM medalla);

*/

