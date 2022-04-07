/*utilizando la base de datos pub, realice un trigger que no permita la creación de tablas "bloquear la creación de tablas"*/

USE [pubs];
GO

CREATE TRIGGER TR_NoCrear
ON DATABASE FOR CREATE_TABLE
AS
	BEGIN
		RAISERROR('No esta permitido, Crear tablas', 10, 1)
		ROLLBACK TRANSACTION
	END

CREATE TABLE Tbl_Nueva (
	id int,
	nombre varchar(10)
)

SELECT *
	FROM Tbl_Nueva

DISABLE TRIGGER TR_NoCrear ON DATABASE;
ENABLE TRIGGER TR_NoCrear ON DATABASE;


/*UTILIZANDO PUBS  Y LA TABLA QUE SE CREO EN EL EJERCICIO ANTERIOR HACER UN TRRIGGER DEL TIPO DML, EL CUAL UNA VEZ ACTUALIZADO
UN REGISTRO DE B.D. Tbl_Nueva, EL REGISTRO ANTERIOR SE ALMACENARÁ EN UNA TABLA LLAMADA Tbl_OldNueva.*/


INSERT INTO Tbl_Nueva VALUES (10, 'FUTBOL');
INSERT INTO Tbl_Nueva VALUES (20, 'TENIS');
INSERT INTO Tbl_Nueva VALUES (30, 'NATACIÓN');

SELECT * INTO Tbl_OldNueva
	FROM Tbl_Nueva
	WHERE 1 = 2;

SELECT *
	FROM Tbl_OldNueva


/*ALTERAR LA TABLA*/
ALTER TABLE Tbl_OldNueva
	ADD Fecha SMALLDATETIME

CREATE TRIGGER TR_Actualizar
ON Tbl_Nueva
AFTER UPDATE
AS
	BEGIN
		SET NOCOUNT ON;
		INSERT INTO Tbl_OldNueva (id, nombre, Fecha)
		SELECT id, nombre, GETDATE()
			FROM Deleted
	END 
GO

UPDATE Tbl_Nueva
	SET nombre = 'Ping Pong'
	WHERE id = 20

SELECT *
	FROM Tbl_Nueva;
SELECT *
	FROM Tbl_OldNueva;




/*CREAR CURSOR:*/


-- Declaración de variables para el cursor
DECLARE @id int,
		@nombre varchar(10)


-- Declaración del cursor
DECLARE  cNuevo  CURSOR SCROLL FOR
  SELECT  id, nombre
  FROM  tbl_Nueva

--Declaración de Variables para Conversión y 
--Luego mostrar con PRINT
DECLARE  @Pid varchar(2),  @Pnombre VarChar (10)


-- Apertura del cursor
OPEN  CNuevo

--Imprimir Encabezados de Titulos
PRINT  'Id' + ' ' + 'Nombre'  


--Lectura de la primera fila del cursor
FETCH NEXT FROM CNuevo INTO @id, @nombre
WHILE (@@FETCH_STATUS = 0)
	BEGIN
		SET @Pid = CONVERT (VarChar(2), @id)
		SET @Pnombre = @nombre
		PRINT '    ' + @Pid + '      ' + @Pnombre 
		FETCH NEXT FROM CNuevo INTO @id, @nombre
	END


-- Cierre del cursor
CLOSE  CNuevo

-- Liberar  el Cursor
DEALLOCATE  CNuevo;
GO


CREATE TRIGGER TR_Nuevo
ON Tbl_Nueva
FOR INSERT 
AS
	BEGIN
		SELECT * 
			FROM Tbl_Nueva
	END

INSERT INTO Tbl_Nueva VALUES(40, 'Tenis de Mesa')
