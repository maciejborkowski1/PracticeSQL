USE AdventureWorks2014
GO

SELECT
	'Shift '+LOWER(h.Name)+' starts at '+CAST(h.StartTime AS NVARCHAR(5))
FROM HumanResources.Shift as h
GO

SELECT
	h.LoginID
	,CONVERT(VARCHAR(20), HireDate, 104)
FROM HumanResources.Employee as h
GO

DECLARE @birth VARCHAR(30)= '21 maja 1989'

SELECT PARSE(@birth AS DATE USING 'pl-PL')
GO

DECLARE @birth VARCHAR(30)= '21 majeczek 1989'

SELECT TRY_PARSE(@birth AS DATE USING 'pl-PL')
GO