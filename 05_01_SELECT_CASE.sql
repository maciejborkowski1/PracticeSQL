USE AdventureWorks2014
GO

SELECT
	p.PhoneNumberTypeID
	,p.Name
	,CASE Name
		WHEN 'Cell' THEN 'Mobile Phone'
		WHEN 'Home' THEN 'Stacionary'
		WHEN 'Work' THEN 'Stacionary'
		ELSE 'Other'
	END AS PhoneType
FROM Person.PhoneNumberType as p
GO

SELECT
	p.PhoneNumberTypeID
	,p.Name
	,CASE
		WHEN Name = 'Cell' THEN 'Mobile Phone'
		WHEN Name = 'Home' OR Name = 'Work' THEN 'Stacionary'
		--WHEN 'Work' THEN 'Stacionary'
		ELSE 'Other'
	END AS PhoneType
FROM Person.PhoneNumberType as p
GO

SELECT
	p.ProductID
	,p.Name
	,p.Size
	,CASE Size
		WHEN 'S' THEN 'SMALL'
		WHEN 'M' THEN 'MEDIUM'
		WHEN 'L' THEN 'LARGE'
		WHEN 'XL' THEN 'EXTRA LARGE'
		ELSE Size
	END AS FullSizeName
FROM Production.Product AS p
WHERE Size IS NOT NULL
GO