-- INTERSECT Example
Find computer IDs that have been allocated to employees:
SELECT CompId 
FROM Computer C
INTERSECT
SELECT CompId 
FROM Employee E;



-- EXCEPT Example
Find computer IDs that have not been allocated to employees:
SELECT CompId 
FROM Computer C
EXCEPT
SELECT CompId 
FROM Employee E;



-- ✅ These are standard SQL set operators:
-- - INTERSECT → returns only common values (distinct).
-- - EXCEPT → returns values from the first query that are not in the second.
