USE AdventureWorks2014
GO

SELECT
	p.FirstName
	,p.LastName
	,ps.PhoneNumber
FROM Person.Person as p
LEFT JOIN Person.PersonPhone as ps ON p.BusinessEntityID = ps.BusinessEntityID
GO

SELECT
	p.FirstName
	,p.LastName
	,ps.PhoneNumber
FROM Person.Person as p
LEFT JOIN Person.PersonPhone as ps ON p.BusinessEntityID = ps.BusinessEntityID
WHERE ps.PhoneNumber IS NULL
GO

SELECT 
	p.Name
	,ps.DocumentNode
FROM Production.Product as p
LEFT JOIN Production.ProductDocument as ps ON p.ProductID = ps.ProductID
GO

SELECT 
	p.Name
	,ps.DocumentNode
FROM Production.Product as p
LEFT JOIN Production.ProductDocument as ps ON p.ProductID = ps.ProductID
WHERE ps.DocumentNode IS NULL
GO

SELECT
	pum.Name
	,pum.UnitMeasureCode
	,CASE
		WHEN pp.SizeUnitMeasureCode IS NOT NULL THEN 'Is used as size'
		WHEN pp2.WeightUnitMeasureCode IS NOT NULL THEN 'Is used as weight'
	END AS 'Used measure'
FROM Production.UnitMeasure as pum
LEFT JOIN Production.Product as pp ON pum.UnitMeasureCode = pp.SizeUnitMeasureCode
LEFT JOIN Production.Product as pp2 ON pum.UnitMeasureCode = pp2.WeightUnitMeasureCode
GO

SELECT
	pum.Name
	,pum.UnitMeasureCode
	,CASE
		WHEN pp.SizeUnitMeasureCode IS NOT NULL THEN 'Is used as size'
		WHEN pp2.WeightUnitMeasureCode IS NOT NULL THEN 'Is used as weight'
	END AS 'Used measure'
FROM Production.UnitMeasure as pum
LEFT JOIN Production.Product as pp ON pum.UnitMeasureCode = pp.SizeUnitMeasureCode
LEFT JOIN Production.Product as pp2 ON pum.UnitMeasureCode = pp2.WeightUnitMeasureCode
WHERE pp.SizeUnitMeasureCode IS NULL
	AND
	pp2.WeightUnitMeasureCode IS NULL
GO