-- 1. Convert Numeric and Date to VARCHAR
SELECT City, 
       CAST(MinTemp AS VARCHAR(10)) AS "VarcharTemp", 
       CAST(RecordDate AS VARCHAR(10)) AS "VarcharDate"
FROM Weather;

-- 2. Truncate Decimal Digits (Numeric → Integer)
SELECT City, MinTemp, 
       CAST(MinTemp AS INTEGER) AS "MinTempInINT"
FROM Weather;

-- 3. Average Value (Numeric → Integer)
SELECT AVG(MinTemp) AS "AvgMinTemp"
FROM Weather;

-- Or
  
SELECT CAST(AVG(MinTemp) AS INTEGER) AS "AvgMinTempInINT"
FROM Weather;
