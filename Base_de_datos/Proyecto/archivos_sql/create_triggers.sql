use CiudadJoven;

delimiter $$
DROP TRIGGER IF EXISTS  trigger_insert_persona $$
CREATE TRIGGER trigger_insert_persona
	BEFORE INSERT ON persona
	FOR EACH ROW
	BEGIN
		SET NEW.tipo_doc = lower(NEW.tipo_doc);
		SET NEW.doc = upper(NEW.doc);
		SET NEW.created_at = NOW(); 
		SET NEW.updated_at = NOW();
	END;
$$

DROP TRIGGER IF EXISTS  trigger_insert_telefono $$
CREATE TRIGGER trigger_insert_telefono
	BEFORE INSERT ON telefonos
	FOR EACH ROW
	BEGIN
		SET NEW.tipo_doc = lower(NEW.tipo_doc);
		SET NEW.doc = upper(NEW.doc);
	END;
$$

DROP TRIGGER IF EXISTS  trigger_insert_menores $$
CREATE TRIGGER trigger_insert_menores
	BEFORE INSERT ON menores
	FOR EACH ROW
	BEGIN
		SET NEW.tipo_doc = lower(NEW.tipo_doc);
		SET NEW.doc = upper(NEW.doc);
        SET NEW.talla = upper(NEW.talla);
        SET NEW.estado = lower(NEW.estado);
        SET NEW.condicion = lower(NEW.condicion);
	END;
$$

DROP TRIGGER IF EXISTS  trigger_insert_auditoriaMenores $$
CREATE TRIGGER trigger_insert_auditoriaMenores 
	AFTER UPDATE ON menores
	FOR EACH ROW
	BEGIN
		INSERT INTO auditoriaMenores VALUES
			(NEW.nro_menor,NEW.tipo_doc,NEW.doc,OLD.peso,OLD.talla,OLD.fecha_nacimiento,OLD.nro_casa,OLD.condicion,
				OLD.estado,NEW.peso,NEW.talla,NEW.fecha_nacimiento,NEW.nro_casa,NEW.condicion,NEW.estado);
	END;
$$
DROP TRIGGER IF EXISTS  trigger_insert_visitante $$
CREATE TRIGGER trigger_insert_visitante
	BEFORE INSERT ON visitante
	FOR EACH ROW
	BEGIN
		SET NEW.tipo_doc = lower(NEW.tipo_doc);
		SET NEW.doc = upper(NEW.doc);
	END;
$$

DROP TRIGGER IF EXISTS  trigger_insert_recibe $$
CREATE TRIGGER trigger_insert_recibe
	BEFORE INSERT ON recibe
	FOR EACH ROW
	BEGIN
		SET NEW.tipo_doc_menor = lower(NEW.tipo_doc_menor);
		SET NEW.doc_menor = upper(NEW.doc_menor);
		SET NEW.tipo_doc_adulto = lower(NEW.tipo_doc_adulto);
		SET NEW.doc_adulto = upper(NEW.doc_adulto);
	END;
$$

DROP TRIGGER IF EXISTS  trigger_insert_personal $$
CREATE TRIGGER trigger_insert_personal
	BEFORE INSERT ON personal
	FOR EACH ROW
	BEGIN
		SET NEW.tipo_doc = lower(NEW.tipo_doc);
		SET NEW.doc = upper(NEW.doc);
	END;
$$

DROP TRIGGER IF EXISTS  trigger_insert_responsable $$
CREATE TRIGGER trigger_insert_responsable
	BEFORE INSERT ON responsable
	FOR EACH ROW
	BEGIN
		SET NEW.tipo_doc = lower(NEW.tipo_doc);
		SET NEW.doc = upper(NEW.doc);
	END;
$$

DROP TRIGGER IF EXISTS  trigger_insert_trabaja $$
CREATE TRIGGER trigger_insert_trabaja
	BEFORE INSERT ON trabaja
	FOR EACH ROW
	BEGIN
		SET NEW.tipo_doc = lower(NEW.tipo_doc);
		SET NEW.doc = upper(NEW.doc);
	END;
$$

DROP TRIGGER IF EXISTS  trigger_insert_legajo $$
CREATE TRIGGER trigger_insert_legajo
	BEFORE INSERT ON legajo
	FOR EACH ROW
	BEGIN
		SET NEW.tipo_doc_menor = lower(NEW.tipo_doc_menor);
		SET NEW.doc_menor = upper(NEW.doc_menor);
	END;
$$

DROP TRIGGER IF EXISTS  trigger_create_historia $$
CREATE TRIGGER trigger_create_historia
	AFTER INSERT ON menores
	FOR EACH ROW
	BEGIN
		Insert into historia(tipo_doc_menor,doc_menor) Values
			(NEW.tipo_doc,NEW.doc);
	END;
$$

DROP TRIGGER IF EXISTS  trigger_create_antecedente $$
CREATE TRIGGER trigger_create_antecedente
	BEFORE INSERT ON antecedente
	FOR EACH ROW
	BEGIN
		SET NEW.descripcion = lower(NEW.descripcion);
	END;
$$

DROP TRIGGER IF EXISTS  trigger_create_episodio $$
CREATE TRIGGER trigger_create_episodio
	BEFORE INSERT ON episodio
	FOR EACH ROW
	BEGIN
		SET NEW.descripcion_ep = lower(NEW.descripcion_ep);
	END;
$$

DROP TRIGGER IF EXISTS  trigger_create_medicacion $$
CREATE TRIGGER trigger_create_medicacion
	BEFORE INSERT ON medicacion
	FOR EACH ROW
	BEGIN
		SET NEW.nombre_med= lower(NEW.nombre_med);
	END;
$$

DROP TRIGGER IF EXISTS  trigger_update_persona $$
CREATE TRIGGER trigger_update_persona
	BEFORE UPDATE ON persona
	FOR EACH ROW
	BEGIN
		SET NEW.updated_at = NOW();
	END;
$$

DROP TRIGGER IF EXISTS  trigger_update_menores $$
CREATE TRIGGER trigger_update_menores
	AFTER UPDATE ON menores
	FOR EACH ROW
	BEGIN
		UPDATE persona SET updated_at = NOW()
			WHERE (NEW.tipo_doc = persona.tipo_doc AND NEW.doc = persona.doc);
	END;
$$

DROP TRIGGER IF EXISTS  trigger_update_visitante $$
CREATE TRIGGER trigger_update_visitante
	AFTER UPDATE ON visitante
	FOR EACH ROW
	BEGIN
		UPDATE persona SET updated_at = NOW()
			WHERE (NEW.tipo_doc = persona.tipo_doc AND NEW.doc = persona.doc);
	END;
$$

DROP TRIGGER IF EXISTS  trigger_update_personal $$
CREATE TRIGGER trigger_update_personal
	AFTER UPDATE ON personal
	FOR EACH ROW
	BEGIN
		UPDATE persona SET updated_at = NOW()
			WHERE (NEW.tipo_doc = persona.tipo_doc AND NEW.doc = persona.doc);
	END;
$$

delimiter ;
