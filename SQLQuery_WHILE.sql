DECLARE @id INT
SET @id = 3
WHILE EXISTS (SELECT *
			FROM dbo.Shippers
			WHERE ShipperID = @id)
		BEGIN 
			SELECT CompanyName, Phone
				FROM dbo.Shippers
				WHERE ShipperID = @id
				BREAK
		END




DECLARE @Cnt tinyint

SET @Cnt = 10

WHILE @Cnt > 0

BEGIN
            IF (@Cnt %2!=0)
            BEGIN
                  PRINT 'el numero' + CAST(@Cnt AS CHAR (3))+ 'es impar’:'    
            END        
                  SET @Cnt=@Cnt-1
END





DECLARE @Cnot tinyint

SET @Cnot = 10
WHILE @Cnot > 0

BEGIN
            IF (@Cnot % 2 = 0)
            BEGIN
                  PRINT 'el numero' + CAST(@Cnot AS CHAR (3)) + 'es par'
                  SET @Cnot = @Cnot - 1
            END  
           ELSE
            BEGIN 
					SET @Cnot = @Cnot - 1     
                 CONTINUE
            END 
END


USE Northwind
DECLARE @ID INT
SET @ID = 3

WHILE EXISTS (SELECT *
				FROM dbo.Shippers
				WHERE ShipperID = @ID)
		BEGIN
			SELECT CompanyName, Phone
				FROM dbo.Shippers
				WHERE ShipperID = @ID
		BREAK
	END
