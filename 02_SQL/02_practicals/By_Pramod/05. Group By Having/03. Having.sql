-- 1. Basic HAVING Example
SELECT Dept, SUM(Salary)
FROM Employee
GROUP BY Dept
HAVING SUM(Salary) >= 90000;

-- 2. HAVING with Greater Than Condition
SELECT Dept, SUM(Salary)
FROM Employee
GROUP BY Dept
HAVING SUM(Salary) > 90000;

-- 3. WHERE vs HAVING (Filtering Non-Aggregates)
-- Using HAVING:
SELECT Dept, SUM(Salary)
FROM Employee
GROUP BY Dept
HAVING Dept <> 'SE';

-- Using WHERE (Optimal):
SELECT Dept, SUM(Salary)
FROM Employee
WHERE Dept <> 'SE'
GROUP BY Dept;

-- 4. Incorrect vs Correct Aggregate Filtering
-- Incorrect (aggregate in WHERE):
SELECT Dept, SUM(Salary)
FROM Employee
WHERE SUM(Salary) > 87000
GROUP BY Dept;


-- Correct (aggregate in HAVING):
SELECT Dept, SUM(Salary)
FROM Employee
GROUP BY Dept
HAVING SUM(Salary) > 87000;





