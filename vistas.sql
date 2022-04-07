

-- Crear vistas (VIEW) en SQL Server

-- muestre el detalle de todas las ordenes

USE Northwind
go

SELECT * FROM dbo.Orders;

SELECT * FROM Order_Details;

SELECT *FROM dbo.Products;

SELECT Order_Details.OrderID, Order_Details.ProductID, products.UnitPrice, ProductName, Quantity, Discount, UnitsInStock, OrderDate
FROM Orders, Order_Details, Products;


-- Crear vista (VIEW) en SQL Server

CREATE VIEW detalle_ordenes
as
SELECT Order_Details.OrderID, Order_Details.ProductID, products.UnitPrice, ProductName, Quantity, Discount, UnitsInStock, OrderDate
FROM Orders, Order_Details, Products;


SELECT * FROM detalle_ordenes


EXEC sp_helptext detalle_ordenes; -- Procedimento almacenado el cual muestra origen de vistas (VIEW)


ALTER VIEW detalle_ordenes with encryption 
as 
SELECT Order_Details.OrderID, Order_Details.ProductID, products.UnitPrice, ProductName, Quantity, Discount, UnitsInStock, OrderDate
FROM Orders, Order_Details, Products;


--a. Mostrar el código del producto, el nombre del producto y el precio por unidad de todos los productos de la empresa.

CREATE VIEW productos
as
SELECT [ProductID] as 'ID', [ProductName] as 'Nombre', unitprice as 'precioUnitario' from Products
go

select * from productos


--b. Mostrar todos los productos cuya categoria sea Beverages

CREATE VIEW productos_beverages
as
SELECT productid as 'ID', productname as 'Nombre', unitprice as 'precioUnitario'
FROM Products
WHERE CategoryID = (select CategoryID from Categories where CategoryName = 'Beverages')
go

select * from productos_beverages

--c. Mostrar los datos del cliente y las fechas de las ordenes que estos han realizado

CREATE VIEW clientes_fecha
as
SELECT A. * , O.OrderDate as 'fechaOrden'
from Customers A
INNER JOIN Orders O ON O.CustomerID = A.CustomerID
go

select * from clientes_fecha

--d. Cuantos productos existen por cada categoria

CREATE VIEW inventario
as
SELECT COUNT(A.Productid) as 'Productos por categoria', C.CategoryName as 'Categoria'
from Products A
inner join Categories C On C.CategoryID = A.CategoryID
group by C.CategoryName
go

select * from inventario


--e. Mostrar el promedio de los precios unitarios de las categorias: Produce y Confections

create view promedio
as
select avg(A.unitprice) as 'Promedios precio unitario', C.CategoryName as 'Categoria'
from Products A
inner join Categories C on C.CategoryID = A.CategoryID
where A.CategoryID in
(select CategoryID from Categories where CategoryName = 'Produce' or CategoryName = 'Confections')
group by C.CategoryName
go

select * from promedio