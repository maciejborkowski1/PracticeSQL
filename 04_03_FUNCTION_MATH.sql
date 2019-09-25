USE AdventureWorks2014
GO

SELECT
	s.SalesOrderID
	,s.TaxAmt
	,FLOOR(TaxAmt/1000)*1000
FROM Sales.SalesOrderHeader as s
GO

SELECT 
	CEILING(RAND()*49)
	,CEILING(RAND()*49)
	,CEILING(RAND()*49)
	,CEILING(RAND()*49)
	,CEILING(RAND()*49)
	,CEILING(RAND()*49)
GO

SELECT
	s.SalesOrderID
	,ROUND(TaxAmt,0)	
FROM Sales.SalesOrderHeader as s
GO

SELECT
	s.SalesOrderID
	,ROUND(TaxAmt,-3)	
FROM Sales.SalesOrderHeader as s
GO