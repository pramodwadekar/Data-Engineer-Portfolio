-- INTERSECT
-- Definition
-- INTERSECT returns only the common rows that are present in both SELECT queries.
-- Employee_2024
-- | EmpId | EName |
-- | ----: | ----- |
-- |   101 | Amit  |
-- |   102 | Rahul |
-- |   103 | Neha  |
-- Employee_2025
-- | EmpId | EName |
-- | ----: | ----- |
-- |   102 | Rahul |
-- |   103 | Neha  |
-- |   104 | Priya |

SELECT EmpId, EName
FROM Employee_2024

INTERSECT

SELECT EmpId, EName
FROM Employee_2025;

-- EmpId   EName
-- ------  ------
-- 102     Rahul
-- 103     Neha

===================================================================================================================

-- EXCEPT (SQL Server / PostgreSQL)
-- Definition
-- EXCEPT returns rows from the first query that are not present in the second query.

SELECT EmpId, EName
FROM Employee_2024

EXCEPT

SELECT EmpId, EName
FROM Employee_2025;

-- EmpId   EName
-- ------  ------
-- 101     Amit

-- its consider as firts table and then match the second table means 104 and Priya not in first table its except

===================================================================================================================

-- MINUS (Oracle)
-- MINUS works the same as EXCEPT.

SELECT EmpId, EName
FROM Employee_2024

MINUS

SELECT EmpId, EName
FROM Employee_2025;

-- EmpId   EName
-- ------  ------
-- 101     Amit

-- | Operator           | Meaning                                                       |
-- | ------------------ | ------------------------------------------------------------- |
-- | `UNION`            | Combines rows and removes duplicates                          |
-- | `UNION ALL`        | Combines all rows including duplicates                        |
-- | `INTERSECT`        | Returns only common rows                                      |
-- | `EXCEPT` / `MINUS` | Returns rows present in the first query but not in the second |

  
