USE AdventureWorks2014
GO

SELECT
	PP.FirstName
	,PP.LastName
	,(
		SELECT
			COUNT(*)
		FROM HumanResources.EmployeeDepartmentHistory as EH 
		WHERE EH.BusinessEntityID = PP.BusinessEntityID
		 ) as CountOfDepChange
FROM HumanResources.Employee as HRE
JOIN Person.Person as PP ON HRE.BusinessEntityID = PP.BusinessEntityID
GO

SELECT
	PP.FirstName
	,PP.LastName
	,(
		SELECT
			COUNT(*)
		FROM HumanResources.EmployeeDepartmentHistory as EH 
		WHERE EH.BusinessEntityID = PP.BusinessEntityID
		 ) as CountOfDepChange
FROM HumanResources.Employee as HRE
JOIN Person.Person as PP ON HRE.BusinessEntityID = PP.BusinessEntityID
WHERE (
		SELECT
			COUNT(*)
		FROM HumanResources.EmployeeDepartmentHistory as EH 
		WHERE EH.BusinessEntityID = PP.BusinessEntityID
	) >= 2
GO

SELECT
	PP.FirstName
	,PP.LastName
	,HRE.HireDate
FROM HumanResources.Employee as HRE
JOIN Person.Person as PP ON PP.BusinessEntityID = HRE.BusinessEntityID
GO

SELECT
	PP.FirstName
	,PP.LastName
	,HRE.HireDate
	,(
		SELECT
			COUNT(*)
		FROM HumanResources.Employee as HRE2
		WHERE YEAR(HRE.HireDate) = YEAR(HRE2.HireDate)
		) as EmployeeHiredTheSameYear
FROM HumanResources.Employee as HRE
JOIN Person.Person as PP ON PP.BusinessEntityID = HRE.BusinessEntityID
GO

SELECT
	PP.FirstName
	,PP.LastName
	,SSP.Bonus
	,SSP.SalesQuota
FROM Sales.SalesPerson as SSP
JOIN Person.Person as PP ON SSP.BusinessEntityID = PP.BusinessEntityID
GO

SELECT
	PP.FirstName
	,PP.LastName
	,SSP.Bonus
	,SSP.SalesQuota
	,SSP.TerritoryID
	,(
		SELECT
			AVG(SSP2.Bonus)
		FROM Sales.SalesPerson as SSP2
		WHERE SSP.TerritoryID = SSP2.TerritoryID
		) as AverageBonusValue
	,(
		SELECT
			AVG(SSP2.SalesQuota)
		FROM Sales.SalesPerson as SSP2
		WHERE SSP.TerritoryID = SSP2.TerritoryID
		) as AverageSalesQuotaValue
FROM Sales.SalesPerson as SSP
JOIN Person.Person as PP ON SSP.BusinessEntityID = PP.BusinessEntityID
GO

SELECT
	*
FROM Sales.SalesPerson as SSP
WHERE SSP.SalesQuota < (
	SELECT AVG(SalesQuota)
	FROM Sales.SalesPerson)
ORDER BY TerritoryID DESC
GO

SELECT
	*
FROM Sales.SalesPerson as SSP
WHERE SSP.SalesQuota < (
	SELECT AVG(SalesQuota)
	FROM Sales.SalesPerson as SSP2
	WHERE SSP.TerritoryID = SSP2.TerritoryID)
GO

SELECT
	YEAR(SSOH.OrderDate) as Year
	,MONTH(SSOH.OrderDate) as Month
	,COUNT(*) as QtyOfRecords
FROM Sales.SalesOrderHeader as SSOH
GROUP BY SSOH.OrderDate
ORDER BY QtyOfRecords DESC
GO

SELECT
	YEAR(SSOH.OrderDate) as Year
	,MONTH(SSOH.OrderDate) as Month
	,COUNT(*) as QtyOfRecords
	,(
		SELECT
			COUNT(*)
		FROM Sales.SalesOrderHeader as SSOH2
		WHERE YEAR(SSOH.OrderDate) - 1 = YEAR(SSOH2.OrderDate)
		AND
		MONTH(SSOH.OrderDate) = MONTH(SSOH2.OrderDate)
	) AS QtyPreviousYear
FROM Sales.SalesOrderHeader as SSOH
GROUP BY SSOH.OrderDate
ORDER BY QtyOfRecords DESC
GO