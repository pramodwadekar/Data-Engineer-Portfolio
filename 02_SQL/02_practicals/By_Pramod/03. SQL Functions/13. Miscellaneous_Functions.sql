-- 1️⃣ NVL with Same Column Type
SELECT CITY, NVL(MINTEMP, 0) AS "TEMPERATURE"
FROM Weather;

-- 2️⃣ NVL with Different Column Type
SELECT CITY, NVL(TO_CHAR(MINTEMP), 'Not Recorded') AS "TEMPERATURE"
FROM Weather;

-- 3️⃣ USER Function
SELECT USER AS "Current_User"
FROM Information_Schema.System_Users;





