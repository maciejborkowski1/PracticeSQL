USE AdventureWorks2014
GO

SELECT
	PP.LastName
	,PP.FirstName
	,'Seller' as Job
FROM Sales.SalesPerson as SSP
JOIN Person.Person as PP ON SSP.BusinessEntityID = PP.BusinessEntityID
UNION
SELECT
	PP2.LastName
	,PP2.FirstName
	,HRE.JobTitle
FROM HumanResources.Employee as HRE
JOIN Person.Person as PP2 ON HRE.BusinessEntityID = PP2.BusinessEntityID
ORDER BY Job DESC
GO

SELECT
	HRD.Name
	,'Department' AS Location
FROM HumanResources.Department as HRD
UNION
SELECT
	SS.Name
	,'Store'
FROM Sales.Store as SS
ORDER BY Location DESC
GO