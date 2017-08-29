DROP SCHEMA IF EXISTS ej1;
CREATE SCHEMA ej1;
use ej1;

DROP TABLE IF EXISTS articulo;
CREATE TABLE articulo(
	art_id INT NOT NULL AUTO_INCREMENT,
	descripcion varchar(40),
	precio INT,
	cantidad INT,
	stock_Min INT,
	stock_Max INT,
	mes_ult_movim DATE,
	Fecha_Vto DATE,
	Check (stock_Min < stock_Max),
	Check (precio > 0),
	PRIMARY KEY (art_id)
);

DROP TABLE IF EXISTS auditoriaArticulo;
CREATE TABLE auditoriaArticulo(
	aud_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	art_id INT,
	movimiento INT,
	fecha_mod DATE,
	FOREIGN KEY (art_id) REFERENCES articulo(art_id) 		
);



INSERT INTO articulo(descripcion,precio) VALUES 
('test1',10),
('test2',40),
('test3',70),
('test4',90),
('HOLA',0);

SELECT * FROM articulo;


delimiter $$
CREATE TRIGGER trigger_upper_desc
	BEFORE INSERT ON articulo
	FOR EACH ROW
	BEGIN
		SET NEW.descripcion=UPPER(NEW.descripcion); 
	END;
$$
delimiter ;

delimiter $$
CREATE TRIGGER trigger_insert_aud
	AFTER UPDATE ON articulo
	FOR EACH ROW
	BEGIN
		INSERT INTO auditoriaArticulo VALUES (default,NEW.art_id,NEW.precio - OLD.precio,NOW()); 
	END;
$$
delimiter ;


