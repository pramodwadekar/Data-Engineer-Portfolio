/*
| City   | RecordDate1 | RecordDate2 |
| ------ | ----------- | ----------- |
| Mumbai | 15-JAN-2024 | 15-JUL-2024 |
| Pune   | 10-FEB-2024 | 10-MAY-2024 |
| Delhi  | 05-MAR-2024 | 05-SEP-2024 |
*/

-- 1. MONTHS_BETWEEN
-- Find number of months between two dates:
SELECT City, MONTHS_BETWEEN(RecordDate1, RecordDate2) AS "R1-R2"
FROM Weather;
/*
City      R1-R2
--------  -----
Mumbai      -6
Pune        -3
Delhi       -6
*/

SELECT City, MONTHS_BETWEEN(RecordDate2, RecordDate1) AS "R2-R1"
FROM Weather;
/*
City      R2-R1
--------  -----
Mumbai       6
Pune         3
Delhi        6
*/

-- 2. ADD_MONTHS
-- Add or subtract months from a given date:
SELECT 
    ADD_MONTHS(RecordDate1, 6) AS "AFTER_6_MONTHS",
    ADD_MONTHS(RecordDate1, -12) AS "BEFORE_12_MONTHS"
FROM Weather;
/*
AFTER_6_MONTHS   BEFORE_12_MONTHS
---------------  ----------------
15-JUL-2024      15-JAN-2023
10-AUG-2024      10-FEB-2023
05-SEP-2024      05-MAR-2023
*/


-- 3. SYSDATE
Fetch current system date with timestamp:
SELECT SYSDATE 
FROM Information_Schema.System_users;
/*
SYSDATE
--------------------
28-JUN-2026 10:45:32
*/

-- 4. CURRENT_DATE
-- Fetch current system date (without time):
SELECT CURRENT_DATE 
FROM Information_Schema.System_users;
/*
CURRENT_DATE
------------
28-JUN-2026
*/

-- 5. Extract Parts of Date
-- Get day, month, and year from a date:
SELECT 
    DAY(RecordDate1) AS "DAY", 
    MONTH(RecordDate1) AS "MONTH", 
    YEAR(RecordDate1) AS "YEAR"
FROM Weather;
/*
DAY   MONTH   YEAR
---   -----   ----
15      1      2024
10      2      2024
5       3      2024
*/


