Drop schema if exists CiudadJoven;
Create schema CiudadJoven;
Use CiudadJoven;


Drop table if exists persona;
Create table persona(
	tipo_doc Enum('dni','pasaporte'),
	doc VARCHAR(12) Not Null,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	created_at DateTime,
	updated_at DateTime,
	Primary Key(tipo_doc,doc)
);

Drop table if exists telefonos;
Create table telefonos(
	tipo_doc Enum('dni','pasaporte'),
	doc VARCHAR(12),
	numero VARCHAR(20),
	Primary Key(tipo_doc,doc,numero),
	Foreign Key (tipo_doc,doc) references persona(tipo_doc,doc) 
		on delete cascade on update cascade

);

Drop table if exists casa;
Create table casa(
	nro_casa int(11) Not Null auto_increment,
	Primary Key (nro_casa)

);

Drop table if exists menores;
Create table menores(
	nro_menor int(11) Not Null auto_increment Unique,
	tipo_doc Enum('dni','pasaporte'),
	doc VARCHAR(12),
	peso float,
	talla VARCHAR(5),
	fecha_nacimiento Date,
	nro_casa int,
	condicion Enum('dia','permanente'),
	estado Enum('ingresado','egresado'),
	Check (peso > 0),
	Primary key (tipo_doc,doc),
        Foreign Key (tipo_doc,doc) references persona(tipo_doc,doc) 
        	on delete no action on update cascade,
        Foreign Key (nro_casa) references casa(nro_casa) 
        	on delete SET NULL on update cascade
	
);

Drop table if exists visitante;
Create table visitante(
	tipo_doc Enum('dni','pasaporte'),
	doc VARCHAR(12),
	Primary key (tipo_doc,doc),
        Foreign Key (tipo_doc,doc) references persona(tipo_doc,doc) 
        	on delete no action	on update cascade

	
);

Drop table if exists recibe;
Create table recibe(
	tipo_doc_menor Enum('dni','pasaporte'),
	doc_menor VARCHAR(12),
	tipo_doc_adulto Enum('dni','pasaporte'),
	doc_adulto VARCHAR(12),
	Primary key (tipo_doc_menor,doc_menor,tipo_doc_adulto,doc_adulto),
        Foreign Key (tipo_doc_menor,doc_menor) references menores(tipo_doc,doc) 
        	on delete no action on update cascade,
        Foreign Key (tipo_doc_adulto,doc_adulto) references visitante(tipo_doc,doc) 
        	on delete no action on update cascade

);

Drop table if exists visita;
Create table visita(
	nro_visita int(11) Not Null auto_increment,
	tipo_doc_menor Enum('dni','pasaporte'),
	doc_menor VARCHAR(12),
	tipo_doc_adulto Enum('dni','pasaporte'),
	doc_adulto VARCHAR(12),
	fecha_visita DateTime,
	Primary Key (nro_visita),
        Foreign Key (tipo_doc_menor,doc_menor,tipo_doc_adulto,doc_adulto) 
        	references recibe(tipo_doc_menor,doc_menor,tipo_doc_adulto,doc_adulto) 
        		on delete No Action on update cascade
);

Drop table if exists personal;
Create table personal(
	tipo_doc Enum('dni','pasaporte'),
	doc VARCHAR(12),
	direccion VARCHAR(50),
	Primary key (tipo_doc,doc),
        Foreign Key (tipo_doc,doc) references persona(tipo_doc,doc)
        	on delete cascade on update cascade
	
);

Drop table if exists responsable;
Create table responsable(
	nro_casa int,
	tipo_doc Enum('dni','pasaporte'),
	doc VARCHAR(12),
	Primary key (tipo_doc,doc,nro_casa),
        Foreign Key (tipo_doc,doc) references persona(tipo_doc,doc) 
        	on delete cascade on update cascade,
        Foreign Key (nro_casa) references casa(nro_casa) 
        	on delete cascade on update cascade	
);


Drop table if exists trabaja;
Create table trabaja(
	nro_casa int,
	tipo_doc Enum('dni','pasaporte'),
	doc VARCHAR(12),
	fecha date,
	horario_inicio time,
	horario_salida time,
	Primary key (tipo_doc,doc,nro_casa,fecha),
        Foreign Key (tipo_doc,doc,nro_casa) references responsable(tipo_doc,doc,nro_casa)
        	on delete cascade on update cascade
	
	
);

Drop table if exists legajo;
Create table legajo(
	nro_legajo int(11) Not Null,
	fotocopia_doc Varchar(256),
	partida_nacimiento Varchar(256),
	es_visitado Boolean,
	tipo_doc_menor Enum('dni','pasaporte'),
	doc_menor VARCHAR(12),
	Primary Key (nro_legajo),
        Foreign Key (tipo_doc_menor,doc_menor) references menores(tipo_doc,doc) 
        	on delete no action on update cascade
);

Drop table if exists informes;
Create table informes(
	nro_legajo int,
	informe Varchar(256),
	Primary Key (nro_legajo,informe),
	Foreign Key (nro_legajo) references legajo(nro_legajo) on delete no action
);

Drop table if exists historia;
Create table historia(
	nro_historia int(11) Not Null auto_increment,
	tipo_doc_menor Enum('dni','pasaporte'),
	doc_menor VARCHAR(12),
	Primary key (nro_historia),
        Foreign Key (tipo_doc_menor,doc_menor) references menores(tipo_doc,doc) 
        	on delete no action on update cascade

);

Drop table if exists antecedente;
Create table antecedente(
	nro_antecedente int(11) Not Null auto_increment,
	descripcion VARCHAR(128),
	Primary key (nro_antecedente)

);

Drop table if exists formada;
Create table formada(
	nro_historia int,
	nro_antecedente int,
	Primary Key (nro_historia,nro_antecedente),
	Foreign Key (nro_historia) references historia(nro_historia) 
		on delete cascade on update cascade,
	Foreign Key (nro_antecedente) references antecedente(nro_antecedente) 
		on delete cascade on update cascade
);

Drop table if exists episodio;
Create table episodio(
	nro_episodio int(11) Not Null auto_increment,
	nro_historia int,
    descripcion_ep VARCHAR(256),
    fecha_ep Date,
	Primary Key(nro_episodio),
	Foreign Key (nro_historia) references historia(nro_historia) 
		on delete cascade on update cascade
	
);

Drop table if exists medicacion;
Create table medicacion(
	nro_medicacion int(11) Not Null auto_increment,
    nombre_med VARCHAR(50),
	Primary Key(nro_medicacion)
);

Drop table if exists necesita;
Create table necesita(
	nro_episodio int,
	nro_medicacion int,
	dosis VARCHAR(16),
	Primary Key(nro_episodio,nro_medicacion),
	Foreign Key (nro_episodio) references episodio(nro_episodio) 
		on delete cascade on update cascade,
	Foreign Key (nro_medicacion) references medicacion(nro_medicacion) 
		on delete cascade on update cascade

);

Drop table if exists auditoriaMenores;
Create table auditoriaMenores(
	nro_menor int(11),
	tipo_doc Enum('dni','pasaporte'),
	doc VARCHAR(12),
	peso_viejo float,
	talla_viejo VARCHAR(5),
	fecha_nacimiento_viejo Date,
	nro_casa_viejo int,
	condicion_viejo Enum('dia','permanente'),
	estado_viejo Enum('ingresado','egresado'),
	peso_nuevo float,
	talla_nuevo VARCHAR(5),
	fecha_nacimiento_nuevo Date,
	nro_casa_nuevo int,
	condicion_nuevo Enum('dia','permanente'),
	estado_nuevo Enum('ingresado','egresado'),
	Primary key (tipo_doc,doc),
        Foreign Key (nro_menor) references menores(nro_menor),
        Foreign Key (tipo_doc,doc) references menores(tipo_doc,doc)
	
);
