-- 1. MONTHS_BETWEEN
-- Find number of months between two dates:
SELECT City, MONTHS_BETWEEN(RecordDate1, RecordDate2) AS "R1-R2"
FROM Weather;

SELECT City, MONTHS_BETWEEN(RecordDate2, RecordDate1) AS "R2-R1"
FROM Weather;

-- 2. ADD_MONTHS
-- Add or subtract months from a given date:
SELECT 
    ADD_MONTHS(RecordDate1, 6) AS "AFTER_6_MONTHS",
    ADD_MONTHS(RecordDate1, -12) AS "BEFORE_12_MONTHS"
FROM Weather;



-- 3. SYSDATE
Fetch current system date with timestamp:
SELECT SYSDATE 
FROM Information_Schema.System_users;



-- 4. CURRENT_DATE
-- Fetch current system date (without time):
SELECT CURRENT_DATE 
FROM Information_Schema.System_users;



-- 5. Extract Parts of Date
-- Get day, month, and year from a date:
SELECT 
    DAY(RecordDate1) AS "DAY", 
    MONTH(RecordDate1) AS "MONTH", 
    YEAR(RecordDate1) AS "YEAR"
FROM Weather;




