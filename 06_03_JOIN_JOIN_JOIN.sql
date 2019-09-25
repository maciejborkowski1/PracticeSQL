USE AdventureWorks2014
GO

SELECT
	P.Name
	,SOH.OrderDate
FROM Production.Product as P
JOIN Sales.SalesOrderDetail as SOD ON P.ProductID = SOD.ProductID
JOIN Sales.SalesOrderHeader as SOH ON SOH.SalesOrderID = SOD.SalesOrderID
GO

SELECT
	P.Name
	,MAX(SOH.OrderDate) as LastOrderDate
FROM Production.Product as P
JOIN Sales.SalesOrderDetail as SOD ON P.ProductID = SOD.ProductID
JOIN Sales.SalesOrderHeader as SOH ON SOH.SalesOrderID = SOD.SalesOrderID
GROUP BY SOH.OrderDate, P.Name
ORDER BY SOH.OrderDate DESC
GO

SELECT
	P.Name
	,MAX(SOH.OrderDate) as LastOrderDate
FROM Production.Product as P
LEFT JOIN Sales.SalesOrderDetail as SOD ON P.ProductID = SOD.ProductID
LEFT JOIN Sales.SalesOrderHeader as SOH ON SOH.SalesOrderID = SOD.SalesOrderID
WHERE SOH.OrderDate IS NULL
GROUP BY SOH.OrderDate, P.Name
ORDER BY SOH.OrderDate DESC
GO

SELECT
	PP.LastName + ' ' + PP.FirstName AS FullName
	,HRS.Name
FROM Person.Person as PP
JOIN HumanResources.EmployeeDepartmentHistory as EDH ON PP.BusinessEntityID = EDH.BusinessEntityID
JOIN HumanResources.Shift as HRS ON EDH.ShiftID = HRS.ShiftID
GO

SELECT
	PP.Name
	,SSO.Description
FROM Production.Product as PP
LEFT JOIN Sales.SpecialOfferProduct as SSOP ON SSOP.ProductID = PP.ProductID
LEFT JOIN Sales.SpecialOffer as SSO ON SSO.SpecialOfferID = SSOP.SpecialOfferID
GO