USE AdventureWorks2014
GO

SELECT
	PP.FirstName
	,PP.LastName
	,HRS.Name
FROM HumanResources.Employee as HRE
JOIN Person.Person as PP ON HRE.BusinessEntityID = PP.BusinessEntityID
CROSS JOIN HumanResources.Shift as HRS
GO

SELECT
	DISTINCT PP.Color
FROM Production.Product as PP
GO

SELECT
	DISTINCT PP.Class
FROM Production.Product as PP
GO

SELECT
	DISTINCT PP1.Class
	,PP2.Color
FROM Production.Product as PP1
CROSS JOIN Production.Product as PP2
ORDER BY PP2.Color
GO

SELECT
	DISTINCT PP1.FirstName + ' ' + PP1.LastName as Employee
	,PP2.FirstName + ' ' + PP2.LastName as Subsitute
FROM Sales.SalesPerson as SSP1
JOIN Person.Person as PP1 ON PP1.BusinessEntityID = SSP1.BusinessEntityID
CROSS JOIN Sales.SalesPerson as SSP2
JOIN Person.Person as PP2 ON PP2.BusinessEntityID = SSP2.BusinessEntityID
WHERE SSP1.BusinessEntityID > SSP2.BusinessEntityID


