-- COALESCE() returns the first non-NULL value from the given list of expressions.
-- Syntax:
-- COALESCE(value1, value2, value3, ...)
-- Checks values from left to right.
-- Returns the first value that is NOT NULL.

-- | Id  | EName | Bonus |
-- | --- | ----- | ----: |
-- | 101 | Amit  |  5000 |
-- | 102 | Rahul |  NULL |
-- | 103 | Neha  |  3000 |
-- | 104 | Priya |  NULL |

SELECT EName,
       Bonus,
       COALESCE(Bonus, 0) AS FinalBonus
FROM Employee;

-- EName   Bonus   FinalBonus
-- ------  ------  ----------
-- Amit    5000      5000
-- Rahul   NULL         0
-- Neha    3000      3000
-- Priya   NULL         0

SELECT COALESCE(NULL, NULL, 'SQL', 'Oracle') AS Result;  -- table not required 
-- Result
-- ------
-- SQL

-- COALESCE() checks the values from left to right.

-- If the first value is NOT NULL → it returns the first value. but first is null
-- If the first value is NULL → it checks the second value. but second also null
-- If the second value is also NULL → it checks the third value. here third  value is SQL thats why return SQL and egnore next values
-- It continues until it finds the first non-NULL value.

-- Example where COALESCE() is better

-- Suppose a customer has three phone number columns:

-- | Name  | Mobile     | HomePhone | OfficePhone |
-- | ----- | ---------- | --------- | ----------- |
-- | Amit  | NULL       | NULL      | 9999999999  |
-- | Rahul | 8888888888 | NULL      | NULL        |

SELECT Name,
       COALESCE(Mobile, HomePhone, OfficePhone) AS Contact
FROM Customer;

-- | Name  | Contact    |
-- | ----- | ---------- |
-- | Amit  | 0909090909 |
-- | Rahul | 8888888888 |

