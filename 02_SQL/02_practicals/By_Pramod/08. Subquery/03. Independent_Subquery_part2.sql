-- 1. Employee with Highest Salary
SELECT ID, EName, Salary
FROM Employee A
WHERE Salary = (SELECT MAX(Salary) FROM Employee B);



-- 2. Computers Allocated to Employees
-- a. Using IN operator
SELECT CompId, Make, Model
FROM Computer
WHERE CompId IN (SELECT CompId FROM Employee);


-- b. Using JOIN
SELECT C.CompId, C.Make, C.Model
FROM Computer C
INNER JOIN Employee E
ON E.CompId = C.CompId;



-- 3. Employees with Salary Greater than Average (using aggregations function in where clause)
SELECT EName, Dept
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);



-- 4. Department with Maximum Total Salary (nasted aggregations function)
SELECT Dept
FROM Employee
GROUP BY Dept
HAVING SUM(Salary) = (
    SELECT MAX(Q1.total_salary) AS "Max Total Salary"
    FROM (
        SELECT SUM(Salary) total_salary
        FROM Employee
        GROUP BY Dept
    ) Q1
);



-- 5. Employee with Highest Salary (Id, Name, Salary, Dept)
SELECT Id, EName, Salary, Dept
FROM Employee
WHERE Salary = (SELECT MAX(Salary) FROM Employee);




