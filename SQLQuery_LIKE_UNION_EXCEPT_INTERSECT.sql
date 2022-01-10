USE Northwind


/*basados en ejemplo de la diapositiva # 44 proyecte de la tabla proveedores:
Nombre de la compañia, el pais y la ciudad, solo para aquellas ciudades cuyo nombre empiece por o Mayuscula y que 
se encuentren en España o Japon. Observacion, debe urilizar una variable tipo caracter a la cual le lleve la O mayuscula 
y con la cual hagas el like */

declare @var varchar(7)

set @var = 'O'

SELECT CompanyName, Country, City from dbo.Suppliers
where City like @var + '%' and (Country = 'japan' or Country = 'spain')

/*Dos tablas son compatibles para la Union si los atributos que proyecto en ambas tablas son del mismo tipo y en el 
mismo orden*/

/*Realizar la Union entre los transportadores y los provedores, proyectando los atributos que sean compatibles para la union */


SELECT CompanyName, ShipperID, Phone
	FROM dbo.Shippers
UNION ALL
SELECT CompanyName, SupplierID, Phone
	FROM dbo.Suppliers
GO

/*Basados en la diapositiva 48 realice:
proyecte el literal "territorio: ,para todos los territorios que contengan 
una o en el intermedio
no usar declaracion de variables y el alias de la columna es descripción
*/
SELECT TerritoryID, 'Territorio: '+TerritoryDescription AS Descripcion
FROM Territories
WHERE TerritoryDescription LIKE '%O%'

/*Diferencia 
Las dos tablas que participan en la diferencia deben ser compatibles para la unión 
es decir deben ser el mismo número de parámetros y del mismo tipo.

Basado en la diapositiva 49 realice
Proyecte los clientes que no posean ubicación
demografica
*/
SELECT CustomerID
FROM Customers
EXCEPT
SELECT CustomerTypeID
FROM CustomerDemographics

/*INTERSECCION
Basados en la diapositiva 50 realice:
Obtener un listado de los empleados que hayan realizado ordenes de compra
*/
SELECT EmployeeID
FROM Employees
INTERSECT
SELECT EmployeeID
FROM Orders

/*Obtener un listado de los empleados que no hayan realizado ordenes
*/
SELECT EmployeeID
FROM Employees
EXCEPT
SELECT EmployeeID
FROM Orders

/*Obtener un listado de todos los productos que posean categorias*/

SELECT CategoryID
FROM Products
INTERSECT 
SELECT CategoryID
FROM Categories