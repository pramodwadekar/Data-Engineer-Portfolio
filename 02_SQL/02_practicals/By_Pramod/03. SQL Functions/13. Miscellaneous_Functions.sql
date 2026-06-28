/*
| City   | MinTemp |
| ------ | ------: |
| Mumbai |    24.5 |
| Pune   |    NULL |
| Delhi  |    18.2 |
| London |    NULL |
| Paris  |    15.0 |
*/

-- 1️⃣ NVL with Same Column Type
SELECT CITY, NVL(MINTEMP, 0) AS "TEMPERATURE"
FROM Weather;

/*
CITY      TEMPERATURE
--------  -----------
Mumbai       24.5
Pune          0
Delhi        18.2
London        0
Paris        15.0
*/

-- 2️⃣ NVL with Different Column Type
SELECT CITY, NVL(TO_CHAR(MINTEMP), 'Not Recorded') AS "TEMPERATURE"
FROM Weather;
/*
CITY      TEMPERATURE
--------  -------------
Mumbai    24.5
Pune      Not Recorded
Delhi     18.2
London    Not Recorded
Paris     15.0
*/

-- 3️⃣ USER Function
SELECT USER AS "Current_User"
FROM Information_Schema.System_Users;
/*
CURRENT_USER
------------
SYSTEM

or

CURRENT_USER
------------
HR

or

CURRENT_USER
------------
SCOTT
*/



