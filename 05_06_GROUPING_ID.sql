USE AdventureWorks2014
Go

SELECT
	MONTH(s.OrderDate) AS Month
	,s.SalesPersonID
	,s.TerritoryID
	,SUM(SubTotal) AS [Total Amount]
FROM Sales.SalesOrderHeader AS s
GROUP BY MONTH(s.OrderDate), s.SalesPersonID, s.TerritoryID
GO

SELECT
	MONTH(s.OrderDate) AS Month, GROUPING_ID(MONTH(s.OrderDate)) AS 'Is month aggregated'
	,s.SalesPersonID, GROUPING_ID(s.SalesPersonID) AS 'Is sales person aggregated'
	,s.TerritoryID, GROUPING_ID(s.TerritoryID) AS 'Is territory aggregated'
	,SUM(SubTotal) AS [Total Amount], GROUPING_ID(MONTH(s.OrderDate),s.SalesPersonID,s.TerritoryID) AS 'Aggregation mask'
FROM Sales.SalesOrderHeader AS s
GROUP BY ROLLUP (MONTH(s.OrderDate), s.SalesPersonID, s.TerritoryID)
GO

SELECT
	MONTH(s.OrderDate) AS Month, GROUPING_ID(MONTH(s.OrderDate)) AS 'Is month aggregated'
	,s.SalesPersonID, GROUPING_ID(s.SalesPersonID) AS 'Is sales person aggregated'
	,s.TerritoryID, GROUPING_ID(s.TerritoryID) AS 'Is territory aggregated'
	,SUM(SubTotal) AS [Total Amount], GROUPING_ID(MONTH(s.OrderDate),s.SalesPersonID,s.TerritoryID) AS 'Aggregation mask'
FROM Sales.SalesOrderHeader AS s
GROUP BY CUBE (MONTH(s.OrderDate), s.SalesPersonID, s.TerritoryID)
ORDER BY [Aggregation mask] DESC
GO

SELECT
	MONTH(s.OrderDate) AS Month, GROUPING_ID(MONTH(s.OrderDate)) AS 'Is month aggregated'
	,s.SalesPersonID, GROUPING_ID(s.SalesPersonID) AS 'Is sales person aggregated'
	,s.TerritoryID, GROUPING_ID(s.TerritoryID) AS 'Is territory aggregated'
	,SUM(SubTotal) AS [Total Amount], GROUPING_ID(MONTH(s.OrderDate),s.SalesPersonID,s.TerritoryID) AS 'Aggregation mask'
FROM Sales.SalesOrderHeader AS s
GROUP BY GROUPING SETS ((MONTH(s.OrderDate)), (MONTH(s.OrderDate),s.SalesPersonID,s.TerritoryID))
ORDER BY [Aggregation mask] DESC
GO