SELECT 
    ID, 
    ENAME, 
    E.COMPID AS ECID, 
    C.COMPID AS CCID, 
    MODEL
FROM Employee E 
CROSS JOIN Computer C;
