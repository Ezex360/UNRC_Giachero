Drop schema if Exists ej3;
Create schema ej3;
Use ej3;

Drop Table if Exists afiliado;
Create Table afiliado (
	cod_pami int Not Null ,
	nombreAfiliado varchar(40) default Null,
	Primary Key(cod_pami)
); 

Drop Table if Exists articulo;
Create Table articulo (
	cod_articulo int Not Null,
	nombre Enum('Cristales','Armazon','Audifono','Protesis','Marcapasos'),
	precio decimal(8,2) default Null,
	Primary Key(cod_articulo),
	Check (precio >=0)
); 

Drop Table if Exists prestacion;
Create Table prestacion (
	num_prestacion int Not Null,
	cod_pami int,
	cod_articulo int,		
	fecha date Not Null,
	Primary Key (num_prestacion),
	Foreign Key (cod_pami) 
		References afiliado(cod_pami)
		On Delete Cascade,
	Foreign Key (cod_articulo) 
		References articulo(cod_articulo)
		On Delete No Action

);

INSERT INTO afiliado VALUES 
(1,'Eze'),
(2,'Joa');

INSERT INTO articulo VALUES
(1,'Cristales',50),
(2,'Protesis',100),
(3,'Audifono',60),
(4,'Armazon',70);

INSERT INTO prestacion VALUES
(1,1,1,CURDATE()),
(2,1,2,CURDATE()),
(3,1,3,CURDATE()),
(4,1,3,CURDATE()),
(5,1,3,CURDATE()),
(6,1,3,CURDATE()),
(7,2,4,CURDATE());



/*
select cod_pami,nombreAfiliado, min(precio),max(precio)
	from prestacion natural join articulo natural join afiliado
       		group by cod_pami;	

select cod_pami,nombreAfiliado,count(num_prestacion) 
	from prestacion natural join afiliado
		group by cod_pami;
*/

delimiter $$
CREATE TRIGGER trigger_autoenum_codpami
	BEFORE INSERT ON afiliado 
	FOR EACH ROW
	BEGIN
		SET NEW.cod_pami = (SELECT max(cod_pami) FROM afiliado)+1;
	END;
$$ 
delimiter ;

-- Calcular que el promedio de repeticiones de un producto sea mayor al 50%
-- select cod_articulo,count(*) from prestacion group by cod_articulo having 50 < (count(*)/(select count(*) from prestacion))*100;
-- Mostrar el minimo y el maximo precio de una prestacion por afiliado.
-- select cod_pami, nombreAfiliado, min(precio), max(precio) from prestacion natural join afiliado natural join articulo group by cod_pami;



