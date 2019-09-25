USE AdventureWorks2014


SELECT 
	h.Name 
FROM HumanResources.Department AS h


DECLARE @uni NVARCHAR(1000)
SET @uni = N''
SELECT @uni = [Name] FROM HumanResources.Department WHERE DepartmentID=1
PRINT @uni

SELECT LEN(@uni), DATALENGTH(@uni)
GO

DECLARE @uni NVARCHAR(1000)
SET @uni = N''
SELECT @uni +='/' + [Name] FROM HumanResources.Department
PRINT @uni

SELECT LEN(@uni), DATALENGTH(@uni)
GO