SELECT 
    ID, 
    ENAME, 
    E.COMPID AS ECID, 
    C.COMPID AS CCID, 
    MODEL
FROM Employee E 
INNER JOIN Computer C 
ON E.COMPID = C.COMPID;

---------------------------------------------------------------------------------------

SELECT 
    C.CompId, 
    Make, 
    Model, 
    ID, 
    EName, 
    E.CompId
FROM Computer C 
INNER JOIN Employee E 
ON C.CompId = E.CompId;
