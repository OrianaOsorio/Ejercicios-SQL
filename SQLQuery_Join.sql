use Northwind

/*
1. basados en la diapositiva 51 realice: obtener un listado con: id de la orden, 
id del transportador y el nimbre del mismo
*/

SELECT DISTINCT ORD.OrderID, TRANS.ShipperID, TRANS.CompanyName 
	FROM dbo.Shippers AS TRANS
	INNER JOIN dbo.Orders AS ORD
	ON TRANS.ShipperID = ORD.ShipVia
	WHERE TRANS.ShipperID = 2
	ORDER BY ORD.OrderID;
	
	
/*
2.Obner un listado con: el ID del empleado, nombre del empleado, fecha de nacimiento del 
empleado y id del territorio, solo para quellos empleados que hallan nacido antes del milenio, 
ordenar por fecha de nacimiento DESC
*/


SELECT DISTINCT EMPL.EmployeeID, EMPL.FirstName, EMPL.BirthDate, TERR.TerritoryID
	FROM dbo.Employees AS EMPL
	INNER JOIN dbo.EmployeeTerritories AS TERR
	ON EMPL.EmployeeID = TERR.EmployeeID
	WHERE EMPL.BirthDate < '01-01-2000'
	ORDER BY EMPL.BirthDate;
	
	
/*
3.OBTENER UN LISTADO CON EL ID DEL JEFE, EL ID DE LOS SUBORDINADOS, EL NOMBRE DEL JEFE Y DE LOS SUBORDINADOS
*/
	
	
SELECT DISTINCT JEFE.EmployeeID, JEFE.FirstName, SUB.EmployeeID, SUB.FirstName
	FROM dbo.Employees AS JEFE
	INNER JOIN dbo.Employees AS SUB
	ON JEFE.EmployeeID = SUB.ReportsTo;
	
	
/*
4.OBTENER UN LISTADO CON EL ID DE LA CATEGORIA, EL NOMBRE DE LA CATEGORIA, EL NOMNBRE DEL PRODUCTO Y EL NUMERO DE LA
ORDEN PARA AQUELLOS PRODUCTOS QUE SE HAN VENDIDO; LAS VENTAS DEBEN SUPERAR LAS DIEZ UNIDADES.
*/


SELECT DISTINCT CATEG.CategoryID, CATEG.CategoryName, PROD.ProductName, ORD.OrderID
	FROM DBO.Categories AS CATEG
	INNER JOIN DBO.Products AS PROD
	ON CATEG.CategoryID = PROD.CategoryID
	INNER JOIN DBO.Order_Details AS ORDD
	ON PROD.ProductID = ORDD.ProductID
	INNER JOIN DBO.Orders AS ORD
	ON ORDD.OrderID = ORD.OrderID
	WHERE ORDD.Quantity > 10;
	
	
	
/*
5.OBTENER UN LISTADO DE LAS CATEGORIAS Y SUS PRODUCTOS, INCLUIR AQUELLOS PRODUCTOS QUE NO POSEEN CATEGORIA.
*/
	
SELECT CAT.CategoryName, PROD.ProductID, PROD.ProductName, PROD.CategoryID
	FROM Categories AS CAT
	LEFT JOIN 	Products AS PROD
	ON CAT.CategoryID = PROD.CategoryID
	WHERE PROD.CategoryID = NULL;
	
	
/*
6.OBTENER UN LISTADO DE TODOS LOS PROVEEDORES QUE SUMINISTREN O NO PRODUCTOS
*/	
	
SELECT PROD.SupplierID, SUP.CompanyName
	FROM Products AS PROD
	RIGHT JOIN Suppliers AS SUP
	ON PROD.SupplierID = SUP.SupplierID;	
	
	
	
	/*la clave es la tabla que coloco ala derecha del right join es la que tine los nulos*/
	
	
INSERT INTO PRODUCTS VALUES ('AAA', NULL, NULL, NULL, NULL, NULL, NULL, NULL);	
