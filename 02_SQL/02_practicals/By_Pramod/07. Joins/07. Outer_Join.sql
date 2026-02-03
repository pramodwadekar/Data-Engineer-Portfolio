
-- 1. Left Outer Join
Fetch all employees with their computer details, including employees without a computer.
SELECT 
    ID, 
    ENAME, 
    E.COMPID AS ECID, 
    C.COMPID AS CCID, 
    MODEL
FROM Employee E
LEFT OUTER JOIN Computer C 
    ON E.COMPID = C.COMPID;



-- 2. Right Outer Join
Fetch all computers with their employee details, including computers not allocated to any employee.
SELECT 
    ID, 
    ENAME, 
    E.COMPID AS ECID, 
    C.COMPID AS CCID, 
    MODEL
FROM Employee E
RIGHT OUTER JOIN Computer C 
    ON E.COMPID = C.COMPID;



-- 3. Full Outer Join
Fetch all employees and all computers, including unmatched rows from both sides.
SELECT 
    ID, 
    ENAME, 
    E.COMPID AS E_COMPID, 
    C.COMPID AS C_COMPID, 
    MODEL
FROM Employee E
FULL OUTER JOIN Computer C 
    ON E.COMPID = C.COMPID;



-- 4. Inner Join with Filtering (Execution Order Example 1)
Fetch employees from ICP department with their computer details.
SELECT 
    Id, 
    EName, 
    E.CompId, 
    Model
FROM Employee E
INNER JOIN Computer C 
    ON E.CompId = C.CompId
WHERE Dept = 'ICP'
ORDER BY EName;



-- 5. Right Outer Join with Aggregation (Execution Order Example 2)
Fetch computer makes with count of employees, excluding Vostro, and only those with exactly 1 employee.
SELECT 
    Make, 
    COUNT(*) 
FROM Employee E
RIGHT OUTER JOIN Computer C 
    ON E.CompId = C.CompId
WHERE Model <> 'Vostro'
GROUP BY Make
HAVING COUNT(ID) = 1
ORDER BY Make;




