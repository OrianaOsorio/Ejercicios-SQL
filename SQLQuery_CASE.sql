DECLARE @opcion TINYINT,
		@resultado float,
		@var1 TINYINT,
		@var2 TINYINT
		SET @var1=5
		SET @var2=3
		SET @opcion=1
		
		SET @resultado = (CASE
							WHEN @opcion = 1 THEN @var1-@var2
							WHEN @opcion = 2 THEN @var1+@var2
							WHEN @opcion = 3 THEN @var1*@var2
							ELSE @var1/@var2
						END)
		PRINT @resultado
		
/* */		
	DECLARE @opcion TINYINT,
		@resultado float,
		@var1 TINYINT,
		@var2 TINYINT
		SET @var1=5
		SET @var2=3
		SET @opcion=1
		
		SET @resultado = (CASE
							WHEN @opcion = 1 THEN @var1-@var2
							WHEN @opcion = 2 THEN @var1+@var2
							WHEN @opcion = 3 THEN @var1*@var2
							ELSE @var1/@var2
						END)
		PRINT @resultado


/* */		
DECLARE @opcion TINYINT,
		@cargo VARCHAR(30),
		@var1 TINYINT,
		@var2 TINYINT
		SET @var1=5
		SET @var2=3
		SET @opcion=2
		
		SET @cargo = (CASE
							WHEN @opcion = 1 THEN (SELECT Title
														FROM dbo.Employees
														WHERE EmployeeID = @opcion)
							WHEN @opcion = 2 THEN (SELECT Title
														FROM dbo.Employees
														WHERE EmployeeID = @opcion)
							WHEN @opcion = 3 THEN (SELECT Title
														FROM dbo.Employees
														WHERE EmployeeID = @opcion)
							WHEN @opcion = 4 THEN (SELECT Title
														FROM dbo.Employees
														WHERE EmployeeID = @opcion)
							WHEN @opcion = 5 THEN (SELECT Title
														FROM dbo.Employees
														WHERE EmployeeID = @opcion)
						END)
		PRINT @cargo