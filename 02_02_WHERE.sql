USE AdventureWorks2014
GO

SELECT * FROM HumanResources.Employee

SELECT * FROM HumanResources.Employee
WHERE
	BirthDate >= '1980-01-01'

SELECT * FROM HumanResources.Employee
WHERE
	BirthDate BETWEEN '1980-01-01' AND '1980-12-31'
	AND
	Gender = 'M'

SELECT
	s.JobTitle
	,s.BirthDate
	,s.Gender
	,s.VacationHours
FROM HumanResources.Employee AS s
WHERE
	(Gender='M'
	AND
	VacationHours BETWEEN 90 AND 99
	OR
	Gender='F'
	AND
	VacationHours BETWEEN 80 AND 89)
	AND
	BirthDate>='1990-01-01'

SELECT * FROM HumanResources.Employee
WHERE
	JobTitle IN ('Control Specialist','Benefits Specialist','Accounts Receivable Specialist')	