CREATE DATABASE laboratorio;

CREATE USER 'webapp'@'10.21.40.130' IDENTIFIED BY '<PASSWORD_LOCAL>';
GRANT ALL PRIVILEGES ON laboratorio.* TO 'webapp'@'10.21.40.130';
FLUSH PRIVILEGES;

USE laboratorio;
CREATE TABLE prueba (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mensaje VARCHAR(100)
);
INSERT INTO prueba (mensaje) VALUES ('Conexion WEB-DB funcionando');
