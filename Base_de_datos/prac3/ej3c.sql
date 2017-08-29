DROP SCHEMA IF EXISTS ej3c;
CREATE SCHEMA ej3c;
USE ej3c;

DROP TABLE IF EXISTS categoria;
CREATE TABLE categoria (
	nro_categoria int NOT NULL PRIMARY KEY,
	descripcionn varchar(30)
);

DROP TABLE IF EXISTS producto;
CREATE TABLE producto (
	nro_producto int NOT NULL PRIMARY KEY,
	nro_categoria int,
	descripcion varchar(30),
	color Enum('Azul','Rojo','Amarillo'),
	CHECK (nro_produto > 0),
	Foreign Key (nro_categoria) References categoria(nro_categoria)
);

DROP TABLE IF EXISTS proveedor;
CREATE TABLE proveedor (
	nro_proveedor int NOT NULL PRIMARY KEY,
	nombre varchar(30),
	apellido varchar(30),
	dirección varchar(30)
); 

DROP TABLE IF EXISTS suministra;
CREATE TABLE suministra (
	nro_proveedor int,
	nro_producto int,
	Foreign Key (nro_proveedor) References proveedor(nro_proveedor),
	Foreign Key (nro_producto) References producto(nro_producto)

);

INSERT INTO categoria VALUES
(1,'lapiz'),
(2,'lapicera');

INSERT INTO producto VALUES
(1,1,'faber','Azul'),
(2,2,'faber','Rojo');

INSERT INTO proveedor VALUES
(1,'Joa','gardiola',null),
(2,'eze','giachero',null);

INSERT INTO suministra VALUES
(1,1),
(1,2),
(2,1);
