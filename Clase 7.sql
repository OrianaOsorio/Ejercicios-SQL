USE Northwind


--BASADO EN EL EJERCICIO 2 DE LA DIAPODITIVA 39: REALICE

/*PROYECTE EL NOIMBRE DE LA COMPAÑIA, EL NOMBRE DEL CONTACTO Y LA CIUDAD DE TODOS LOS CLIENTES. LOS ALIAS DE LAS COLUMNAS 
DEBEN SER LLAMADOS COMO SE HA ESPECIFICADO EN EL EJERCICIO.*/


select *from Customers

SELECT CompanyName AS Nombre_Compañia, ContactName AS Nombre_Contacto, City AS Ciudad
FROM dbo.Customers


--BASADO EN EL EJERCICIO 2 DE LA DIAPODITIVA 40: REALICE

/*PROYECTAR EL CODIGO O ID DEL PRODUCTO, SU NOMBRE, EL PRECIO UNITARIO, EL PRECIO CON UN DESCUENTO DEL 10%, 
EL PRECIO UNITARIO CON IVA DESPUES DEL DESCUENTO.*/

select * from Products

select ProductID, ProductName, UnitPrice, (UnitPrice * 0.9) as Descuento, ((UnitPrice * 0.9) * 1.16) as des_IVA
from dbo.Products


/*continuando con el ejercicio anterior : convierta el precio con descuento y el precio con iva a tres posiciones enteras y
tres posiciones decimales*/


select ProductID, ProductName, UnitPrice, convert(decimal(6,3),(UnitPrice * 0.9)) as Descuento, convert(decimal(6,3),((UnitPrice * 0.9) * 1.16)) as des_IVA
from dbo.Products


--BASADO EN EL EJERCICIO 2 DE LA DIAPODITIVA 41: REALICE
/*PROYECTE EL ID DEL PRODUCTO Y LA CANTIDAD SOLICITADA O PEDIDA DE ESTE, PARA OBTENER EL TOP 10 DE LOS PRODUCTOS 
QUE MAS SOLICITAN*/


select * from dbo.Order_Details


SELECT distinct top 10 ProductID, Quantity 
from dbo.Order_Details
order by  Quantity desc


--BASADO EN EL EJERCICIO 1 DE LA DIAPODITIVA 42: REALICE
/*obtener un listado con todos los atributos de la tabla detalles de orden, donde el precio unitario este entre 10 y 20
ademas que pertenezcan a los productos con codigos o id entre 50 y 100; ordenado por el id de producto. observacion: no usar 
el igual solo > <*/


select * from dbo.Order_Details

select * from dbo.Order_Details
where (UnitPrice > 9  and UnitPrice < 21) and (ProductID > 49  and ProductID < 101)
order by ProductID


--BASADO EN EL EJERCICIO 2 DE LA DIAPODITIVA 42: REALICE
/*proyecte el id del producto, su nombre y las unidades en stop. solo para aquellos productos cuyas unidades en 
stop esten entre 80 y 110*/

select * from dbo.Products

select ProductID, ProductName, UnitsInStock from dbo.Products
where (UnitsInStock BETWEEN 80 and 110)


--BASADO EN EL EJERCICIO 1 DE LA DIAPODITIVA 43: REALICE
/*proyecte todos los atributos de la tabla territorios, que se encuentren en las regiones 1 o 4, debe mostrar 27 filas.*/


select * from dbo.Territories
where RegionID IN (1,4);


--BASADO EN EL EJERCICIO 2 DE LA DIAPODITIVA 43: REALICE
/*proyecte todos los atributos de la tabla detalles de orden y alle registros huerfanos, es decir, que no posean un id de 
producto.*/


select * from dbo.Order_Details
where OrderID is NULL;


/*Tema funcion LTRIM y RTRIM (LEFT AND RIGHT): LTRIM: ELIMINA ESPACIOS A LA IZQUIERDA; RTRIM: ELIMINA ESPACIOS A LA DERECHA*/


DECLARE @Nombre Varchar (10)
SET @Nombre = '   Ana    '
SET @Nombre = LTRIM(@Nombre)
SET @Nombre = RTRIM(@Nombre)

SELECT * FROM dbo.Customers
WHERE CompanyName LIKE @Nombre;


--BASADO EN EL EJERCICIO 1 DE LA DIAPODITIVA 44: REALICE

/*DE LA TABLA EMPLEADOS PROYECTE EL ID DEL EMPLEADO, NOMBRE, APELLIDOS Y CARGO. SOLO PARA AQUELLOS 
EMPLEADOS CUYO CARGO CONTENTA UNA M MAYUSCULA EN EL MEDIO Y QUE PERTENEZCAN A LA CIUDAD DE LONDON*/



SELECT * FROM dbo.Employees

SELECT EmployeeID, LastName, FirstName, Title
FROM dbo.Employees
WHERE (Title LIKE '%M%' AND City = 'London')


