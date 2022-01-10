/*--------31/08/2016----------------*/

/*
Realizar un script que cree una tabla con los siguientes atributos
cod_Empleado primary key autoincremental entero,
nombres varchar de 30, con valor por defecto Juliana,
apellidos varchar de 50 no nulo,
direccion unique,
telefono unique,
sexo tipo bit,
fecha_nacimiento date
*/
CREATE DATABASE BdeD6B;
USE BdeD6B;
CREATE TABLE tbl_Empleados
(cod_Empleado INT IDENTITY(1,1), 
nombre VARCHAR(30)DEFAULT 'Juliana',
apellidos VARCHAR(50)NOT NULL,
direccion VARCHAR(30),
telefono VARCHAR(10),
sexo BIT,
fecha_nacimiento DATE NOT NULL,
salario INT CHECK (salario > 699999 and salario < 3000001),
CONSTRAINT PK_cod_Empleado PRIMARY KEY (cod_Empleado),
CONSTRAINT UQ_direccion UNIQUE (direccion),
CONSTRAINT UQ_telefono UNIQUE (telefono));

/*
Horas Trabajadas (HT)
T tipo
Creamos primero la tabla tbl_Tipo_HT
*/
CREATE TABLE tbl_Horas_Trabajadas(
id_HT INT IDENTITY (1,1),
cod_Empleado INT NOT NULL,
ID_THT TINYINT NOT NULL,
cantidad TINYINT NOT NULL,
CONSTRAINT PK_id_HT PRIMARY KEY (id_HT),
CONSTRAINT FK_cod_Empleado FOREIGN KEY (cod_Empleado) REFERENCES tbl_Empleados,
CONSTRAINT FK_tipo_HT FOREIGN KEY (id_THT) REFERENCES tbl_Tipo_HT);

/*

*/
CREATE TABLE tbl_Tipo_HT (
id_THT TINYINT IDENTITY (1,1),
nombre_THT VARCHAR(20) NOT NULL,
porcentaje_THT DECIMAL (4,2) NOT NULL,
CONSTRAINT PK_id_tHT PRIMARY KEY (id_THT));

/*Lo han contratado para realizar una base de datos de una biblioteca, la cual desea manejar 
la reserva que hacen los usuarios de los libros, no se olvide de caracterizar los libros 
igual que los clientes*/
  
CREATE TABLE tbl_Usuario
(cod_Usuario INT IDENTITY(1,1), 
nombre VARCHAR(30)NOT NULL,
apellidos VARCHAR(50)NOT NULL,
direccion VARCHAR(30),
telefono VARCHAR(10),
sexo BIT,
fecha_nacimiento DATE NOT NULL,
CONSTRAINT PK_cod_Usuario PRIMARY KEY (cod_Usuario),
CONSTRAINT UQ_direccion UNIQUE (direccion),
CONSTRAINT UQ_telefono UNIQUE (telefono));

CREATE TABLE tbl_Autor (
  id_Autor INT IDENTITY (1,1),
  nombre varchar(20) NOT NULL,
  apellido varchar(20) NOT NULL,
  CONSTRAINT PK_id_Autor PRIMARY KEY (id_Autor));

CREATE TABLE tbl_Libro(
  id_Libro INT IDENTITY(1,1),
  titulo VARCHAR(20) NOT NULL,
  fechaPublicacion DATE NOT NULL,
  precio decimal(20,2) NOT NULL,
  CONSTRAINT PK_id_Libro PRIMARY KEY (id_Libro),
  CONSTRAINT FK_id_Autor FOREIGN KEY (id_Autor) REFERENCES tbl_Autor,);
  
CREATE TABLE tbl_Prestamo (
  id_Prestamo INT IDENTITY(1,1),
  fecha_Prestamo DATE NOT NULL,
  fecha_Devolucion DATE,
  id_Libro INT NOT NULL,
  cod_Usuario INT NOT NULL,
  CONSTRAINT PK_id_Prestamo PRIMARY KEY (id_Prestamo),
  CONSTRAINT FK_id_Libro FOREIGN KEY (id_Libro) REFERENCES tbl_Libro)
  CONSTRAINT FK_cod_Usuario FOREIGN KEY (cod_Usuario) REFERENCES tbl_Usuario);
   