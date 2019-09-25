USE AdventureWorks2014
GO

SELECT
	PP.ProductID
	,PP.Name
	,PPC.ProductCategoryID as Category
	,PPS.ProductSubcategoryID as Subcategory
FROM Production.Product as PP
JOIN Production.ProductSubcategory as PPS ON PP.ProductSubcategoryID = PPS.ProductSubcategoryID
JOIN Production.ProductCategory as PPC ON PPC.ProductCategoryID = PPS.ProductCategoryID
GO

SELECT
	SSOD.LineTotal
FROM Sales.SalesOrderDetail as SSOD
GO

SELECT
	PROD.ProductID
	,PROD.ProductName
	,PROD.Subcategory
	,PROD.Category
	,SSOD.LineTotal
FROM Sales.SalesOrderDetail as SSOD
JOIN
(
	SELECT
	PP.ProductID
	,PP.Name as ProductName
	,PPC.ProductCategoryID as Category
	,PPS.ProductSubcategoryID as Subcategory
	FROM Production.Product as PP
	JOIN Production.ProductSubcategory as PPS ON PP.ProductSubcategoryID = PPS.ProductSubcategoryID
	JOIN Production.ProductCategory as PPC ON PPC.ProductCategoryID = PPS.ProductCategoryID
) AS PROD ON PROD.ProductID = SSOD.ProductID
GO

SELECT
	SSOP.ProductID
	,SSO.Description as Descript
FROM Sales.SpecialOfferProduct as SSOP
JOIN Sales.SpecialOffer as SSO ON SSO.SpecialOfferID = SSOP.SpecialOfferID
GO

SELECT
	SSOP.ProductID
	,SSO.Description as Descript
	,PROD.Name as ProductName
	,PROD.Subcategory
	,PROD.Category
FROM Sales.SpecialOfferProduct as SSOP
JOIN Sales.SpecialOffer as SSO ON SSO.SpecialOfferID = SSOP.SpecialOfferID
JOIN
(
	SELECT
	PP.ProductID
	,PP.Name
	,PPC.ProductCategoryID as Category
	,PPS.ProductSubcategoryID as Subcategory
	FROM Production.Product as PP
	JOIN Production.ProductSubcategory as PPS ON PP.ProductSubcategoryID = PPS.ProductSubcategoryID
	JOIN Production.ProductCategory as PPC ON PPC.ProductCategoryID = PPS.ProductCategoryID
) as PROD ON SSOP.ProductID = PROD.ProductID
GO