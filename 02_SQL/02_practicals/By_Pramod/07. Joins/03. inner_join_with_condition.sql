-- Option 1: Using WHERE clause
SELECT 
    Id, 
    EName, 
    E.CompId AS E_CompId, 
    C.CompId AS C_CompId, 
    Model
FROM Employee E 
INNER JOIN Computer C 
    ON E.CompId = C.CompId
WHERE Dept = 'ETA';



-- Option 2: Using AND inside the ON clause
SELECT 
    Id, 
    EName, 
    E.CompId AS E_CompId, 
    C.CompId AS C_CompId, 
    Model
FROM Employee E 
INNER JOIN Computer C 
    ON E.CompId = C.CompId 
    AND Dept = 'ETA';
