DROP schema if EXISTS ejercicio1bPSQL cascade;
CREATE schema ejercicio1bPSQL;

DROP domain if EXISTS nombre_articulo;
CREATE domain nombre_articulo varchar(40)
	CHECK (VALUE IN ('Cristales', 'Armazón', 'Audífono', 'Prótesis', 'Marcapaso'));

DROP TABLE if EXISTS ejercicio1bPSQL.pami;
CREATE TABLE ejercicio1bPSQL.pami(
	COD_PAMI int NOT NULL PRIMARY KEY,
	NOMBRE varchar(40) default NULL,
	CHECK (cod_pami>0)
);


DROP TABLE if EXISTS ejercicio1bPSQL.articulo;
CREATE TABLE ejercicio1bPSQL.articulo(
	COD_ARTICULO int NOT NULL PRIMARY KEY,
	NOMBRE nombre_articulo NOT NULL,
	PRECIO decimal(9,2) default NULL,
	CHECK (precio>0)
);

DROP TABLE if EXISTS ejercicio1bPSQL.prestacion;
CREATE TABLE ejercicio1bPSQL.prestacion(
	NRO_PRESTACION int NOT NULL PRIMARY KEY,
	FECHA date NOT NULL,
	PRECIO_PRESTACION decimal(10,2)
	CHECK (nro_prestacion>0),
	foreign key (FK_PAMI) references ejercicio1bPSQL.pami,
	foreign key (FK_ARTICULO) references ejercicio1bPSQL.articulo,
	constraint ukprestacion UNIQUE (COD_PAMI,COD_ARTICULO,FECHA)
);
