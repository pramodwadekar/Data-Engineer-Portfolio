-- 4: Assignment CombiningData_E
SELECT publisherid 
FROM publisher
EXCEPT
SELECT publisherid 
FROM journal;
