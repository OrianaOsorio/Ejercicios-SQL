CREATE INDEX INDX_PRUEBA	
	ON dbo.Employees (FirstName, BirthDate, ASC, LastName DESC);
	
SELECT * FROM sys.indexes;

DROP INDEX INDX_PRUEBA
		ON dbo.Employees;





Basados en la diapositiva treinta y las notas hacer la siguiente tabla:

USE Northwind;

CREATE TABLE tbl_prueba(
		id_pru int,
		Nom_pru varchar (10),
		Nota Tinyint 
		);




Sobre la tabla recién creada haga: 

1. Cree un indice sobre el idPrueba de forma descendente.

CREATE INDEX INDX_IndPrueb
	ON tbl_prueba (id_pru DESC);

2. Crea un indice a los dos restantes atributos el primero ascendente y el segundo descendente.

CREATE INDEX INDX_IndPrueba
	ON tbl_prueba (Nom_pru ASC, Nota DESC);

3. Verifique que los indices se hallan creado

SELECT * FROM sys.indexes;

4. Elimine los indices

DROP INDEX INDX_IndPrueba
	ON tbl_prueba;


--Adicionar columna

ALTER TABLE dbo.Employees

	ADD  nombre columna, tipo de dato;
	
	
--cambiar el tipo de dato

ALTER TABLE nombre de la tabla
	
	ALTER colum  nombre columna, tipo de dato;

	
--Adicionar restricciones
	
ALTER TABLE nombre de la tabla

	ADD	CONSTRAINT  pk_		 primary key (nombre_columna);
					fk_		 foreign key (nombre columna); References (Nom_tabl);
					uq_		 unique      (nombre columna);
					
--Eliminar restriccion 

ALTER TABLE NOMBRE DE TABLA
	
	DROP CONSTRAINT	pk_XXX;
					fk_XXX;
					uq_XXX;
					
					
--Eliminar columna

ALTER TABLE NOMBRE DE LA TABLA

	DROP COLUMN COLUMN (NOMBRE COLUMNA);
	
	
--Renombrar una columna
 
 SP_RENAME 'dbo.tbl_nombre_tabla_nombre_columna', 'Nombre_Nuevo_columna';  
					