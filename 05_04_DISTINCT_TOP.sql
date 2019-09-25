USE AdventureWorks2014
GO

SELECT DISTINCT City FROM Person.Address
GO

SELECT DISTINCT PostalCode FROM Person.Address
GO

SELECT DISTINCT City, PostalCode FROM Person.Address
GO

SELECT TOP(4) WITH TIES s.BusinessEntityID, s.Bonus
FROM Sales.SalesPerson AS s
ORDER BY Bonus DESC

SELECT TOP(20) PERCENT WITH TIES s.BusinessEntityID, s.Bonus
FROM Sales.SalesPerson AS s
ORDER BY Bonus DESC