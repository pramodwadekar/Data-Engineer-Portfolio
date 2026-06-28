-- User Defined Function (UDF)
-- Definition

-- A User Defined Function (UDF) is a function created by the user to perform a specific task and return a value.

-- Simple Explanation
-- Created by the user.
-- Accepts input parameters.
-- Always returns a value.
-- Can be used inside SELECT, WHERE, ORDER BY, etc.

-- | EmpId | EName | Salary |
-- | ----: | ----- | -----: |
-- |   101 | Amit  |  50000 |
-- |   102 | Rahul |  70000 |
-- |   103 | Neha  |  60000 |

-- Example 1: Function to Calculate Bonus (10%)
-- Create Function

DELIMITER //

CREATE FUNCTION CalculateBonus(Salary INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN Salary * 0.10;
END //

DELIMITER ;

-- Execute
SELECT EName,
       Salary,
       CalculateBonus(Salary) AS Bonus
FROM Employee;

-- | EmpId | EName | Salary | Bonus |
-- | ----: | ----- | -----: | ----: |
-- |   101 | Amit  |  50000 |  5000 |
-- |   102 | Rahul |  70000 |  7000 |
-- |   103 | Neha  |  60000 |  6000 |

-- Example 2: Function to Add Two Numbers
-- Create Function
DELIMITER //

CREATE FUNCTION AddNumbers(
    Num1 INT,
    Num2 INT
)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN Num1 + Num2;
END //

DELIMITER ;
Execute
SELECT AddNumbers(10, 20) AS Result;
-- Output
-- Result
-- 30


-- Difference Between Stored Procedure and UDF

-- | Stored Procedure                         | User Defined Function (UDF)                 |
-- | ---------------------------------------- | ------------------------------------------- |
-- | Executed using `CALL`                    | Used inside SQL queries                     |
-- | May or may not return a value            | Always returns a value                      |
-- | Can perform `INSERT`, `UPDATE`, `DELETE` | Mainly used to calculate and return a value |


