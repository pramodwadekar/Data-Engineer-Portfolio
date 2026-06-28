-- MERGE (UPSERT)
-- Simple Definition
-- MERGE (also called UPSERT) is used to INSERT a new row if it doesn't exist, or UPDATE the existing row if it already exists.

-- IF record exists
--     → UPDATE
-- ELSE
--     → INSERT

-- Employee (Target Table)

-- | EmpId | EName | Salary |
-- | ----: | ----- | -----: |
-- |   101 | Amit  |  50000 |
-- |   102 | Rahul |  60000 |

-- NewEmployee (Source Table)

-- | EmpId | EName | Salary |
-- | ----: | ----- | -----: |
-- |   102 | Rahul |  65000 |
-- |   103 | Neha  |  55000 |

MERGE INTO Employee E
USING NewEmployee N
ON (E.EmpId = N.EmpId)
WHEN MATCHED THEN
    UPDATE
    SET E.Salary = N.Salary
WHEN NOT MATCHED THEN
    INSERT (EmpId, EName, Salary)
    VALUES (N.EmpId, N.EName, N.Salary);

-- How it Works
-- Row 1
-- EmpId = 102

-- Exists in Employee table?

-- ✅ Yes

-- So:
-- UPDATE Salary
-- 60000 → 65000
-- Row 2
-- EmpId = 103

-- Exists?
-- ❌ No
  
-- So:
-- INSERT New Record


-- Final Employee Table
-- | EmpId | EName | Salary |
-- | ----: | ----- | -----: |
-- |   101 | Amit  |  50000 |
-- |   102 | Rahul |  65000 |
-- |   103 | Neha  |  55000 |

  
-- Visual Representation
-- Before

-- Employee

-- 101 Amit   50000
-- 102 Rahul  60000

-- NewEmployee

-- 102 Rahul  65000
-- 103 Neha   55000

-- ↓

-- After MERGE
-- 101 Amit   50000
-- 102 Rahul  65000   ← Updated
-- 103 Neha   55000   ← Inserted

  
-- Why is it called UPSERT?

-- UPSERT = UPDATE + INSERT

-- If record exists → UPDATE
-- If record doesn't exist → INSERT
