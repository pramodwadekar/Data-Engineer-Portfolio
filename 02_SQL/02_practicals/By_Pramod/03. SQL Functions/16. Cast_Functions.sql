-- | City   | MinTemp | RecordDate  |
-- | ------ | ------: | ----------- |
-- | Mumbai |    24.5 | 15-JAN-2024 |
-- | Pune   |    18.8 | 10-FEB-2024 |
-- | Delhi  |    15.2 | 05-MAR-2024 |
-- | London |    10.9 | 18-NOV-2024 |
-- | Paris  |    20.4 | 30-DEC-2024 |

-- 1. Convert Numeric and Date to VARCHAR
SELECT City, 
       CAST(MinTemp AS VARCHAR(10)) AS "VarcharTemp", 
       CAST(RecordDate AS VARCHAR(10)) AS "VarcharDate"
FROM Weather;

-- City      VarcharTemp   VarcharDate
-- --------  ------------  -----------
-- Mumbai    24.5          15-JAN-24
-- Pune      18.8          10-FEB-24
-- Delhi     15.2          05-MAR-24
-- London    10.9          18-NOV-24
-- Paris     20.4          30-DEC-24
       
-- 2. Truncate Decimal Digits (Numeric → Integer)
SELECT City, MinTemp, 
       CAST(MinTemp AS INTEGER) AS "MinTempInINT"
FROM Weather;

-- City      MinTemp   MinTempInINT
-- --------  --------  ------------
-- Mumbai      24.5        24
-- Pune        18.8        18
-- Delhi       15.2        15
-- London      10.9        10
-- Paris       20.4        20

-- 3. Average Value (Numeric → Integer)
SELECT AVG(MinTemp) AS "AvgMinTemp"
FROM Weather;
-- AvgMinTemp
-- ----------
-- 17.96

-- Or
  
SELECT CAST(AVG(MinTemp) AS INTEGER) AS "AvgMinTempInINT"
FROM Weather;
-- AvgMinTempInINT
-- ---------------
-- 17
