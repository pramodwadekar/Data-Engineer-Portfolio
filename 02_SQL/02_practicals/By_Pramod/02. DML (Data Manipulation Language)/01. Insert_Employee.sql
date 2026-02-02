-- Statement 1: Basic INSERT without column names
INSERT INTO Employee
VALUES
(1, 'James Potter', '2014-06-01', 40000.00, NULL, 'FSI', 'TA', NULL, 1);

-- Statement 2: INSERT with explicit column names
INSERT INTO Employee
(Id, Ename, DOJ, Salary, Bonus, Dept, Designation, Manager, CompId)
VALUES
(1, 'James Potter', '2014-06-01', 40000.00, NULL, 'FSI', 'TA', NULL, 1);

-- Statement 3: INSERT using SELECT
INSERT INTO Employee
(Id, Ename, DOJ, Salary, Bonus, Dept, Designation, Manager, CompId)
SELECT QUERY;
