-- 1️⃣ MIN, MAX, SUM
SELECT MIN(MinTemp) AS MIN,
       MAX(MinTemp) AS MAX,
       SUM(MinTemp) AS SUM
FROM Weather;

-- Output Example:
-- MIN       MAX      SUM
-- -10.000   22.545   33.812

-- 2️⃣ COUNT
SELECT COUNT(City) AS COUNT_CITY,
       COUNT(*) AS COUNT_ALL,
       COUNT(MinTemp) AS COUNT_MinTemp
FROM Weather;


-- Output Example:
-- COUNT_CITY   COUNT_ALL   COUNT_MinTemp
-- 4            4           3



-- 3️⃣ COUNT with DISTINCT
SELECT COUNT(*) AS TOTAL_ROWS,
       COUNT(City) AS COUNT_CITY,
       COUNT(DISTINCT City) AS UNIQUE_CITY_COUNT
FROM Weather;


-- Output Example:
-- TOTAL_ROWS   COUNT_CITY   UNIQUE_CITY_COUNT
-- 4            4            3



-- 4️⃣ AVG (Different Ways of Finding Average)
SELECT AVG(MinTemp) AS AVERAGE,
       SUM(MinTemp)/COUNT(*) AS AVG_OVER_ALL_ROWS,
       SUM(MinTemp)/COUNT(MinTemp) AS AVG_EXCLUDING_NULLS
FROM Weather;


-- Output Example:
-- AVERAGE     AVG_OVER_ALL_ROWS   AVG_EXCLUDING_NULLS
-- 11.27066    8.45300             11.27066




