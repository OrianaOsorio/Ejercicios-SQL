USE pubs

GO
create view V_Ejemplo
AS
SELECT type, SUM(price) AS 'Total Precio'
	FROM titles
	GROUP BY type 
	HAVING SUM (price) BETWEEN 20 AND 50;
	GO

SELECT *
FROM V_Ejemplo

create view V_EjmDos
as

SELECT title, type, price
	FROM titles	
	where price is null;
	go

select *
from V_EjmDos;

/* Utilizando la B DE D NORTWIND, CONTESTE:
OBTENER UN LISTADO CON EL ID DEL DISTRIBUIDOR, EL NOMBRE DE LA COMPAÑIA 
DISTRIBUIDORA, EL ID DE LA ORDEN Y LA CIUDAD DE DISTRIBUCIÒN.
SOLO PARA LA CIUDAD DE DISTRIBUCIÒN "RIO DE JANEIRO" */

USE Northwind;
GO

CREATE VIEW V_EjmTres
AS
SELECT DISTINCT  DIST.ShipperID, DIST.CompanyName, ORDS.OrderID, ORDS.ShipCity 
	FROM Shippers AS DIST
INNER JOIN Orders AS ORDS
ON DIST.ShipperID = ORDS.ShipVia
WHERE ORDS.ShipCity = 'Rio de Janeiro';
GO

SELECT *
	FROM V_EjmTres;0
GO
/*ALTERE EL EJERCICIO ANTERIOR, ASI: A HORA NO SE DESEA PARA RIO DE 
JANEIRO SINO PARA EL PAIS*/

ALTER VIEW V_EjmTres
AS
SELECT DISTINCT  DIST.ShipperID, DIST.CompanyName, ORDS.OrderID, ORDS.ShipCountry 
	FROM Shippers AS DIST
INNER JOIN Orders AS ORDS
ON DIST.ShipperID = ORDS.ShipVia
WHERE ORDS.ShipCountry = 'Brazil';
GO


/**ELIMINAR LA VISTA QUE ACQABAMOS DE CREAR*/

DROP VIEW V_EjmTres;

/*UTILIZANDO LA B.D NORTWIND, REALIZAR EL SIGUIENTE PA: 
OBTENER LA MISMA CONSULTA D LA VISTA PASADA, SOLO QUE ESTA VEZ PODEMOS CONSULTAR POR LA CIUDAD QUE DESEEMOS*/

USE Northwind;
GO

CREATE PROCEDURE SPU_Distri_Ciudad
@Pais NVARCHAR(15)
AS
SELECT DISTINCT  DIST.ShipperID, DIST.CompanyName, ORDS.OrderID, ORDS.ShipCountry 
	FROM Shippers AS DIST
INNER JOIN Orders AS ORDS
ON DIST.ShipperID = ORDS.ShipVia
WHERE ORDS.ShipCountry = @Pais;
GO

EXEC SPU_Distri_Ciudad 'Germany'

SELECT shipCountry
	FROM Orders


/*utilizando la base de datos pubs, realice el siguiente PA: obtener el id del cargo y el nombre del cargo pra aquellos 

cargos cuyo valor minimo ESTE ENTRE 100 Y 200. EL RESULTADO DE LA EJECUCIÒN DE PA
DEBE SER INSERTADA EN UNA NUEVA TABLA.*/

USE pubs;

CREATE TABLE Tbl_Cargos(
id SMALLINT,
nombre VARCHAR (50)
);
GO


CREATE PROCEDURE SP_Cargos
AS
SELECT job_id, job_desc
	FROM jobs
	WHERE min_lvl BETWEEN 100 AND 200;

INSERT INTO Tbl_Cargos
	EXEC SP_Cargos;

SELECT *
 FROM Tbl_Cargos;

SELECT *
	FROM jobs
GO

/*CREAR UN PA QUE OBTENGA EL ID DEL LIBRO, SUBTITULO Y SU PRECIO. 
EL PA DEBERÀ SOLICITAR EL PRECIO POR EL CUAL DESEE FILTRAR*/

CREATE PROCEDURE SP_Libros
@Precio MONEY
AS
SELECT title_id, title, price
	FROM titles
	WHERE price = @Precio;
GO

EXEC SP_Libros 11.95;



SELECT title_id, title, price
FROM titles