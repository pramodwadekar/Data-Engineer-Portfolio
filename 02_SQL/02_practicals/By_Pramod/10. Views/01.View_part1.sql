
-- 📌 SQL Code from Introduction to Views
-- Creating a View
CREATE VIEW View_Emp
AS
SELECT * FROM Employee
WHERE Manager = 1 OR Id = 1;

-- Accessing the View
SELECT * FROM View_Emp;


--📌 DML Operations on Views
-- Insert via View
INSERT INTO View_Emp 
VALUES(6, 'Myra', '2024-01-01', 25000, 1000, 'ICP', 'SE', 1, 1004);

SELECT * FROM View_Emp;
SELECT * FROM Employee;


-- Update via View
UPDATE View_Emp 
SET EName = 'Richa' 
WHERE EName = 'Myra';

SELECT * FROM View_Emp;
SELECT * FROM Employee;


-- Delete via View
DELETE FROM View_Emp 
WHERE Id = 5;

SELECT * FROM View_Emp;
SELECT * FROM Employee;


-- 📌 Tryout Exercises (Execution Sequence)
-- 1. 	Create and Display View
CREATE VIEW View_Emp AS 
SELECT * FROM Employee 
WHERE Manager = 1 OR Id = 1;

SELECT * FROM View_Emp;


-- 2. 	Insert via View
CREATE VIEW View_Emp AS 
SELECT * FROM Employee 
WHERE Manager = 1 OR Id = 1;

INSERT INTO View_Emp 
VALUES(6, 'Myra', '2024-01-01', 25000, 1000, 'ICP', 'SE', 1, 1004);

SELECT * FROM View_Emp;
SELECT * FROM Employee;


-- 3. 	Update via View
CREATE VIEW View_Emp AS 
SELECT * FROM Employee 
WHERE Manager = 1 OR Id = 1;

UPDATE View_Emp 
SET EName = 'Stephen' 
WHERE EName = 'Ayaz Mohammad';

SELECT * FROM View_Emp;
SELECT * FROM Employee;


-- 4. 	Delete via View
CREATE VIEW View_Emp AS 
SELECT * FROM Employee 
WHERE Manager = 1 OR Id = 1;

DELETE FROM View_Emp 
WHERE Id = 5;

SELECT * FROM View_Emp;
SELECT * FROM Employee;

