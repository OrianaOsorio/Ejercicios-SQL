/* Proyectar la fecha de cumpleaños del empleado cuyo nombre es Davolio  
asignar automaticamente a  una variable*/

DECLARE @fecha_cumple datetime

select @fecha_cumple = BirthDate
from Employees
where LastName = 'Davolio'

print @fecha_cumple


/*Proyectar y llevar a cada variable el id de la orden, el id del cliente y id de empleado 
para la orden cuyo numero 10248*/

DECLARE @idorden int,
		@idcliente nchar(5),
		@idempleado int
	
select	@idorden = orderid,
		@idcliente = customerid,
		@idempleado = employeeid
from Orders
where OrderID = 10248

print @idorden
print @idcliente
print @idempleado


/*Declarar 2 variables tipo datetime una la llamara fechaorden, fecharequerida,
la fechaorden debera tomar aquella fecha cuyo idorden=10248, la fecharequerida  debera tomar
requiereddate orderid=10250, si ambas fechas son iguales muestre el siguiente mensaje "las fechas coinciden",
si las fecha de la orden es mayor a la requerida muestre el siguiente mensaje "es mayor", de lo contrario "requerida es mayor"*/

DECLARE @fechaorden datetime,
		@fecharequerida datetime
		
SELECT @fechaorden = orderdate
from Orders
where OrderID = 10248


SELECT @fecharequerida = RequiredDate
from Orders
where OrderID = 10250

If @fechaorden = @fecharequerida
	begin
	print 'Las fechas son iguales'
	end
		if @fechaorden > @fecharequerida
		begin
		print 'La fecha orden es mayor'
		end
			else
			begin
			print 'La fecha requerida es mayor'
			end


/*Tomando como base la diapo 14 realice lo siguiente:
Declare una variable que llevara por nombre region = 'Antioquia' si existe una region con 
este nombre, mostrar el mensaje ya existe, de lo contrario inserte un nuevo registro en la 
tabla regiòn con el valor asignado previamente*/

DECLARE @Region nchar(50),
		@idRegion int

SET @Region = 'ANTIOQUIA'
SET	@idRegion = 20

IF  EXISTS (SELECT * FROM Region
			where RegionDescription = @Region)
			BEGIN
			Print 'Ya existe la Regiòn'
			END
				ELSE
				BEGIN
				INSERT into Region
				values (@idRegion, @Region)
				END

delete from Region
where RegionID = 20

