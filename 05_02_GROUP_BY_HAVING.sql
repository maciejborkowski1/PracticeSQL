USE AdventureWorks2014
GO

SELECT
	COUNT(*) AS 'Number of records'
	,COUNT(MiddleName) AS 'Number of second names'
	,COUNT(FirstName) AS 'Number od first names'
FROM Person.Person AS p
GO

SELECT COUNT(*) AS 'mailing agree' FROM Person.Person WHERE EmailPromotion = 1
SELECT COUNT(*) AS 'Number of records' FROM Person.Person
GO

SELECT
	SUM(UnitPrice*OrderQty) AS 'Total amount without discount'
	,SUM((UnitPrice-UnitPriceDiscount)*OrderQty) AS 'Total amount with discount'
FROM Sales.SalesOrderDetail as s
GO

SELECT
	ProductSubcategoryID
	,MIN(ListPrice) AS 'Minimum Price'
	,MAX(ListPrice) AS 'Maximum Price'
	,AVG(ListPrice) AS 'Average Price'
	,STDEV(ListPrice) AS 'Statistical Standard Deviation'
FROM Production.Product AS p
GROUP BY ProductSubcategoryID
ORDER BY ProductSubcategoryID DESC

SELECT
	s.SalesPersonID
	,COUNT(*) AS 'Order realize by employee'
FROM Sales.SalesOrderHeader AS s
WHERE OrderDate BETWEEN '2010-01-01' AND '2013-12-31'
GROUP BY s.SalesPersonID
HAVING COUNT(*) > 100
ORDER BY [Order realize by employee] DESC

SELECT
	s.SalesPersonID
	,SUM(SubTotal) AS 'Total Sales'
FROM Sales.SalesOrderHeader AS s
WHERE OrderDate BETWEEN '2010-01-01' AND '2013-12-31'
GROUP BY s.SalesPersonID
HAVING SUM(SubTotal) > 100000
ORDER BY [Total Sales] DESC

SELECT
	s.ShipMethodID
	,COUNT(*) AS 'Number of orders'
FROM Sales.SalesOrderHeader AS s
GROUP BY s.ShipMethodID

SELECT
	p.ProductID
	,p.Name
	,p.StandardCost
	,p.ListPrice
	,p.ListPrice - p.StandardCost AS Profit
FROM Production.Product AS p
WHERE 
	ListPrice > 0
	OR
	StandardCost > 0
	
SELECT
	p.ProductSubcategoryID
	,AVG(p.ListPrice - p.StandardCost) AS 'Average Profit'
	,MIN(p.ListPrice - p.StandardCost) AS 'Minimum Profit'
	,MAX(p.ListPrice - p.StandardCost) AS 'Maximum Profit'
FROM Production.Product AS p
WHERE
	ListPrice > 0
	OR
	StandardCost > 0
GROUP BY p.ProductSubcategoryID
ORDER BY [Average Profit] DESC