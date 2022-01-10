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
CONSTRAINT PK_cod_Usuario PRIMARY KEY (cod_Usuario));

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
  id_Autor INT NOT NULL,
  CONSTRAINT PK_id_Libro PRIMARY KEY (id_Libro),
  CONSTRAINT FK_id_Autor FOREIGN KEY (id_Autor) REFERENCES tbl_Autor);
  
CREATE TABLE tbl_Prestamo (
  id_Prestamo INT IDENTITY(1,1),
  fecha_Prestamo DATE NOT NULL,
  fecha_Devolucion DATE,
  id_Libro INT NOT NULL,
  cod_Usuario INT NOT NULL,
  CONSTRAINT PK_id_Prestamo PRIMARY KEY (id_Prestamo),
  CONSTRAINT FK_id_Libro FOREIGN KEY (id_Libro) REFERENCES tbl_Libro,
  CONSTRAINT FK_cod_Usuario FOREIGN KEY (cod_Usuario) REFERENCES tbl_Usuario);
  
  
  --Instruccion que crea los esquemas
  CREATE SCHEMA LIB;
  
  -- La siguiente instruccion muestra los esquemas
  SELECT NAME FROM sys.schemas;
  
  --Asigna una tabla a un esquema
  ALTER SCHEMA LIB
	TRANSFER tbl_Empleados;
	
  -- para devolver al esquema anterior
  ALTER SCHEMA dbo
	TRANSFER LIB.tbl_Empleados;
	
	--Elimina un esquema
	DROP SCHEMA LIB;
	
	--Consultar los esquemas
	SELECT NAME FROM sys.schemas;
	
	
--Agrega un constraint a una tabla ya existente
ALTER TABLE tbl_Empleados
ADD CONSTRAINT UQ_apellidos UNIQUE (apellidos); 

--Elimina un constraint
ALTER TABLE tbl_Empleados
DROP CONSTRAINT UQ_apellidos;

--Adiciona un campo o atributo a una tabla ya existente
ALTER TABLE tbl_Empleados
ADD correo VARCHAR(50);

--Elimina una columna
ALTER TABLE tbl_Empleados
DROP COLUMN correo;

--Cambia el tipo de dato de un atributo
ALTER TABLE tbl_Empleados
ALTER COLUMN sexo VARCHAR(10);
	
--renombra una columna
 SP_RENAME 'dbo.tbl_Empleados.sex' , 'sexo';