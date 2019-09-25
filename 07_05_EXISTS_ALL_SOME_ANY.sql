USE AdventureWorks2014
GO

SELECT
	*
FROM Production.UnitMeasure as PUM
WHERE
	NOT EXISTS (SELECT * FROM Production.Product as PP 
	WHERE PUM.UnitMeasureCode = PP.SizeUnitMeasureCode
	OR
	PUM.UnitMeasureCode = PP.WeightUnitMeasureCode )
GO

SELECT
	*
FROM Production.UnitMeasure as PUM
WHERE
	EXISTS (SELECT * FROM Production.Product as PP 
	WHERE PUM.UnitMeasureCode = PP.SizeUnitMeasureCode
	OR
	PUM.UnitMeasureCode = PP.WeightUnitMeasureCode )
GO

SELECT
	*
FROM Production.Product as PP
WHERE PP.ListPrice >
	ALL (SELECT PP2.ListPrice FROM Production.Product as PP2 
	WHERE PP2.ProductSubcategoryID =1)
GO

SELECT
	*
FROM Production.Product as PP
WHERE PP.ListPrice >
	ANY (SELECT PP2.ListPrice FROM Production.Product as PP2 
	WHERE PP2.ProductSubcategoryID =1)
GO