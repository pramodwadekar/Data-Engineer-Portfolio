-- ✅ Conversion Function: TO_CHAR Queries

-- 1. Display all record dates in American format (MM/DD/YYYY)
SELECT TO_CHAR(RecordDate, 'MM/DD/YYYY') AS AMERICAN_FORMAT
FROM Weather;

-- 2. Display the parts of record date (Day, Month, Year in numeric form)
SELECT TO_CHAR(RecordDate, 'DD') AS DATE,
       TO_CHAR(RecordDate, 'MM') AS MONTH,
       TO_CHAR(RecordDate, 'YY') AS YEAR
FROM Weather;


-- 3. Display Day, Month (full), and Year (YYYY)
SELECT TO_CHAR(RecordDate, 'Day')   AS DAY,
       TO_CHAR(RecordDate, 'Month') AS MONTH,
       TO_CHAR(RecordDate, 'YYYY')  AS YEAR
FROM Weather;


-- 4. Display abbreviated months (Jan, Feb, Nov, etc.)
SELECT TO_CHAR(RecordDate, 'Mon') AS MONTH_ABBREVIATED
FROM Weather;





