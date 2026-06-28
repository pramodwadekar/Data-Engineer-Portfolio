-- 1. NULLIF()
-- Definition
-- NULLIF(expr1, expr2) returns NULL if both values are equal; otherwise, it returns the first value.

-- NULLIF(value1, value2)
-- Example 1
SELECT NULLIF(10, 10) AS Result;

-- Result
-- ------
-- NULL

-- Because:
-- 10 = 10 ✅
-- Return NULL

-- Example 2
SELECT NULLIF(10, 20) AS Result;
-- Output
-- Result
-- ------
-- 10

-- Because:
-- 10 ≠ 20 ❌
-- Return the first value (10)

=====================================================================================================================

-- 2. EXISTS
-- Definition
-- EXISTS returns TRUE if the subquery returns at least one row.
-- Employee:
-- | EmpId | EName | DeptId |
-- | ----: | ----- | -----: |
-- |   101 | Amit  |      1 |
-- |   102 | Rahul |      2 |
-- |   103 | Neha  |      3 |
--Department:
-- | DeptId | DeptName |
-- | -----: | -------- |
-- |      1 | IT       |
-- |      2 | HR       |

SELECT EName
FROM Employee E
WHERE EXISTS (
    SELECT *
    FROM Department D
    WHERE E.DeptId = D.DeptId
);

-- EName
-- ------
-- Amit
-- Rahul

-- Explanation
-- Amit → DeptId 1 exists ✅
-- Rahul → DeptId 2 exists ✅
-- Neha → DeptId 3 does not exist ❌

================================================================================================================
-- 3. NOT EXISTS
-- Definition
-- NOT EXISTS returns TRUE if the subquery returns no rows.

SELECT EName
FROM Employee E
WHERE NOT EXISTS (
    SELECT *
    FROM Department D
    WHERE E.DeptId = D.DeptId
);

-- EName
-- ------
-- Neha

Explanation
Amit → Department exists ❌
Rahul → Department exists ❌
Neha → No matching department ✅

=======================================================================================================

-- IN
-- IN checks whether a value exists in a list or in the result of a subquery.

SELECT EName
FROM Employee
WHERE DeptId IN (
    SELECT DeptId
    FROM Department
);

-- EName
-- ------
-- Amit
-- Rahul

-- Difference between IN And EXISTS
-- | IN                           | EXISTS                                  |
-- | ---------------------------- | --------------------------------------- |
-- | Compares a value with a list | Checks whether a matching row exists    |
-- | Best for small result sets   | Best for large result sets              |
-- | Subquery executes first      | Checks row by row (correlated subquery) |
-- | Can be slower for large data | Usually faster for large data           |


