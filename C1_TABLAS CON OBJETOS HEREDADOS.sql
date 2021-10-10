
DROP TABLE RESERVACION CASCADE CONSTRAINTS; 
DROP TABLE PRODUCTO CASCADE CONSTRAINTS; 
DROP TABLE TIPO_SALA CASCADE CONSTRAINTS; 
DROP TABLE OPINION_ESPECTADOR CASCADE CONSTRAINTS; 
DROP TABLE PROMOCION CASCADE CONSTRAINTS; 
DROP TABLE TICKET CASCADE CONSTRAINTS; 
DROP TABLE CLIENTE CASCADE CONSTRAINTS; 
DROP TABLE EMPLEADO CASCADE CONSTRAINTS; 
DROP TABLE SALA CASCADE CONSTRAINTS; 
DROP TABLE ROL CASCADE CONSTRAINTS; 
DROP TABLE SERVICIO CASCADE CONSTRAINTS; 
DROP TABLE REPARTO CASCADE CONSTRAINTS; 
DROP TABLE PELICULA CASCADE CONSTRAINTS; 
DROP TABLE CARTELERA CASCADE CONSTRAINTS; 
DROP TABLE CINE CASCADE CONSTRAINTS; 
DROP TABLE FUNCION CASCADE CONSTRAINTS; 

DROP TYPE NOMBRE_CLIENTE;
DROP TYPE NOMBRE_EMPLEADO;
DROP TYPE FICHA_PELICULA;
DROP TYPE DIRECCION_CINE;

CREATE TYPE NOMBRE_CLIENTE AS OBJECT(
NOMBRE1 VARCHAR(20),
NOMBRE2 VARCHAR(20),
APELLIDO1 VARCHAR(20),
APELLIDO2 VARCHAR(20)
);


CREATE TYPE NOMBRE_EMPLEADO AS OBJECT(
NOMBREUNO VARCHAR(20),
NOMBREDOS VARCHAR(20),
APELLIDOUNO VARCHAR(20),
APELLIDODOS VARCHAR(20)
);

CREATE TYPE FICHA_PELICULA AS OBJECT(
TITULO_DISTRIBUCION VARCHAR(80), 
TITULO_ORIGINAL VARCHAR(80), 
INDICE VARCHAR(80), 
GUION VARCHAR(80), 
BASADA_EN VARCHAR (80), 
EFECTOS_ESPECIALES VARCHAR(50), 
PAIS_ORIGEN VARCHAR(80), 
ANO_PRODUCCION NUMBER, 
GENERO VARCHAR(30), 
DURACION NUMBER(4), 
CLASIFICACION VARCHAR(50), 
IDIOMA_ORIGINAL VARCHAR(20), 
SINOPSIS VARCHAR (100)
);

CREATE TYPE DIRECCION_CINE AS OBJECT(
CALLE VARCHAR(30), 
NUMERO NUMBER(6), 
COD_POSTAL NUMBER(5), 
ESTADO VARCHAR(30), 
ALCALDIA VARCHAR(50) 
);


-- 1
CREATE TABLE RESERVACION (
ID_RESERVACION INT,
TIPO_PROYECCION VARCHAR(30),
HORA_INICIAL VARCHAR(6), 
FECHA DATE,
COSTO NUMBER(10),
DESCRIPCION VARCHAR(80)
);

-- 2 
CREATE TABLE PRODUCTO (
ID_PRODUCTO NUMBER(10),
DESCRIPCION VARCHAR(50),
COSTO NUMBER(10),
CANTIDAD NUMBER(10)
);

--3 
CREATE TABLE TIPO_SALA (
ID_TIPO INT,
CATEGORIA VARCHAR(10) 
);

--4
CREATE TABLE OPINION_ESPECTADOR (
ID_OPINION INT, 
NOMBRE VARCHAR(50),
EDAD NUMBER(3),
CALIFICACION VARCHAR(20), 
COMENTARIO VARCHAR(120),
FECHA DATE
);


--5
CREATE TABLE PROMOCION (
ID_PROMOCION INT,
DESCRIPCION VARCHAR(100),
CLIENTE_APLICABLE VARCHAR(30), 
IDENTIFICACION_CLIENTE VARCHAR(30), 
DESCUENTO VARCHAR(100)
);

--6
CREATE TABLE TICKET (
ID_TICKET INT,
FORMA_PAGO VARCHAR(20), 
MONTO NUMBER(10),
SALDO_PUNTOS NUMBER(10),
SALDO_ACUMULADO NUMBER(10), 
DESCRIPCION VARCHAR(80)
);

--7 
CREATE TABLE CLIENTE (
ID_CLIENTE INT, 
NOMBRE NOMBRE_CLIENTE, 
SEXO VARCHAR(10),
EDAD NUMBER(2),
CORREO VARCHAR(50), 
TELEFONO NUMBER(10),
MEMBRESIA VARCHAR(20), 
ID_RESERVACION INT
);

--8
CREATE TABLE EMPLEADO (
ID_EMPLEADO NUMBER(20), 
NOMBRE NOMBRE_EMPLEADO, 
PUESTO VARCHAR(20), 
SUELDO NUMBER(6), 
EDAD NUMBER(2), 
HORAS_LABORALES VARCHAR(12), 
ANTIGUEDAD_MESES NUMBER(10), 
ID_GERENTE INT
);

--9
CREATE TABLE SALA (
ID_SALA INT,
NOMBRE VARCHAR(7), 
ID_ASIENTO VARCHAR(4), 
ESTADO_ASIENTO CHAR(1), 
TOTAL_BUTACAS INT, 
CLASIFICACION VARCHAR(7),
ID_TIPO INT
);

-- 10 
CREATE TABLE ROL (
ID_ROL INT,
ROL VARCHAR(20),
NOMBRE_ARTISTICO VARCHAR(50),
NACIONALIDAD VARCHAR(22),
ID_DIRECTOR INT
);

-- 11
CREATE TABLE SERVICIO (
ID_SERVICIO INT,
TIPO VARCHAR(30), 
COSTO NUMBER(10),
DESCRIPCION VARCHAR(150),
ID_PROMOCION INT
);

--12
CREATE TABLE REPARTO (
ID_REPARTO INT,
DIRECTORES VARCHAR(100),
GUIONISTAS VARCHAR(100),
PRODUCTORES VARCHAR(100),
ACTORES VARCHAR(100),
ACTORES_DOBLAJE  VARCHAR(100),
BANDA_SONORA VARCHAR(100),
EQUIPO_TECNICO VARCHAR(100),
LISTA_PRODUCTORAS VARCHAR(100),
EMPRESAS_PARTICIPANTES VARCHAR(100),
ID_ROL INT 
);


-- 13 
CREATE TABLE PELICULA (
ID_PELICULA INT,
FICHA FICHA_PELICULA, 
SUBTITULOS VARCHAR(2),
FECHA_ESTRENO DATE, 
URL_WEB VARCHAR(100),
ID_REPARTO INT, 
ID_OPINION INT 
);

-- 14 
CREATE TABLE CARTELERA (
ID_CARTELERA INT,
HORARIO VARCHAR(11),
FECHA DATE,
TIPO_PROYECCION VARCHAR(20),
ID_PELICULA INT
);

-- 15 
CREATE TABLE CINE (
ID_CINE INT,
NOMBRE VARCHAR(50), 
DIRECCION DIRECCION_CINE,
TELEFONO NUMBER(10),
ID_PRODUCTO INT,
ID_SALA INT,
ID_EMPLEADO INT,
ID_CARTELERA INT,
ID_SERVICIO INT 
);

-- 16
CREATE TABLE FUNCION (
ID_FUNCION INT,
DIA VARCHAR(10),
HORA_INICIO VARCHAR(6),
HORA_FIN VARCHAR(6),
ID_CLIENTE INT, 
ID_TICKET INT,
ID_CINE INT
);