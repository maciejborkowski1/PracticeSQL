USE AdventureWorks2014
GO

SELECT
	p.BusinessEntityID
	,p.FirstName
	,p.LastName
	,s.Bonus
FROM Person.Person as p
JOIN Sales.SalesPerson AS s on p.BusinessEntityID = s.BusinessEntityID
GO

SELECT
	h.SalesOrderID
	,h.OrderDate
	,h.SalesOrderNumber
	,d.ProductID
	,d.OrderQty
	,d.UnitPrice
FROM Sales.SalesOrderHeader AS h
JOIN Sales.SalesOrderDetail as d on h.SalesOrderID = d.SalesOrderID
GO

SELECT
	p.ProductID
	,p.Name
	,(s.UnitPrice - s.UnitPriceDiscount) * s.OrderQty as TotalValue
FROM Production.Product as p
JOIN Sales.SalesOrderDetail as s on p.ProductID = s.ProductID
GO

SELECT
	p.Name
	,SUM((s.UnitPrice - s.UnitPriceDiscount) * s.OrderQty) as TotalValue
FROM Production.Product as p
JOIN Sales.SalesOrderDetail as s on p.ProductID = s.ProductID
GROUP BY p.Name
ORDER BY TotalValue DESC
GO

SELECT
	p.Name as Category
	,ps.Name as Subcategory
FROM Production.ProductCategory as p
JOIN Production.ProductSubcategory as ps on p.ProductCategoryID = ps.ProductCategoryID
GO

SELECT
	p.Name as Category
	,COUNT(ps.Name) AS QtyOfSubcategory
FROM Production.ProductCategory as p
JOIN Production.ProductSubcategory as ps on p.ProductCategoryID = ps.ProductCategoryID
GROUP BY p.Name
ORDER BY Category
GO

SELECT
	p.Name
	,COUNT(*) AS NumberOfReview
FROM Production.Product as p
JOIN Production.ProductReview as ps on p.ProductID = ps.ProductID
GROUP BY p.Name
GO

SELECT
	p.FirstName + p.LastName as FullName
	,COUNT(*) AS EmployeeExtraHours
FROM HumanResources.EmployeeDepartmentHistory as h
JOIN Person.Person as p on h.BusinessEntityID = p.BusinessEntityID
GROUP BY p.FirstName + p.LastName
HAVING COUNT(*) > 1
