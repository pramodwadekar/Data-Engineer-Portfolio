-- Recursive CTE
-- Simple Definition
-- A Recursive CTE is a Common Table Expression (CTE) that references itself. It is used to work with hierarchical or recursive data, such as employee-manager relationships, organization charts, and folder structures.

WITH RECURSIVE CTE_Name AS
(
    -- Anchor Query (Starting Row)

    UNION ALL

    -- Recursive Query (References the CTE itself)
)
SELECT *
FROM CTE_Name;

-- | EmpId | EName | ManagerId |
-- | ----: | ----- | --------: |
-- |     1 | CEO   |      NULL |
-- |     2 | Amit  |         1 |
-- |     3 | Rahul |         1 |
-- |     4 | Neha  |         2 |
-- |     5 | Priya |         2 |
-- |     6 | Karan |         4 |

-- Hierarchy:

-- CEO
-- ├── Amit
-- │   ├── Neha
-- │   │   └── Karan
-- │   └── Priya
-- └── Rahul
  
-- Query (MySQL 8+/PostgreSQL)

WITH RECURSIVE EmployeeHierarchy AS
(
    -- Anchor Query
    SELECT EmpId,
           EName,
           ManagerId,
           1 AS Level
    FROM Employee
    WHERE ManagerId IS NULL

    UNION ALL

    -- Recursive Query
    SELECT E.EmpId,
           E.EName,
           E.ManagerId,
           EH.Level + 1
    FROM Employee E
    JOIN EmployeeHierarchy EH
      ON E.ManagerId = EH.EmpId
)
SELECT *
FROM EmployeeHierarchy;


-- | EmpId | EName | ManagerId | Level |
-- | ----: | ----- | --------: | ----: |
-- |     1 | CEO   |      NULL |     1 |
-- |     2 | Amit  |         1 |     2 |
-- |     3 | Rahul |         1 |     2 |
-- |     4 | Neha  |         2 |     3 |
-- |     5 | Priya |         2 |     3 |
-- |     6 | Karan |         4 |     4 |

