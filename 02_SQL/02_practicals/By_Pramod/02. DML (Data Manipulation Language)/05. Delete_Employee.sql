-- Basic DELETE statements
-- Delete all rows from Employee table
DELETE FROM Employee;

-- Delete rows where Dept = 'ETA'
DELETE FROM Employee
WHERE Dept = 'ETA';

-- Delete single row (employee with Id = 5)
DELETE FROM Employee
WHERE Id = 5;

-- Delete multiple rows (ETA employees with Manager = 2)
DELETE FROM Employee
WHERE Dept = 'ETA' AND Manager = 2;

-- Delete computer record with CompId = 1001 (fails due to FK constraint)
DELETE FROM Computer
WHERE CompId = 1001;

-- Delete all rows from Employee table (no WHERE clause)
DELETE FROM Employee;
