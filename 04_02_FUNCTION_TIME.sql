USE AdventureWorks2014
GO

PRINT GetDate()
GO

SELECT
	s.SalesOrderID
	,s.OrderDate
	,YEAR(s.OrderDate) AS 'Year'
	,MONTH(s.OrderDate) AS 'Month'
	,DAY(s.OrderDate) AS 'Day'
	,DATEPART(dw, s.OrderDate) AS 'WeekDay'
	,DATEPART(wk, s.OrderDate) AS 'Week'
FROM Sales.SalesOrderHeader AS s
GO

SELECT
	s.SalesOrderID
	,s.OrderDate
	,YEAR(s.OrderDate) AS 'Year'
	,DATENAME(M, s.OrderDate) AS 'Month'
	,DAY(s.OrderDate) AS 'Day'
	,DATENAME(dw, s.OrderDate) AS 'WeekDay'
	,DATEPART(wk, s.OrderDate) AS 'Week'
FROM Sales.SalesOrderHeader AS s
GO

DECLARE @d DATETIME2 = '1989-05-21 04:03:23'
PRINT DATENAME(dw, @d)
GO

SELECT
	h.LoginID
	,h.BirthDate
	,DATEFROMPARTS(YEAR(GetDate()),MONTH(h.BirthDate),1) AS 'Begin'
	,EOMONTH(DATEFROMPARTS(YEAR(GetDate()),MONTH(h.BirthDate),1)) AS 'End'
FROM HumanResources.Employee AS h
GO

SELECT
	s.SalesOrderID
	,s.OrderDate
	,s.DueDate
	,DATEDIFF(d, s.OrderDate, s.DueDate) AS 'Realize time in days'
FROM Sales.SalesOrderHeader AS s
GO

DECLARE @MyBirth DATETIME2 = '1989-05-21 04:03:23'
DECLARE @Today DATETIME2 = GetDate()

SELECT 
	DATEDIFF(year, @MyBirth, @Today) AS 'Age in Years'
	,DATEDIFF(day, @MyBirth, @Today) AS 'Age in Days'
GO

SELECT
	*	
FROM HumanResources.Employee AS h
WHERE 
	--h.LoginID = 'adventure-works\diane1,
	h.BirthDate BETWEEN DATEADD(YEAR, -1, '1986-06-05') AND DATEADD(YEAR, 1, '1986-06-05')
GO


DECLARE @BirthDate DATE
SELECT @BirthDate = BirthDate FROM HumanResources.Employee
WHERE LoginID = 'adventure-works\diane1'

SELECT
	*	
FROM HumanResources.Employee AS h
WHERE 
	--h.LoginID = 'adventure-works\diane1',
	h.BirthDate BETWEEN DATEADD(YEAR, -1, @BirthDate) AND DATEADD(YEAR, 1, @BirthDate)
GO

