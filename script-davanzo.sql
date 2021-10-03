CREATE DATABASE IF NOT EXISTS notas_db;
USE notas_db;
DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE
);
LOCK TABLES usuarios WRITE;
INSERT INTO
  usuarios
VALUES
  (DEFAULT, "Facundo Davanzo", "facaloco@gmail.com"),(DEFAULT, "Lorenzo Tammaro", "lorentam@gmail.com"),(DEFAULT, "Henry Jones", "indiana@hotmail.com"),(DEFAULT, "Harry Flynn", "harryfln@gmail.com"),(DEFAULT, "Luke Walker", "starkiller@gmail.com"),(DEFAULT, "Albus Delight", "albusdlt@yahoo.com"),(DEFAULT, "Luz Black", "luchiblack@gmail.com"),(DEFAULT, "Miranda Ce", "mimice@gmail.com"),(DEFAULT, "Rosario Olivo", "rosioli@hotmail.com"),(
    DEFAULT,
    "Gustavo Vara",
    "delpierovara@yahoo.com"
  );
UNLOCK TABLES;
DROP TABLE IF EXISTS notas;
CREATE TABLE notas (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    creado_el DATE NOT NULL,
    ultima_modificacion DATE NOT NULL,
    descripcion VARCHAR(500) NOT NULL,
    eliminar TINYINT NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios (id)
  );
LOCK TABLES notas WRITE;
INSERT INTO
  notas
VALUES
  (
    DEFAULT,
    "La primera nota",
    "El origen de esta prueba de notas de texto, en donde se encuentra la primera nota",
    "2001/09/26",
    "2021/01/01",
    0,
    1
  ),
  (
    DEFAULT,
    "Salir afuera",
    "Salir afuera de casa para realizar deporte",
    "2006/02/20",
    "2021/06/01",
    0,
    5
  ),
  (
    DEFAULT,
    "Pagar cuentas",
    "Pagar cuentas pendientes por deuda tomada",
    "2021/07/15",
    "2021/10/01",
    1,
    10
  ),
  (
    DEFAULT,
    "Rendir ventas",
    "Rendir ventas realizadas hace unos meses",
    "2021/08/25",
    "2021/01/02",
    1,
    8
  ),
  (
    DEFAULT,
    "Estudiar",
    "Estudiar lo asignado, realizar las tareas y mantenerse al día con las lecturas",
    "2010/04/16",
    "2015/03/08",
    1,
    3
  ),
  (
    DEFAULT,
    "Jugar",
    "Jugar juegos con mi hermano",
    "2012/12/12",
    "2020/01/01",
    0,
    6
  ),
  (
    DEFAULT,
    "Salir de fiesta",
    "Salir de joda a una fiesta con mis amigos el fin de semana",
    "2017/12/10",
    "2018/05/13",
    0,
    4
  ),
  (
    DEFAULT,
    "Leer libro",
    "Leer el señor de los anillos 2 horas al día",
    "2021/10/03",
    "2021/10/06",
    1,
    7
  ),
  (
    DEFAULT,
    "Ver pelicula",
    "Ver la nueva pelicula de James Bond en el cine",
    "2005/11/12",
    "2008/04/03",
    1,
    2
  ),
  (
    DEFAULT,
    "El final de la prueba",
    "El final de esta prueba de notas de texto, en donde se encuentra la ultima nota",
    "2001/10/03",
    "2021/10/05",
    0,
    9
  );
UNLOCK TABLES;
DROP TABLE IF EXISTS categorias;
CREATE TABLE categorias (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
  );
LOCK TABLES categorias WRITE;
INSERT INTO
  categorias
VALUES
  (DEFAULT, "Música"),(DEFAULT, "Programación"),(DEFAULT, "Entretenimiento"),(DEFAULT, "Deporte"),(DEFAULT, "Finanzas"),(DEFAULT, "Economía"),(DEFAULT, "Salud"),(DEFAULT, "Religion"),(DEFAULT, "Politica"),(DEFAULT, "Gaming");
UNLOCK TABLES;
DROP TABLE IF EXISTS categoria_nota;
CREATE TABLE categoria_nota (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nota_id INT NOT NULL,
    FOREIGN KEY (nota_id) REFERENCES notas (id),
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categorias (id)
  );
LOCK TABLES categoria_nota WRITE;
INSERT INTO
  categoria_nota
VALUES
  (DEFAULT, 1, 2),(DEFAULT, 2, 4),(DEFAULT, 3, 5),(DEFAULT, 4, 6),(DEFAULT, 5, 2),(DEFAULT, 6, 10),(DEFAULT, 7, 3),(DEFAULT, 8, 3),(DEFAULT, 9, 3),(DEFAULT, 10, 2);
UNLOCK TABLES;