-- 1. Employees earning more than average salary of their own department
SELECT Id, EName, Dept, Salary
FROM Employee E1
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee E2
    WHERE E1.Dept = E2.Dept
);

-- 2. Employees earning greater than or equal to average salary of their department
SELECT Id, EName, Dept, Salary
FROM Employee E1
WHERE Salary >= (
    SELECT AVG(Salary)
    FROM Employee E2
    WHERE E1.Dept = E2.Dept
);

-- 3. Employees whose salary is greater than their manager’s salary
-- a. Using Subquery
SELECT Id, EName, Salary, Dept
FROM Employee E
WHERE Salary > (
    SELECT Salary
    FROM Employee M
    WHERE E.Manager = M.Id
);

-- b. Using JOIN
SELECT E.Id, E.EName, E.Salary, E.Dept
FROM Employee E
JOIN Employee M
ON E.Manager = M.Id
AND E.Salary > M.Salary;

-- ✅ Tryout Section Queries
-- 1. Employees with salary ≥ average salary of their department:
SELECT Id, EName, Dept, Salary
FROM Employee E1
WHERE Salary >= (
    SELECT AVG(Salary)
    FROM Employee E2
    WHERE E1.Dept = E2.Dept
);

-- 2. Employees whose salary > manager’s salary:
SELECT Id, EName, Salary, Dept
FROM Employee E
WHERE Salary > (
    SELECT Salary
    FROM Employee M
    WHERE E.Manager = M.Id
);

-- Equivalent JOIN version:

SELECT E.Id, E.EName, E.Salary, E.Dept
FROM Employee E
JOIN Employee M
ON E.Manager = M.Id
AND E.Salary > M.Salary;





