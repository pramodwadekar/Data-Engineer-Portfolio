-- ✅ Valid Query

SELECT TO_DATE(RecordDate, 'DD/MM/YYYY') AS ACTUAL_FORMAT
FROM Weather;

-- Output:
-- ACTUAL_FORMAT
-- 1990-01-25
-- 1991-01-20
-- 1990-11-18
-- 1991-03-18


-- ❌ Invalid Query
SELECT TO_DATE(RecordDate) AS ACTUAL_FORMAT
FROM Weather;

-- Error:
-- data exception: invalid datetime format: java.text.ParseException: 
-- Unparseable date: "25/01/1990" 
-- Error Code: -3407 / State: 22007
