USE Northwind


--1. Proyecte de la tabla Detalles de Orden (dbo.Order_Details)el id de la orden, el id del producto y el precio unitario.

SELECT * FROM dbo.Order_Details

SELECT OrderID, ProductID, UnitPrice
FROM dbo.Order_Details


 --2. Continuando con el ejercicio anterior, proyecte solo el precio unitario; no deben aparecer precios repetidos.

SELECT * FROM dbo.Order_Details

SELECT DISTINCT UnitPrice
FROM dbo.Order_Details


 --3. Continuando con el ejercicio anterior, ordene del precio más alto al precio más bajo y proyecte solo los 5 primeros.
 
SELECT * FROM dbo.Order_Details

SELECT DISTINCT TOP 5 UnitPrice
FROM dbo.Order_Details
ORDER BY UnitPrice DESC


 --4. Proyecte de la tabla Ordenes (dbo.Orders) el ShipCity y el ShipRegion; el primero ordenado ascendetemente y el
 --     segundo ordenado descendentemente
 
 SELECT * FROM dbo.Orders
 
 SELECT ShipCity, ShipRegion
 FROM dbo.Orders
 ORDER BY ShipCity ASC, ShipRegion DESC;