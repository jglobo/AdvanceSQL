/*
	Stored Procedures
*/

-- It's a group of SQL queries that can be created and stored in a database. 
-- They can be used by others in a network with different input data. 
-- Can reduce network traffic and increase performance. 
-- Can be updated and accessed by future users

-- This is how you create a Stored Procedured. Can be seen in the 'Programmability > Stored Procedures' under the database you created.
CREATE PROCEDURE TEST
AS
SELECT *
FROM EmployeeDemographics;

-- This is how to use it.
EXEC TEST


CREATE PROCEDURE Temp_Employee
AS
DROP TABLE IF EXISTS #temp_employee
Create table #temp_employee (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)

Insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM [SQL Tutorial].dbo.EmployeeDemographics emp
JOIN [SQL Tutorial].dbo.EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

Select * 
From #temp_employee;

EXEC Temp_Employee @JobTitle = 'Salesman'