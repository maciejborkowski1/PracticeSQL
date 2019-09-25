USE AdventureWorks2014
GO

SELECT
	h.LoginID
	,h.SickLeaveHours
FROM HumanResources.Employee as h
GO

SELECT AVG(h.SickLeaveHours) FROM HumanResources.Employee as h
GO

SELECT
	h.LoginID
	,h.SickLeaveHours
	,(SELECT AVG(H.SickLeaveHours)FROM HumanResources.Employee as H) as AvgSickLeaveHours
FROM HumanResources.Employee as h
GO

SELECT
	h.LoginID
	,h.SickLeaveHours
	,(SELECT AVG(H.SickLeaveHours)FROM HumanResources.Employee as H) as AvgSickLeaveHours
	,h.SickLeaveHours - (SELECT AVG(H.SickLeaveHours)FROM HumanResources.Employee as H) as SickLeaveDiff
FROM HumanResources.Employee as h
GO

SELECT
	h.LoginID
	,h.SickLeaveHours
	,(SELECT AVG(H.SickLeaveHours)FROM HumanResources.Employee as H) as AvgSickLeaveHours
	,h.SickLeaveHours - (SELECT AVG(H.SickLeaveHours)FROM HumanResources.Employee as H) as SickLeaveDiff
FROM HumanResources.Employee as h
WHERE h.SickLeaveHours > (SELECT AVG(H.SickLeaveHours)FROM HumanResources.Employee as H)
ORDER BY SickLeaveDiff DESC
GO




