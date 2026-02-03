-- Example 1: Ascending order of Salary
SELECT Id, EName, Salary 
FROM Employee 
ORDER BY Salary;

-- Example 2: Ascending order of Dept
SELECT Id, EName, Dept 
FROM Employee 
ORDER BY Dept ASC;

-- Example 3: Descending order of DOJ (Date of Joining)
SELECT Id, EName, DOJ 
FROM Employee 
ORDER BY DOJ DESC;

-- Example 4: Multiple columns (Dept ASC, Designation ASC)
SELECT Id, EName, Dept, Designation 
FROM Employee 
ORDER BY Dept, Designation;

-- Example 5: Multiple columns (Dept ASC, Designation DESC)
SELECT Id, EName, Dept, Designation 
FROM Employee 
ORDER BY Dept ASC, Designation DESC;

-- Example 6: Positional sorting (by 2nd column)
SELECT Id, EName 
FROM Employee 
ORDER BY 2;

-- Example 7: Sorting by column not in SELECT (Salary)
SELECT Id, EName, Designation 
FROM Employee 
ORDER BY Salary;

-- Example 8: Ascending order of EName
SELECT Id, EName, Salary 
FROM Employee 
ORDER BY EName;

-- Example 9: Multiple columns (EName ASC, Salary ASC)
SELECT Id, EName, Salary 
FROM Employee 
ORDER BY EName, Salary;

-- Example 10: Descending order of EName
SELECT Id, EName, Salary 
FROM Employee 
ORDER BY EName DESC;

-- Example 11: Multiple columns (EName ASC, Salary DESC)
SELECT Id, EName, Salary 
FROM Employee 
ORDER BY EName ASC, Salary DESC;

-- Example 12: Positional sorting (by 2nd and 3rd columns)
SELECT Id, EName, Salary 
FROM Employee 
ORDER BY 2, 3;
