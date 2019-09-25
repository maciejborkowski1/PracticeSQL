USE AdventureWorks2014
GO

SELECT TOP (1)
	s.BusinessEntityID
FROM Sales.SalesPerson as s
WHERE s.TerritoryID = 1
GO

SELECT
	*
FROM Sales.SalesOrderHeader as s
WHERE s.SalesPersonID IN
(
	SELECT TOP (1)
		BusinessEntityID
	FROM Sales.SalesPerson
	WHERE TerritoryID = 1
)
GO

SELECT
	s.BusinessEntityID
FROM Sales.SalesPerson as s
WHERE s.TerritoryID = 1
GO

SELECT
	*
FROM Sales.SalesOrderHeader as s
WHERE s.SalesPersonID IN
(
	SELECT
		BusinessEntityID
	FROM Sales.SalesPerson
	WHERE TerritoryID = 1
)
GO

SELECT
	*
FROM HumanResources.EmployeeDepartmentHistory as h
WHERE h.DepartmentID = 1
GO

SELECT
	*
FROM HumanResources.Employee as h1
WHERE h1.BusinessEntityID IN
(
	SELECT
		h2.BusinessEntityID
	FROM HumanResources.EmployeeDepartmentHistory as h2
	WHERE h2.DepartmentID = 1
)
GO