USE AdventureWorks2014
GO

SELECT
	h.LoginID
	,h.HireDate
	,IIF(DATEDIFF(year, HireDate, GetDate())=10,'Old stager' ,'Adept')
FROM HumanResources.Employee as h
GO

SELECT
	h.LoginID
	,h.HireDate
	,IIF(DATEDIFF(year, HireDate, GetDate())>10,'Old stager' ,IIF(DATEDIFF(year, HireDate, GetDate())>8, 'Veteran', 'Adept'))
FROM HumanResources.Employee as h
GO

SET DATEFIRST 1
SELECT
	s.SalesOrderID
	,s.OrderDate
	,CHOOSE( 
		(DATEPART(dw, OrderDate))
		,'LUNES'
		,'MARTES'
		,'MIERCOLES'
		,'JUEVES'
		,'VIERNES'
		,'SABADO'
		,'DOMINGO')	as WeekDaySpanish
FROM Sales.SalesOrderHeader as s