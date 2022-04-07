/*UTILIZANDO LA BASE DATOS NORTWIND OBTENER UN LISTADO CON EL ID DE LA ORDEN, LA FECHA DE LA ORDEN,
 EL NOMBRE DEL EMPLEADO QUE ATENDIO LAS ORDENES DEL DÍA 05 DE JLUIO DE 1996, ADEMAS DEBE MOSTRAR 
 LA DESCRIPCIÓN DEL TERRITORIO A LA CUAL PERTENECE EL EMPLEADO.*/


 USE Northwind


 SELECT ORD.OrderDate, ORD.OrderDate, EMP.FirstName, EMP.LastName, TER.TerritoryID
	FROM ORDERS AS ORD
	INNER JOIN Employees AS EMP
	ON ORD.EmployeeID = EMP.EmployeeID
	INNER JOIN EmployeeTerritories AS TER
	ON EMP.EmployeeID = TER.EmployeeID
	WHERE ORD.OrderDate = '05-07-1996';


/* pubs: obtener un listado con el titulo de el libro y el tipo de libro para aquellos libros que hallan
 sido escritos por el señor de nombre Johnson. Utilice subconsultas (autor, tittlesautos, tittles)*/



USE pubs

SELECT title, type
	FROM titles
	WHERE title_id IN (SELECT title_id
							FROM titleauthor
							WHERE au_id IN (SELECT au_id
											FROM authors
											WHERE au_fname = 'Johnson'))

/*Nota: las subconsultas se deben empezar de adentro hacia afuera, de abajo hacia arriba*/




/*Nortwind: obtener el promedio de las cantidades vendidas por cada producto*/

USE Northwind

SELECT [ProductID],  AVG(Quantity) AS Promedio
	FROM [Order Details]
	GROUP BY [ProductID]
GO


/*CLONAR LA TABLA JOBS Y LA LLAMA NEWJOBS  DE LA BD PUBS VER PAGINA 82 A LA 84*/


USE pubs

SELECT * INTO NEW_JOBS 
	FROM JOBS;


/*UTILIZANDO LA TABLA NEW_JOBS ACTUALICE LA DESCRIPCIÒN DEL CARGO CUYO ID ES 5  POR MANAGEMENT*/


SELECT *
	FROM NEW_JOBS





/*ELIMINAR DE LA TABLA NEW_JOBS LOS CARGOS CON ID 3 Y 9*/

DELETE FROM NEW_JOBS
	WHERE job_id = 3 OR job_id = 9;


/* OBTENER UN LISTADO CON LOS CARGOS QUE NO ESTAR EN NEW_JOBS*/

SELECT *
	FROM JOBS
EXCEPT
SELECT *
	FROM NEW_JOBS;


/*TRUNCAR DE LA TABLA JOBS*/

