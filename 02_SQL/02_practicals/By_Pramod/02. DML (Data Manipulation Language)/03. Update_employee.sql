-- Updates all rows (no WHERE clause).
UPDATE Employee
SET Salary = Salary * 1.1;

-- Updates only employee with Id = 1.
UPDATE Employee
SET Salary = Salary * 1.2
WHERE Id = 1;

-- Updates multiple columns for a single row.
UPDATE Employee
SET Salary = Salary * 1.2, Bonus = 100
WHERE Id = 1;

-- Without WHERE clause (all rows updated)
UPDATE Employee
SET Salary = Salary * 1.2;

-- Single column update
UPDATE Employee
SET Salary = Salary * 1.2
WHERE Id = 2;

-- Multiple column update
UPDATE Employee
SET Salary = Salary * 1.4, Bonus = Salary * 0.40
WHERE Id = 1;

-- Multiple conditions in WHERE
UPDATE Employee
SET Salary = Salary * 1.40
WHERE Designation = 'SE' OR Dept = 'ETA';


