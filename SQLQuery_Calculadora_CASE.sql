/* 1. Si existe un empleado con el nombre Robert y el apellido King debera proyectar la información 
de dicho empleado */
USE Northwind

SELECT *
FROM dbo.Employees
WHERE FirstName = 'Robert' and LastName = 'King'

/* 2. Si existen empleados que vivan en USA y en la ciudad de Tacoma proyectar su nombre la fecha de
nacimiento y su direccion*/

SELECT LastName, FirstName, BirthDate, Address
FROM dbo.Employees
WHERE Country = 'USA' and City = 'Tacoma'


/*3. Utilizando la estructura case realice una calculadora: nota a la calculadora apliquele una
opcion por Default que el cuadrado de cualquiera de los 2 numeros la funcion es power, ver CASE en diapositiva 15, 
ver CAST en diapositiva 160*/

DECLARE @num1 FLOAT,
		@num2 FLOAT,
		@operacion VARCHAR (20),
		@opcion CHAR
		
SET @num1 = 9
SET	@num2 =	3	
SET	@opcion = 3
SET @operacion = (CASE @opcion
		WHEN '1' THEN 'Suma: '+CAST ((@num1 + @num2)AS CHAR(3))
		WHEN '2' THEN 'Resta: '+CAST ((@num1 - @num2)AS CHAR(3))
		WHEN '3' THEN 'Division: '+CAST ((@num1 / @num2)AS CHAR(3))
		WHEN '4' THEN 'Multiplicacion: '+CAST ((@num1 * @num2)AS CHAR(3))
		WHEN '5' THEN 'Cuadrado: '+CAST ((POWER(@num1,@num2))AS CHAR(3))
		END)
PRINT @operacion


/*4. Haga un ciclo del 1 hasta el 60 mostrando los números pares y los númereos impares. El algoritmo 
terminará cuando el número elevado al cuadrado sea 36. No podrá romper el ciclo con break*/

DECLARE @num INT
SET @num = 1
WHILE (POWER(@num,2)!=36)
	BEGIN
		IF ((@num % 2)=0)
			PRINT 'Par: '+ CAST (@num AS CHAR(3))
		ELSE
			PRINT 'Impar: '+ CAST (@num AS CHAR(3))
		SET @num = @num + 1
	END

/*5. Crear una tabla en la cual aplique: clave primaria autogenerada, otro campo que no permita nulos, 
otro cuyo valor por defecto sea cero, otro que valida que los datos que permita sean mayores que 
cero y menores que 10, otro que sea único*/

CREATE DATABASE ENSA;
USE ENSA;
CREATE TABLE tbl_Alumnos
(cod_Alumno INT IDENTITY(1,1), 
nombre VARCHAR(30),
apellidos VARCHAR(50)NOT NULL,
direccion VARCHAR(30),
telefono VARCHAR(10),
sexo BIT DEFAULT 0,
fecha_nacimiento DATE NOT NULL,
edad INT CHECK (edad > 0 and edad < 10),
CONSTRAINT PK_cod_Alumno PRIMARY KEY (cod_Alumno),
CONSTRAINT UQ_telefono UNIQUE (telefono));

/*6. Hacer una tabla que acompañe a la primera lo más importante es que esta tenga la foreign key para
asociarla con la primera*/

CREATE TABLE tbl_CursosMatriculados
(cod_Curso INT IDENTITY(1,1), 
descripcion VARCHAR(30)NOT NULL,
cod_Alumno1 INT
CONSTRAINT PK_cod_Curso PRIMARY KEY (cod_Curso),
CONSTRAINT FK_cod_Alumno FOREIGN KEY (cod_Alumno1) REFERENCES dbo.tbl_Alumnos);

/*7. Matricule las dos tablas en el esquema tll*/
 CREATE SCHEMA TLL;
 
 ALTER SCHEMA TLL
	TRANSFER tbl_Alumnos;
	
 ALTER SCHEMA TLL
	TRANSFER tbl_CursosMatriculados;