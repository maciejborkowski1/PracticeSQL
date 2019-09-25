USE AdventureWorks2014
GO

    SELECT p.* FROM Production.Product p
    WHERE
    p.Color = (SELECT Color FROM Production.Product WHERE ProductID=322)
	--the same 
SELECT
	p.*
FROM Production.Product as p
JOIN Production.Product as p2 ON p.Color = p2.Color
WHERE p.ProductID = 322
GO

    SELECT
     e.LoginID
     ,(SELECT p.LastName+' '+p.FirstName 
       FROM Person.Person p WHERE p.BusinessEntityID = e.BusinessEntityID) AS Name
    FROM HumanResources.Employee e
	--the same
SELECT
	HR.LoginID
	,PP.FirstName+' '+PP.LastName
FROM HumanResources.Employee AS HR
JOIN Person.Person AS PP ON PP.BusinessEntityID = HR.BusinessEntityID
GO

    SELECT 
    *
    FROM Production.UnitMeasure um
    WHERE
     NOT EXISTS(
     SELECT * FROM Production.Product p 
     WHERE um.UnitMeasureCode = p.SizeUnitMeasureCode 
           OR um.UnitMeasureCode =p.WeightUnitMeasureCode)
	--the same
SELECT
	*
FROM Production.UnitMeasure as UM
LEFT JOIN Production.Product as PSize ON UM.UnitMeasureCode = PSize.SizeUnitMeasureCode
LEFT JOIN Production.Product as PWeight ON UM.UnitMeasureCode = PWeight.WeightUnitMeasureCode
WHERE PSize.ProductID IS NULL AND PWeight.ProductID IS NULL

    SELECT 
    um.*
    FROM Production.UnitMeasure um
    WHERE
     EXISTS( 
     SELECT * FROM Production.Product p 
     WHERE um.UnitMeasureCode = p.SizeUnitMeasureCode 
       OR um.UnitMeasureCode =p.WeightUnitMeasureCode)
	--the same
SELECT
	DISTINCT UM.*
FROM Production.UnitMeasure as UM
LEFT JOIN Production.Product as PSize ON UM.UnitMeasureCode = PSize.SizeUnitMeasureCode
LEFT JOIN Production.Product as PWeight ON UM.UnitMeasureCode = PWeight.WeightUnitMeasureCode
WHERE PSize.ProductID IS NOT NULL OR PWeight.ProductID IS NOT NULL