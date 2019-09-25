USE AdventureWorks2014
GO

SELECT *
FROM HumanResources.Employee
WHERE JobTitle LIKE '%Specialist%'

SELECT *
FROM HumanResources.Employee
WHERE JobTitle LIKE '%Specialist%' AND JobTitle LIKE '%Marketing%'

SELECT *
FROM HumanResources.Employee
WHERE JobTitle LIKE '%Specialist%' OR JobTitle LIKE '%Marketing%'

SELECT *
FROM Production.Product
WHERE Name LIKE '%[0-9]%'

SELECT *
FROM Production.Product
WHERE Name LIKE '%[0-9][0-9]%'

SELECT *
FROM Production.Product
WHERE Name LIKE '%[0-9][0-9]%[^0-9]'

SELECT *
FROM Production.Product
WHERE Name LIKE '____'