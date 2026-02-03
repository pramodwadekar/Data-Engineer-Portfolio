-- 1. UNION Example
SELECT * 
FROM Employee 
WHERE Designation = 'PM'
UNION
SELECT * 
FROM Employee 
WHERE Dept = 'ICP';



-- 2. UNION ALL Example
SELECT * 
FROM Employee 
WHERE Designation = 'PM'
UNION ALL
SELECT * 
FROM Employee 
WHERE Dept = 'ICP';



-- 3. UNION – Computer IDs from Employee and Computer
SELECT CompId 
FROM Employee
UNION
SELECT CompId 
FROM Computer;



-- 4. UNION ALL – Computer IDs from Employee and Computer
SELECT CompId 
FROM Employee
UNION ALL
SELECT CompId 
FROM Computer;



-- 5. UNION – Combining Make and Model into One Column
SELECT Make AS "Computers" 
FROM Computer
UNION
SELECT Model 
FROM Computer;



-- 6. Incorrect Usage – Column Number Mismatch
SELECT CompId, EName 
FROM Employee
UNION
SELECT CompId 
FROM Computer;
-- ## ⚠️ Error: Column count mismatch.

-- 7. Incorrect Usage – Data Type Mismatch
SELECT EName 
FROM Employee
UNION
SELECT CompId 
FROM Computer;
-- ## ⚠️ Error: Incompatible data types.

