DECLARE @t TINYINT
SET @t = 2*2*2*2*2*2*2*2-1

PRINT @t

DECLARE @s SMALLINT
SET @s=128*256-1

PRINT @s

USE AdventureWorks2014

SELECT
	DATALENGTH(HumanResources.Department)
	,DATALENGTH(HumanResources.Employee)
	,DATALENGTH(HumanResources.Shift)

