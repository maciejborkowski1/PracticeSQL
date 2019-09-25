USE AdventureWorks2014
GO

SELECT * FROM Person.Person WHERE MiddleName IS NULL
GO

SELECT * FROM Person.Person WHERE MiddleName IS NOT NULL
GO

SELECT
	p.FirstName
	,p.MiddleName
	,p.LastName
	,p.FirstName + ' ' + ISNULL(p.MiddleName+' ','') + p.LastName AS FullName
FROM Person.Person as p
GO

SELECT 
	p.ProductID
	,p.Name
	,p.Size
	,p.Weight
	,p.ListPrice
	,COALESCE(Size, CAST(Weight AS VARCHAR), CAST(ListPrice AS VARCHAR)) AS [Description]
FROM Production.Product as p
GO

SELECT 
	p.ProductID
	,p.Name
	,p.Size
	,p.Weight
	,p.ListPrice
	,COALESCE('S:'+Size, 'W:'+CAST(Weight AS VARCHAR), 'L:'+CAST(ListPrice AS VARCHAR)) AS [Description]
FROM Production.Product as p
Go