/* 
	CTEs
*/

-- CTE are essentially created in memory not really a temp table. They are not saved any where so they must be ran with this entire query.
WITH CTE_Employee AS 
(SELECT 
	FirstName, 
	LastName, 
	Gender, 
	Salary, 
	COUNT(Gender) OVER(PARTITION BY Gender) AS TotalGender, 
	AVG(Salary) OVER(PARTITION BY Gender) AS AvgSalary
FROM [SQL Tutorial].dbo.EmployeeDemographics emp
JOIN [SQL Tutorial].dbo.EmployeeSalary Sal
	ON emp.EmployeeID = Sal.EmployeeID
WHERE Salary > '4500'
)
SELECT FirstName, AvgSalary
FROM CTE_Employee;

/* 
	Temp Tables
*/

-- Here we are creating a Temp Table. It's made the same way you would with a regular table, except the only difference is using a '#' right before the name. 
-- You don't need to retype it in order to run it. 
-- Temp tables are good for tables that have an extremely large amount of data.

CREATE TABLE #temp_Employee (
EmployeeID INT,
JobtTitle VARCHAR(100),
Salary INT
)

SELECT *
FROM #temp_Employee;

INSERT INTO #temp_Employee VALUES (
'1001', 'HR', '45000'
)

-- Here we used the data from employeesalary to fill the temp table
INSERT INTO #temp_Employee
SELECT *
FROM [SQL Tutorial].dbo.EmployeeSalary;

-- Here we created a new table again. Temp tables are good because they use less processing power than using complex JOINS and UNIONS.
-- You can only run this query once because it's taking up that particular space in memory. So you can't create it twice.
CREATE TABLE #Temp_Employee2 (
JobtTitle VARCHAR(50),
EmployeesPerJob INT,
AvgAge INT,
AvgSalary INT
)

INSERT INTO #Temp_Employee2
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM [SQL Tutorial].dbo.EmployeeDemographics emp
JOIN [SQL Tutorial].dbo.EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #Temp_Employee2;

-- We can run around this by dropping the table first, then creating it. Data Base Analysts are good at doing studying and analysing storage capacities and processing power for such extreme functions.
DROP TABLE IF EXISTS #Temp_Employee2
CREATE TABLE #Temp_Employee2 (
JobtTitle VARCHAR(50),
EmployeesPerJob INT,
AvgAge INT,
AvgSalary INT
)

INSERT INTO #Temp_Employee2
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM [SQL Tutorial].dbo.EmployeeDemographics emp
JOIN [SQL Tutorial].dbo.EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #Temp_Employee2;

