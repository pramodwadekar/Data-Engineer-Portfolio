-- 🔹 Part 1: WHERE Clause Basics (Comparison, AND, OR, BETWEEN)
-- Case 1: Salary greater than 40000
SELECT Id, EName
FROM Employee
WHERE Salary > 40000;

-- Case 2: Employee named James Potter
SELECT Id, Salary
FROM Employee
WHERE EName = 'James Potter';

-- Case 3: Employees in ETA with Salary ≥ 30000
SELECT Id, EName
FROM Employee
WHERE Salary >= 30000 AND Dept = 'ETA';

-- Case 4: Employees in ICP OR Salary > 75000
SELECT Id, EName
FROM Employee
WHERE Salary > 75000 OR Dept = 'ICP';

-- Case 5: Salary between 30000 and 50000
SELECT Id, EName
FROM Employee
WHERE Salary BETWEEN 30000 AND 50000;

-- 🔹 Part 2: WHERE with IN and NULL
-- Case 1: Employees with Id IN (2,3)
SELECT Id, EName
FROM Employee
WHERE Id IN (2,3);

-- Case 2: Employees with Id NOT IN (2,3)
SELECT Id, EName
FROM Employee
WHERE Id NOT IN (2,3);

-- Case 3: Employees in Dept = 'ETA'
SELECT Id, EName
FROM Employee
WHERE Dept IN ('ETA');

-- Case 4: Employees with Bonus IS NULL
SELECT Id, EName
FROM Employee
WHERE Bonus IS NULL;

-- Case 5: Employees with Bonus IS NOT NULL
SELECT Id, EName
FROM Employee
WHERE Bonus IS NOT NULL;

-- 🔹 Part 3: WHERE with String Comparison

-- Case 1: Exact match (Designation = 'PM')
SELECT Id, EName, Designation
FROM Employee
WHERE Designation = 'PM';

-- Case 2: Trailing spaces (Designation = 'PM  ')
SELECT Id, EName, Designation
FROM Employee
WHERE Designation = 'PM  ';

-- Case 3: Leading spaces (Designation = ' PM')
SELECT Id, EName, Designation
FROM Employee
WHERE Designation = ' PM';








