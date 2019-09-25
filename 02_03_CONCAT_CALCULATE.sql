USE AdventureWorks2014
GO

SELECT
	UnitPrice
	,OrderQty
	, UnitPrice * OrderQty AS Total
FROM Sales.SalesOrderDetail

SELECT
	UnitPrice
	,UnitPriceDiscount
--	,UnitPrice - (UnitPrice * UnitPriceDiscount) - niepoprawnie - kolumna unit price discount od razu oblicza procenty - do sprawdzenia w przyszlosci
FROM Sales.SalesOrderDetail
WHERE
	UnitPriceDiscount > 0

SELECT
	UnitPrice
	,UnitPriceDiscount
	,(UnitPrice - UnitPriceDiscount) * OrderQty [TotalWithDiscount]
-- tu poprawnie wg kursu
FROM Sales.SalesOrderDetail

SELECT 
	[CardType and CardNumber] = CONCAT (CardType,':',CardNumber)
FROM Sales.CreditCard

SELECT 
	SalesOrderNumber, PurchaseOrderNumber, CONCAT (SalesOrderNumber,'-',PurchaseOrderNumber) AS [Sales and Purchase Order Number]
FROM Sales.SalesOrderHeader

SELECT 
	SalesOrderNumber
	,ProductID
	,UnitPrice
	,TaxAmt
FROM Sales.SalesOrderHeader AS a
JOIN Sales.SalesOrderDetail AS b
	ON a.SalesOrderID = b.SalesOrderID

SELECT 
	sod.ProductID
    ,sod.SalesOrderID
    ,sod.OrderQty * sod.UnitPrice AS Total
FROM Sales.SalesOrderDetail sod
WHERE
	(sod.OrderQty * sod.UnitPrice) > 10000


