-- 📌 Views – Requirement 2
-- Create a view to access employees without CompID
CREATE VIEW View_CompDetails
AS
SELECT ID, CompID FROM Employee WHERE CompID IS NULL;

-- Access the view
SELECT * FROM View_CompDetails;

-- Update via view
UPDATE View_CompDetails SET CompID = 1004 WHERE ID = 2;

-- Verify changes
SELECT * FROM View_CompDetails;
SELECT * FROM Employee;



-- 📌 Views – Without Primary Key
-- Create a view without Primary Key
CREATE VIEW View_EmpNoPK
AS
SELECT EName, DOJ, Salary, Bonus, Dept, Designation, Manager, CompID 
FROM Employee;

-- Access the view
SELECT * FROM View_EmpNoPK;

-- Insert (will fail due to missing PK)
INSERT INTO View_EmpNoPK 
VALUES('Anshu', '2024-01-01', 50000, 2000, 'ICP', 'SE', 1, 1005);

-- Update via view
UPDATE View_EmpNoPK SET Salary = 60000 WHERE Salary = 40000;

-- Delete via view
DELETE FROM View_EmpNoPK WHERE DOJ = '2014-01-01';

-- Verify changes
SELECT * FROM View_EmpNoPK;
SELECT * FROM Employee;



-- 📌 Views – Without Unique Key
-- Create a view without including CompID (Unique constraint)
CREATE VIEW View_EmpNoUK
AS
SELECT ID, EName, DOJ, Salary, Bonus, Dept, Designation, Manager 
FROM Employee;

-- Insert via view
INSERT INTO View_EmpNoUK 
VALUES(7, 'Aisha', '2024-01-10', 75000, 2000, 'ICP', 'SE', 1);

-- Update via view
UPDATE View_EmpNoUK SET Salary = 78000 WHERE Salary = 75000;

-- Delete via view
DELETE FROM View_EmpNoUK WHERE Bonus = 2000;

-- Verify changes
SELECT * FROM View_EmpNoUK;
SELECT * FROM Employee;



-- 📌 Views with Joins
-- Create a view with join on Employee and Computer
CREATE VIEW View_EmpJoin
AS
SELECT E.EName, C.Model 
FROM Employee E 
JOIN Computer C ON E.CompID = C.CompID;

-- Alternative with renamed columns
CREATE VIEW View_EmpJoin(EmpName, CompModel)
AS
SELECT E.EName, C.Model 
FROM Employee E 
JOIN Computer C ON E.CompID = C.CompID;

-- Access the view
SELECT * FROM View_EmpJoin;

-- Attempt DMLs (not allowed on join views)
INSERT INTO View_EmpJoin VALUES('Alisha', 'C1007');
UPDATE View_EmpJoin SET EName = 'Hazel';
DELETE FROM View_EmpJoin WHERE EName = 'Myra';

-- Verify
SELECT * FROM Employee;
SELECT * FROM Computer;
SELECT * FROM View_EmpJoin;



-- 📌 Drop View
-- Drop a view
DROP VIEW View_EmpNoUK;

-- Verify
SELECT * FROM View_EmpNoUK;  -- will fail
SELECT * FROM Employee;      -- still works


