USE AdventureWorks2014
GO

SELECT *
FROM HumanResources.Employee AS h
ORDER BY h.BirthDate DESC

SELECT
	YEAR(GetDate()) - YEAR(BirthDate) AS AGE
FROM HumanResources.Employee AS h
ORDER BY AGE ASC

SELECT
	p.ProductID
	,p.Name
	,p.ListPrice
	,p.Class AS CLASS
	,p.Style AS STYLE
	,p.Color
FROM Production.Product as p
ORDER BY CLASS DESC, STYLE DESC

SELECT
	p.ProductID
	,p.Name
	,p.ListPrice
	,p.Class AS CLASS
	,p.Style AS STYLE
	,p.Color
FROM Production.Product as p
ORDER BY 4 DESC, 5 DESC