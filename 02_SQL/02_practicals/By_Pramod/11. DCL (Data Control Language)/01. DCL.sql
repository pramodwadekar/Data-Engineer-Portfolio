-- 📌 DCL Basics
-- # GRANT Privileges
-- Provide SELECT privilege on Employee table to user Raghav
GRANT SELECT ON TABLE Employee TO Raghav;


-- # REVOKE Privileges
-- Revoke SELECT privilege from user Raghav
REVOKE SELECT ON TABLE Employee FROM Raghav CASCADE;



-- 📌 Create User and Grant Privileges
-- Create a new user
CREATE USER tia PASSWORD 'tia123';

-- Grant SELECT privilege on Employee table
GRANT SELECT ON Employee TO Tia;

-- Grant UPDATE privilege only on Salary column
GRANT UPDATE(Salary) ON Employee TO Tia;

-- Check users
SELECT * FROM INFORMATION_SCHEMA.SYSTEM_USERS;


-- Test Privileges
-- Allowed: update salary
UPDATE Employee SET Salary = 60000 WHERE EmpId = 5;

-- Not allowed: update Dept (will throw error)
UPDATE Employee SET Dept = 'HR' WHERE EmpId = 5;



-- 📌 Revoke Privileges
-- Revoke UPDATE privilege on Salary column
REVOKE UPDATE(Salary) ON Employee FROM Tia RESTRICT;

-- Test again (will throw error)
UPDATE Employee SET Salary = 60000 WHERE EmpId = 5;

-- Still allowed: SELECT privilege
SELECT * FROM Employee;



-- 📌 Roles and Users
-- # Create Schema and Role
-- Create schema
CREATE SCHEMA Infy;

-- Switch schema
SET SCHEMA Infy;

-- Create role
CREATE ROLE AccountsExecutive;


-- # Grant Privileges to Role
-- Grant UPDATE privilege on Salary column
GRANT UPDATE(Salary) ON Employee TO AccountsExecutive;

-- Grant SELECT privilege on specific columns
GRANT SELECT(EmpId, EmpName, Salary) ON Employee TO AccountsExecutive;


-- # Create User and Assign Role
-- Create user Emily
CREATE USER Emily PASSWORD 'emily123';

-- Grant role to user
GRANT AccountsExecutive TO Emily;



-- 📌 Check Access Control
-- Login as Emily
-- Check user info
SELECT * FROM INFORMATION_SCHEMA.SYSTEM_USERS;

-- Allowed: view name and salary
SELECT EmpName, Salary FROM Infy.Employee;

-- Not allowed: view department (will throw error)
SELECT EmpName, Dept FROM Infy.Employee;

-- Allowed: update salary
UPDATE Infy.Employee SET Salary = 40000 WHERE EmpId = 4;



-- 📌 Revoke Role from User
-- Revoke role from Emily
REVOKE AccountsExecutive FROM Emily CASCADE;

-- Test again (will throw error)
UPDATE Infy.Employee SET Salary = 60000 WHERE EmpId = 4;

