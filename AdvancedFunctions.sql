/*
	TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower
*/
Drop Table IF EXISTS EmployeeErrors
CREATE TABLE EmployeeErrors (
EmployeeID VARCHAR(50),
FirstName VARCHAR(50),
LastName VARCHAR(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors

-- Using TRIM -> get's rid of white space on both the left and right sides of values
SELECT EmployeeID, TRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors;

-- LTRIM -> get's rid of white space on the left sides of values
SELECT EmployeeID, LTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors;

--RTRIM -> get's rid of white space right sides of values
SELECT EmployeeID, RTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors;


-- Using Replace -> we fixed the last name for Flenderson. Use it like this REPLACE(column_name, what needs to be replaced, and what to replace it with)
Select LastName, REPLACE(LastName, '- Fired', '') AS LastNameFixed
From EmployeeErrors

-- Using Substring -> takes the first 3 letters of the field within the column, so Jimbo is now Jim
Select SUBSTRING(FirstName,1,3)
From EmployeeErrors

-- This is called a fuzzy match, meaning that it will match all both tables that have the same characters ignoring the case
-- fuzzy matching is usually done with gender, lastname, age, DOB.
Select SUBSTRING(err.FirstName,1,3), SUBSTRING(dem.FirstName,1,3)
From EmployeeErrors err
JOIN [SQL Tutorial].dbo.EmployeeDemographics dem
	ON SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)

-- Using UPPER -> capitalizes all letters in the field
Select FirstName, UPPER(FirstName)
From EmployeeErrors

-- Using Lower -> lowercases all letters in the field
Select FirstName, LOWER(FirstName)
From EmployeeErrors