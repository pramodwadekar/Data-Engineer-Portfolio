-- 1. PIVOT
-- Definition
-- PIVOT converts row values into columns.
-- Easy Trick
-- Rows ➜ Columns

-- | Employee | Month | Sales |
-- | -------- | ----- | ----: |
-- | Amit     | Jan   |  1000 |
-- | Amit     | Feb   |  1200 |
-- | Rahul    | Jan   |  1500 |
-- | Rahul    | Feb   |  1800 |

SELECT *
FROM
(
    SELECT Employee, Month, Sales
    FROM Sales
) AS SourceTable

PIVOT
(
    SUM(Sales)
    FOR Month IN ([Jan], [Feb])
) AS PivotTable;

| Employee |  Jan |  Feb |
| -------- | ---: | ---: |
| Amit     | 1000 | 1200 |
| Rahul    | 1500 | 1800 |

-- Notice:
-- Month values (Jan, Feb) became column names.

===================================================================================================================

-- 2. UNPIVOT
-- Simple Definition
-- UNPIVOT converts columns into rows.

-- Easy Trick
-- Columns ➜ Rows

-- | Employee |  Jan |  Feb |
-- | -------- | ---: | ---: |
-- | Amit     | 1000 | 1200 |
-- | Rahul    | 1500 | 1800 |

SELECT Employee,
       Month,
       Sales
FROM SalesPivot

UNPIVOT
(
    Sales FOR Month IN (Jan, Feb)
) AS UnpivotTable;

| Employee | Month | Sales |
| -------- | ----- | ----: |
| Amit     | Jan   |  1000 |
| Amit     | Feb   |  1200 |
| Rahul    | Jan   |  1500 |
| Rahul    | Feb   |  1800 |


-- PIVOT

-- Converts rows into columns.

-- UNPIVOT

-- Converts columns into rows.
