USE AdventureWorks2014
GO

BEGIN TRAN
     
ALTER TABLE Person.Person NOCHECK CONSTRAINT ALL
ALTER TABLE Sales.SalesPerson NOCHECK CONSTRAINT ALL
ALTER TABLE HumanResources.EmployeeDepartmentHistory NOCHECK CONSTRAINT ALL
ALTER TABLE HumanResources.EmployeePayHistory NOCHECK CONSTRAINT ALL
ALTER TABLE HumanResources.JobCandidate NOCHECK CONSTRAINT ALL
ALTER TABLE HumanResources.Employee NOCHECK CONSTRAINT ALL
UPDATE HumanResources.Employee set BusinessEntityID=1074 WHERE BusinessEntityID = 274

SELECT
	HRE.BusinessEntityID
	,HRE.LoginID
FROM HumanResources.Employee as HRE

SELECT
	s.BusinessEntityID
	,s.Bonus
FROM Sales.SalesPerson as s

SELECT
	*
FROM HumanResources.Employee as HRE
JOIN Sales.SalesPerson as SSP ON HRE.BusinessEntityID = SSP.BusinessEntityID

SELECT
	*
FROM HumanResources.Employee as HRE
LEFT JOIN Sales.SalesPerson as SSP ON HRE.BusinessEntityID = SSP.BusinessEntityID

SELECT
	*
FROM Sales.SalesPerson as SSP
LEFT JOIN HumanResources.Employee as HRE ON HRE.BusinessEntityID = SSP.BusinessEntityID

SELECT
	*
FROM HumanResources.Employee as HRE
FULL JOIN Sales.SalesPerson as SSP ON HRE.BusinessEntityID = SSP.BusinessEntityID

ROLLBACK