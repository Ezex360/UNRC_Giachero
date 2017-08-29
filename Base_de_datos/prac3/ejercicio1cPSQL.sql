DROP schema if EXISTS ejercicio1cPSQL cascade;
CREATE schema ejercicio1cPSQL;

DROP domain if EXISTS colores;
CREATE domain colores varchar(30)
	CHECK (VALUE IN ('rojo','azul','amarillo'));

DROP TABLE if EXISTS ejercicio1cPSQL.categoria;
CREATE TABLE ejercicio1cPSQL.categoria(
	nro_categoria int NOT NULL,
	descripcion varchar(30) default NULL,
	CONSTRAINT categoria_pk PRIMARY KEY (nro_categoria)
);

DROP TABLE if EXISTS ejercicio1cPSQL.producto;
CREATE TABLE ejercicio1cPSQL.producto(
	nro_producto int NOT NULL,
	descripcion varchar(30) default NULL,
	color colores default NULL,
	nro_categoria int NOT NULL ,
	CONSTRAINT producto_pk PRIMARY KEY (nro_producto),
	CONSTRAINT categoria_fk foreign key (nro_categoria) references ejercicio1cPSQL.categoria,
	CHECK (nro_producto>0)
);

DROP TABLE if EXISTS ejercicio1cPSQL.proveedor;
CREATE TABLE ejercicio1cPSQL.proveedor(
	nro_proveedor int NOT NULL,
	nombre varchar(30) default NULL,
	apellido varchar(30) default NULL,
	direccion varchar(60) default NULL,
	CONSTRAINT proveedor_pk PRIMARY KEY (nro_proveedor)
);

DROP TABLE if EXISTS ejercicio1cPSQL.suministra;
CREATE TABLE ejercicio1cPSQL.suministra(
	nro_proveedor int NOT NULL,
	nro_producto int NOT NULL,
	foreign key (nro_proveedor) references ejercicio1cPSQL.proveedor,
	foreign key (nro_producto) references ejercicio1cPSQL.producto
);

INSERT INTO ejercicio1cPSQL.categoria (nro_categoria, descripcion) VALUES
(1,'lapiz'),
(2,'lapicera'),
(3,'portamina');

INSERT INTO ejercicio1cPSQL.producto (nro_producto, descripcion, color, nro_categoria) VALUES
(1,'faber','rojo',1),
(2,'faber','azul',1),
(3,'faber','rojo',2);

INSERT INTO ejercicio1cPSQL.proveedor VALUES
(1,'joa','corrupto','sampacho 123'),
(2,'eze','kpo','rioIV 123');

INSERT INTO ejercicio1cPSQL.suministra VALUES
(1,1),
(1,2),
(2,1),
(2,3);







