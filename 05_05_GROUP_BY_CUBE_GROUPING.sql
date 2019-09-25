USE AdventureWorks2014
Go

SELECT
	MONTH(s.OrderDate) AS Month
	,s.SalesPersonID
	,s.TerritoryID
	,SUM(SubTotal) AS [Total Amount]
FROM Sales.SalesOrderHeader AS s
WHERE 
	OrderDate BETWEEN '2012-01-01' AND '2012-03-31'
	AND
	SalesPersonID IS NOT NULL
	AND
	TerritoryID IS NOT NULL
GROUP BY MONTH(s.OrderDate), s.SalesPersonID, s.TerritoryID
GO

SELECT
	MONTH(s.OrderDate) AS Month
	,s.SalesPersonID
	,s.TerritoryID
	,SUM(SubTotal) AS [Total Amount]
FROM Sales.SalesOrderHeader AS s
WHERE 
	OrderDate BETWEEN '2012-01-01' AND '2012-03-31'
	AND
	SalesPersonID IS NOT NULL
	AND
	TerritoryID IS NOT NULL
GROUP BY ROLLUP (MONTH(s.OrderDate), s.SalesPersonID, s.TerritoryID)
GO

SELECT
	MONTH(s.OrderDate) AS Month
	,s.SalesPersonID
	,s.TerritoryID
	,SUM(SubTotal) AS [Total Amount]
FROM Sales.SalesOrderHeader AS s
WHERE 
	OrderDate BETWEEN '2012-01-01' AND '2012-03-31'
	AND
	SalesPersonID IS NOT NULL
	AND
	TerritoryID IS NOT NULL
GROUP BY CUBE (MONTH(s.OrderDate), s.SalesPersonID, s.TerritoryID)
GO

SELECT
	MONTH(s.OrderDate) AS Month
	,s.SalesPersonID
	,s.TerritoryID
	,SUM(SubTotal) AS [Total Amount]
FROM Sales.SalesOrderHeader AS s
WHERE 
	OrderDate BETWEEN '2012-01-01' AND '2012-03-31'
	AND
	SalesPersonID IS NOT NULL
	AND
	TerritoryID IS NOT NULL
GROUP BY GROUPING SETS ((MONTH(s.OrderDate)), (MONTH(s.OrderDate),s.SalesPersonID,s.TerritoryID))
GO