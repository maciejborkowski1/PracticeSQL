USE AdventureWorks2014
Go

SELECT
	s.CardNumber
	,SUBSTRING(s.CardNumber,1,3)
FROM Sales.CreditCard as s
GO

SELECT
	a.AddressLine1
	,SUBSTRING(a.AddressLine1,1,CHARINDEX(' ',a.AddressLine1))
FROM Person.Address AS a
GO

SELECT
	s.OrderDate
	,FORMAT(s.OrderDate, 'MM-yyyy')
FROM Sales.SalesOrderHeader as s
GO

SELECT
	s.OrderQty*s.UnitPrice
	,FORMAT(s.OrderQty*s.UnitPrice,'0.0')
FROM Sales.SalesOrderDetail AS s
GO

SELECT
	p.ProductNumber
	,REPLACE(p.ProductNumber,'-',' ')
FROM Production.Product AS p
GO

SELECT
	s.TotalDue
	,REPLICATE('*',15-LEN(FORMAT(TotalDue,'0,00')))+FORMAT(TotalDue,'0.00')+REPLICATE('*',2)
FROM Sales.SalesOrderHeader AS s