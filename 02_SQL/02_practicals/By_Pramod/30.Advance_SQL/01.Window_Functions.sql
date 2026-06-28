-- Window Functions
-- Definition
-- A Window Function performs calculations across a set of rows related to the current row without grouping or without collapsing the rows.
-- Unlike GROUP BY, Window Functions do not reduce the number of rows.

-- | EmpId | EName | Department | Salary |
-- | ----: | ----- | ---------- | -----: |
-- |   101 | Amit  | IT         |  50000 |
-- |   102 | Rahul | IT         |  70000 |
-- |   103 | Neha  | HR         |  60000 |
-- |   104 | Priya | HR         |  80000 |
-- |   105 | Karan | IT         |  90000 |

=================================================================================================================
-- 1. ROW_NUMBER():
-- Definition
-- Assigns a unique sequential number to each row.

SELECT EmpId, EName, Salary,
       ROW_NUMBER() OVER(ORDER BY Salary DESC) AS RowNo
FROM Employee;

-- EmpId  EName   Salary   RowNo
-- -----  ------  -------  -----
-- 105    Karan    90000      1
-- 104    Priya    80000      2
-- 102    Rahul    70000      3
-- 103    Neha     60000      4
-- 101    Amit     50000      5

==================================================================================================================
  
-- 2. RANK()
-- Definition
-- Assigns the same rank to equal values and skips the next rank.

SELECT EName, Salary,
       RANK() OVER(ORDER BY Salary DESC) AS RankNo
FROM Employee;

-- Example Output (if Rahul and Neha both earn 70000)
-- EName   Salary   RankNo
-- ------  -------  ------
-- Karan    90000      1
-- Priya    80000      2
-- Rahul    70000      3
-- Neha     70000      3
-- Amit     50000      5

===============================================================================================================
  
-- 3. DENSE_RANK()
-- Definition
-- Assigns the same rank to equal values but does not skip the next rank.

SELECT EName, Salary,
       DENSE_RANK() OVER(ORDER BY Salary DESC) AS DenseRank
FROM Employee;

-- EName   Salary   DenseRank
-- ------  -------  ---------
-- Karan    90000      1
-- Priya    80000      2
-- Rahul    70000      3
-- Neha     70000      3
-- Amit     50000      4

==================================================================================================================
-- 4. SUM() OVER()
-- Definition
-- Calculates a running total or total without using GROUP BY.

SELECT EName,
       Salary,
       SUM(Salary) OVER() AS TotalSalary
FROM Employee;

-- EName   Salary   TotalSalary
-- ------  -------  -----------
-- Amit     50000     350000
-- Rahul    70000     350000
-- Neha     60000     350000
-- Priya    80000     350000
-- Karan    90000     350000

================================================================================================================
-- 5. AVG() OVER()
SELECT EName,
       Salary,
       AVG(Salary) OVER() AS AvgSalary
FROM Employee;

-- EName   Salary   AvgSalary
-- ------  -------  ---------
-- Amit     50000     70000
-- Rahul    70000     70000
-- Neha     60000     70000
-- Priya    80000     70000
-- Karan    90000     70000

===================================================================================================================
-- 6. COUNT() OVER()
-- Definition
-- COUNT() OVER() counts rows without using GROUP BY and keeps all rows in the result.

-- | EmpId | EName | Department | Salary |
-- | ----: | ----- | ---------- | -----: |
-- |   101 | Amit  | IT         |  50000 |
-- |   102 | Rahul | IT         |  70000 |
-- |   103 | Karan | IT         |  90000 |
-- |   104 | Neha  | HR         |  60000 |
-- |   105 | Priya | HR         |  80000 |

SELECT EName,
       Department,
       COUNT(*) OVER(PARTITION BY Department) AS TotalEmployees
FROM Employee;
-- OutPut:
-- | EName | Department | TotalEmployees |
-- | ----- | ---------- | -------------: |
-- | Amit  | IT         |              3 |
-- | Rahul | IT         |              3 |
-- | Karan | IT         |              3 |
-- | Neha  | HR         |              2 |
-- | Priya | HR         |              2 |

==================================================================================================================
-- 7. LAG()
-- Definition
-- LAG() returns the value from the previous row.
SELECT EName,
       Salary,
       LAG(Salary) OVER(ORDER BY Salary) AS PreviousSalary
FROM Employee;

-- | EName | Salary | PreviousSalary |
-- | ----- | -----: | -------------: |
-- | Amit  |  50000 |           NULL |
-- | Neha  |  60000 |          50000 |
-- | Rahul |  70000 |          60000 |
-- | Priya |  80000 |          70000 |
-- | Karan |  90000 |          80000 |

====================================================================================================================
-- 8. LEAD()
-- Definition
-- LEAD() returns the value from the next row
SELECT EName,
       Salary,
       LEAD(Salary) OVER(ORDER BY Salary) AS NextSalary
FROM Employee;

-- | EName | Salary | NextSalary |
-- | ----- | -----: | ---------: |
-- | Amit  |  50000 |      60000 |
-- | Neha  |  60000 |      70000 |
-- | Rahul |  70000 |      80000 |
-- | Priya |  80000 |      90000 |
-- | Karan |  90000 |       NULL |

===================================================================================================================
-- 9. FIRST_VALUE()
-- Definition
-- FIRST_VALUE() returns the first value in the window.

SELECT EName,
       Salary,
       FIRST_VALUE(Salary)
       OVER(ORDER BY Salary) AS LowestSalary
FROM Employee;

-- | EName | Salary | LowestSalary |
-- | ----- | -----: | -----------: |
-- | Amit  |  50000 |        50000 |
-- | Neha  |  60000 |        50000 |
-- | Rahul |  70000 |        50000 |
-- | Priya |  80000 |        50000 |
-- | Karan |  90000 |        50000 |

===================================================================================================================
-- 10. LAST_VALUE()
-- Definition
-- LAST_VALUE() returns the last value in the current window.
SELECT EName,
       Salary,
       LAST_VALUE(Salary)
       OVER(
            ORDER BY Salary
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND UNBOUNDED FOLLOWING
       ) AS HighestSalary
FROM Employee;

-- | EName | Salary | HighestSalary |
-- | ----- | -----: | ------------: |
-- | Amit  |  50000 |         90000 |
-- | Neha  |  60000 |         90000 |
-- | Rahul |  70000 |         90000 |
-- | Priya |  80000 |         90000 |
-- | Karan |  90000 |         90000 |

===================================================================================================================
-- 11. PARTITION BY
-- Definition
-- Divides rows into groups and performs the window function separately for each group.
-- PARTITION BY divides the rows into groups and performs the window function separately for each group, without reducing the number of rows.

-- | EmpId | EName | Department | Salary |
-- | ----: | ----- | ---------- | -----: |
-- |   101 | Amit  | IT         |  50000 |
-- |   102 | Rahul | IT         |  70000 |
-- |   103 | Karan | IT         |  90000 |
-- |   104 | Neha  | HR         |  60000 |
-- |   105 | Priya | HR         |  80000 |
-- |   106 | Ankit | Sales      |  40000 |
-- |   107 | Riya  | Sales      |  50000 |

SELECT EmpId,
       EName,
       Department,
       Salary,
       AVG(Salary) OVER(PARTITION BY Department) AS DeptAvgSalary
FROM Employee;

-- | EmpId | EName | Department | Salary | DeptAvgSalary |
-- | ----: | ----- | ---------- | -----: | ------------: |
-- |   101 | Amit  | IT         |  50000 |         70000 |
-- |   102 | Rahul | IT         |  70000 |         70000 |
-- |   103 | Karan | IT         |  90000 |         70000 |
-- |   104 | Neha  | HR         |  60000 |         70000 |
-- |   105 | Priya | HR         |  80000 |         70000 |
-- |   106 | Ankit | Sales      |  40000 |         45000 |
-- |   107 | Riya  | Sales      |  50000 |         45000 |
==================================================================================================================

-- Easy Difference
-- | GROUP BY                    | Window Function                        |
-- | --------------------------- | -------------------------------------- |
-- | Groups rows                 | Keeps all rows                         |
-- | One row per group           | One row per original record            |
-- | Cannot show individual rows | Shows individual rows and calculations |

-- Most Asked Window Functions
-- | Function         | Purpose                     |
-- | ---------------- | --------------------------- |
-- | `ROW_NUMBER()`   | Unique row number           |
-- | `RANK()`         | Same rank, skips next rank  |
-- | `DENSE_RANK()`   | Same rank, no skipped ranks |
-- | `SUM() OVER()`   | Total or running total      |
-- | `AVG() OVER()`   | Average                     |
-- | `COUNT() OVER()` | Count rows                  |
-- | `LAG()`          | Previous row value          |
-- | `LEAD()`         | Next row value              |
-- | `FIRST_VALUE()`  | First value in the window   |
-- | `LAST_VALUE()`   | Last value in the window    |

