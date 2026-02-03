-- Basic Aggregate without GROUP BY
SELECT COUNT(Id) AS "NUMBER_OF_EMPLOYEES"
FROM Employee;


-- Group By Single Column
SELECT Dept, COUNT(Id) AS "NO_OF_EMPLOYEES"
FROM Employee
GROUP BY Dept;


-- Group By Multiple Columns (Case 1)
SELECT Dept, Manager, COUNT(Id) AS "NO_OF_EMPLOYEES"
FROM Employee
GROUP BY Dept, Manager;



-- Group By Multiple Columns (Case 2 - with Designation)
SELECT Dept, Manager, COUNT(Id) AS "NO_OF_EMPLOYEES"
FROM Employee
GROUP BY Dept, Manager, Designation;



-- Group By with Multiple Aggregate Functions
SELECT Dept,
       MIN(Salary) AS "MIN_SALARY",
       MAX(Salary) AS "MAX_SALARY"
FROM Employee
GROUP BY Dept;



-- Group By on Nullable Column
SELECT Manager, COUNT(Id) AS "NO_OF_EMPLOYEES"
FROM Employee
GROUP BY Manager;



-- By for Salary Summation
SELECT Dept, SUM(Salary)
FROM Employee
GROUP BY Dept;




