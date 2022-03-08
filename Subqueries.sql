/*
	Subqueries
*/

-- Basically a query within a query

SELECT *
FROM EmployeeSalary

-- Subquery in SELECT -> created another column with the avg salary next to each person's salary
SELECT EmployeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS AllAvgSalary
FROM EmployeeSalary

-- PARTITION BY -> Shows the exact same result as above
SELECT EmployeeID, Salary, AVG(Salary) over () AS AllAvgSalary
FROM EmployeeSalary

-- Why Group By doesn't work
SELECT EmployeeID, Salary, AVG(Salary) AS AllAvgSalary
FROM EmployeeSalary
GROUP BY EmployeeID, Salary
ORDER BY 1,2

-- Subquery in FROM > a little slow compared to a temp table or cte
SELECT a.EmployeeID, AllAvgSalary
FROM (SELECT EmployeeID, Salary, AVG(Salary) over () AS AllAvgSalary
	  FROM EmployeeSalary) a

-- Subquery in Where
Select EmployeeID, JobTitle, Salary
From EmployeeSalary
where EmployeeID in (
	Select EmployeeID
	From EmployeeDemographics
	where Age > 30)