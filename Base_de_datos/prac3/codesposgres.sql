﻿--SET search_path="ejercicio2anio2017";
--SELECT "NRO_COMPETENCIA", "DESCRIPCION", "CATEGORIA"
 --  FROM competencia
 --    WHERE ("CATEGORIA" < 5);
--SELECT "NRO_CLUB" 
 --  FROM Participacion NATURAL JOIN Competencia
 --    WHERE ("CATEGORIA" = 4);
--SELECT "NOMBRE_CLUB"
 --  FROM (Participacion NATURAL JOIN Competencia) NATURAL JOIN Club
 --    WHERE ("CATEGORIA" = 4);

--SET search_path="ejercicio4anio2017"; 
--SELECT Competidor.*
 --  FROM (Competidor NATURAL JOIN Deporte)
 --    WHERE (denominacion='hockey');
--SELECT Pais FROM Competicion EXCEPT (SELECT Pais FROM Medalla);
--SELECT Pais FROM Competicion WHERE Pais NOT IN (SELECT Pais FROM Medalla);