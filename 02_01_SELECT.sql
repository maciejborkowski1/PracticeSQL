USE AdventureWorks2014
GO

select * from Person.Person

SELECT
	s.ProductID
	,s.[Name]
	,s.ListPrice
	,s.Color
FROM Production.Product AS s
WHERE
	Color = 'blue'

	SELECT
	s.ProductID
	,s.[Name]
	,s.ListPrice
	--,s.Color
FROM Production.Product AS s
WHERE
	Color = 'blue'

USE TestDB
GO

SELECT * FROM AdventureWorks2014.Production.ScrapReason
