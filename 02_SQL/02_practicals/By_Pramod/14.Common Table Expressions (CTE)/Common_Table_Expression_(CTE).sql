-- A CTE (Common Table Expression) is a temporary named result set created using the WITH keyword that can be referenced within a single SQL statement to make queries easier to read and maintain.

-- Syntax:
WITH CTE_Name AS (
    SELECT column1, column2
    FROM table_name
)
SELECT *
FROM CTE_Name;

/*
| Id  | EName | Department | Salary |
| --- | ----- | ---------- | ------ |
| 101 | Amit  | IT         |  50000 |
| 102 | Rahul | HR         |  40000 |
| 103 | Neha  | IT         |  70000 |
| 104 | Priya | Finance    |  60000 |
*/

WITH HighSalary AS (
    SELECT Id, EName, Department, Salary
    FROM Employee
    WHERE Salary > 50000
)
SELECT *
FROM HighSalary;

-- Id   EName   Department   Salary
-- ---  ------  -----------  ------
-- 103  Neha    IT            70000
-- 104  Priya   Finance       60000

WITH AvgSalary AS (
    SELECT AVG(Salary) AS Avg_Salary
    FROM Employee
)
SELECT Avg_Salary
FROM AvgSalary;

-- Avg_Salary
-- ----------
-- 55000
