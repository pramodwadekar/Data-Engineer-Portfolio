-- Stored Procedure
-- Definition

-- A Stored Procedure is a collection of SQL statements stored in the database that can be executed whenever needed.

-- Simple Explanation
-- Stored in the database.
-- Write once, execute many times.
-- Reduces code duplication.
-- Can accept input parameters.

-- | EmpId | EName | Salary |
-- | ----: | ----- | -----: |
-- |   101 | Amit  |  50000 |
-- |   102 | Rahul |  70000 |
-- |   103 | Neha  |  60000 |

-- Example 1: Create Stored Procedure
CREATE PROCEDURE GetEmployees
AS
BEGIN
    SELECT * FROM Employee;
END;

-- Execute Procedure
EXEC GetEmployees;

CALL GetEmployees;

-- Output:
-- | EmpId | EName | Salary |
-- | ----: | ----- | -----: |
-- |   101 | Amit  |  50000 |
-- |   102 | Rahul |  70000 |
-- |   103 | Neha  |  60000 |

====================================================================================================

-- Example 2: Display Employee by ID
-- Create Procedure
-- DELIMITER //

CREATE PROCEDURE GetEmployeeById(IN p_EmpId INT)
BEGIN
    SELECT *
    FROM Employee
    WHERE EmpId = p_EmpId;
END //

DELIMITER ;

-- Execute
CALL GetEmployeeById(102);

-- Output
| EmpId | EName | Salary |
| ----: | ----- | -----: |
|   102 | Rahul |  70000 |

===================================================================================================================

-- Example 3: Update Employee Salary
-- Create Procedure
-- DELIMITER //

CREATE PROCEDURE UpdateSalary(
    IN p_EmpId INT,
    IN p_Salary INT
)
BEGIN
    UPDATE Employee
    SET Salary = p_Salary
    WHERE EmpId = p_EmpId;
END //

DELIMITER ;
-- Execute
CALL UpdateSalary(101, 55000);

-- Output
-- | EmpId | EName | Salary |
-- | ----: | ----- | -----: |
-- |   101 | Amit  |  55000 |
-- |   102 | Rahul |  70000 |
-- |   103 | Neha  |  60000 |



