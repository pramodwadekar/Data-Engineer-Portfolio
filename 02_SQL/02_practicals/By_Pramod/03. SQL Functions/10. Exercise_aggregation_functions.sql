-- 1: Exercise_Functions_Aggregate
SELECT MIN(RATING) "MIN_RATING", MAX(RATING) "MAX_RATING", AVG(RATING) "AVG RATING", 
  COUNT(RATING) "NUMBEROFVENDORS" FROM VENDOR;

-- 2: Exercise Functions_AggregateFilteredRows
SELECT 
    MAX(AGE) AS "MaxAge", 
    MIN(AGE) AS "MinAge", 
    AVG(AGE) AS "AvgAge", 
    COUNT(AGE) AS "NumberOfCustomers" 
FROM CUSTOMER 
WHERE LENGTH(CUSTNAME) > 3;

-- 3: Exercise Functions_TotalPrice
SELECT SUM(CEIL(PRICE)) AS "Total Price" 
FROM VENDOROFFERING;
