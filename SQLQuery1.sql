--Table 1 Query:
Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

--Table 2 Query:
Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
)



--Table 1 Insert:
Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

--Table 2 Insert:
Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

DROP TABLE IF EXISTS #Temp_employee

CREATE TABLE #Temp_employee
(JobTitle varChar(50), EmployeesPerJob varChar(50) , AvgAge int, AvgSalary int)

INSERT INTO #Temp_employee
SELECT JopTitle, COUNT(JopTitle) ,AVG(Age), AVG(Salary)
FROM SQLTutorial.dbo.EmployeeDemographics Demo
JOIN SQLTutorial.dbo.EmployeeSalary Sal
	ON Demo.EmployeeID = Sal.EmployeeID
GROUP BY JopTitle

SELECT *
FROM #Temp_employee

--Use Update and Delete
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET Gender = 'Female', age = 31
WHERE EmployeeID = 1012


SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName = 'Holy'  AND LastName = 'Flax'

DELETE FROM SQLTutorial.dbo.EmployeeDemographics
WHERE EmployeeID = 1005


--CASE
SELECT FirstName, LastName, JopTitle, Salary,
CASE 
	WHEN JopTitle = 'Salesman' THEN Salary + (Salary * .10)
	WHEN JopTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JopTitle = 'HR' THEN Salary +(Salary * .000001)
	ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


--Upper and Lower
SELECT FirstName, UPPER(FirstName)
FROM SQLTutorial.dbo.EmployeeDemographics

SELECT FirstName, LOWER(FirstName)
FROM SQLTutorial.dbo.EmployeeDemographics


--Replace
SELECT LastName, REPLACE(LastName, 'Palmer', 'Palm') AS LastNameFixed
FROM SQLTutorial.dbo.EmployeeDemographics

--Trim
SELECT FirstName, TRIM(FirstName) AS FirstNameTrimed
From SQLTutorial.dbo.EmployeeDemographics