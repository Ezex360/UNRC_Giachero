Use CiudadJoven;
Insert into persona(tipo_doc,doc,nombre,apellido) Values 
	('dni','39737931','Ezequiel','Giachero'), 
	('DNI','40048845','Joaquin','Gardiola'), 
	('Dni','39610825','Joaquin','Feliu'),
	('dni','40404040','Felipe','Giachero'),
	('dni','39666777','Lorenzo','DiPalma'),
	('Pasaporte','ABC123456','Federico','Minardi'), 
	('pasaPorte','CBU443627','Michael','Pollo'),
	('PASAPORTE','gil074310','Danilo','Marchetti');
    
Insert into telefonos(tipo_doc,doc,numero) Values
	('dni','39737931','3583647147'), 
	('DNI','40048845','3582412185');
    
Insert into casa(nro_casa) Values
	(1),
    (default),
    (default),
    (default);
    
Insert into menores(tipo_doc,doc,estado,condicion,peso,talla,fecha_nacimiento,nro_casa) Values
	('Dni','39610825','ingresado','dia',70.5,'3','1996-05-22',1), 
	('Pasaporte','ABC123456','ingresado','dia',17.7,'S','1999-05-22',2),
	('dni','39666777','ingresado','dia',44.4,'L','2000-04-23',1);
    
Insert into visitante(tipo_doc,doc) Values
	('PASAPORTE','gil074310'),
	('dni','39737931');

    
Insert into recibe(tipo_doc_menor,doc_menor,tipo_doc_adulto,doc_adulto) Values
	('Pasaporte','ABC123456','PASAPORTE','gil074310'),
	('Dni','39610825','dni','39737931'),
	('dni','39666777','dni','39737931');

Insert into visita(tipo_doc_menor,doc_menor,tipo_doc_adulto,doc_adulto,fecha_visita) Values
	('Pasaporte','ABC123456','PASAPORTE','gil074310','2017-08-23 17:30:00'),
	('Pasaporte','ABC123456','PASAPORTE','gil074310','2017-05-31 20:00:00'),
	('Dni','39610825','dni','39737931','2017-07-20 17:30:00'),
	('Dni','39610825','dni','39737931','2017-03-12 18:30:00'),
	('dni','39666777','dni','39737931','2017-08-24 14:30:00');
    
Insert into personal(tipo_doc,doc,direccion) Values
	('pasaPorte','CBU443627','Dean Funes 666'),
	('DNI','40048845','General Soler 1233'),
	('dni','40404040','Constitucion 1212');

Insert into responsable(nro_casa,tipo_doc,doc) Values
	(1,'pasaPorte','CBU443627'),
	(1,'DNI','40048845'),
	(2,'dni','40404040');
    
Insert into trabaja(nro_casa,tipo_doc,doc,fecha,horario_inicio,horario_salida) Values
	(1,'pasaPorte','CBU443627',NOW(),'08:00:00','16:00:00'),
	(1,'DNI','40048845',NOW(),'08:00:00','16:00:00'),
	(2,'dni','40404040',NOW(),'16:00:00','20:00:00');
    
Insert into legajo(nro_legajo,fotocopia_doc,partida_nacimiento,es_visitado,tipo_doc_menor,doc_menor) Values
	(1,Null,Null,true,'Dni','39610825');
    
Insert into informes(nro_legajo,informe) Values
	(1,'TEST');

Insert into antecedente(descripcion) Values
	('diabetes'),
    ('alergia'),
    ('escoliosis'),
    ('EPOC');
    
Insert into formada(nro_historia,nro_antecedente) Values
	(1,1),
    (1,2),
    (2,3);
    
Insert into episodio(nro_episodio,nro_historia,descripcion_ep,fecha_ep) Values
	(default, 1,'diabetes fuerte',NOW()),
    (default, 2,'Gripe',NOW());

Insert into medicacion(nombre_med) Values
	('ibuprofeno'),
    ('insulina');
    
Insert into necesita(nro_episodio,nro_medicacion,dosis) Values
	(1,2,'50 mg'),
    (2,1,'2 medidas');
    


    

    

    
    
    
    
    
