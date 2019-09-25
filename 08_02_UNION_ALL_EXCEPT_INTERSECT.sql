USE AdventureWorks2014
GO

SELECT
	PP.LastName
	,PP.FirstName
FROM Person.Person as PP
UNION ALL
SELECT
	PP2.LastName
	,PP2.FirstName
FROM HumanResources.Employee as HRE
JOIN Person.Person as PP2 ON HRE.BusinessEntityID = PP2.BusinessEntityID
ORDER BY PP.LastName, PP.FirstName
GO

SELECT
	PP.LastName
	,PP.FirstName
FROM Person.Person as PP
EXCEPT
SELECT
	PP2.LastName
	,PP2.FirstName
FROM HumanResources.Employee as HRE
JOIN Person.Person as PP2 ON HRE.BusinessEntityID = PP2.BusinessEntityID
ORDER BY PP.LastName, PP.FirstName
GO

SELECT
	PP.LastName
	,PP.FirstName
FROM Person.Person as PP
INTERSECT
SELECT
	PP2.LastName
	,PP2.FirstName
FROM HumanResources.Employee as HRE
JOIN Person.Person as PP2 ON HRE.BusinessEntityID = PP2.BusinessEntityID
ORDER BY PP.LastName, PP.FirstName
GO