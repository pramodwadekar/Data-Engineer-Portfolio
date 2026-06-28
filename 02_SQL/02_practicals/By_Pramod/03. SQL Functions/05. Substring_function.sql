-- 🔎 Substring Function Syntax
-- SUBSTR(value, start_position, length)

-- 1. Extract first four characters of city names
SELECT City, SUBSTR(City, 1, 4) AS FIRST4
FROM Weather;
/*
City        FIRST4
----------  ------
London      Lond
Mysore      Myso
Bangalore   Bang
*/


-- 2. Extract 10 characters starting from second position
SELECT City, SUBSTR(City, 2, 10) AS TEN_FROM_2
FROM Weather;
/*
City        TEN_FROM_2
----------  ----------
London      ondon
Mysore      ysore
Bangalore   angalore
Mumbai      umbai
*/


-- 3. Extract whole string starting from third character
SELECT City, SUBSTR(City, 3) AS ALL_FROM_3
FROM Weather;
/*
City        ALL_FROM_3
----------  ----------
London      ndon
Mysore      sore
Bangalore   ngalore
Mumbai      mbai
Delhi       lhi
*/

-- 4. Extract 2 characters starting from seventh position
SELECT City, SUBSTR(City, 7, 2) AS TWO_FROM_7
FROM Weather;
/*
City        TWO_FROM_7
----------  ----------
London
Mysore
Bangalore   or
Mumbai
Delhi
*/



-- 📘 Tryout_CharacterFunctionsPart2 Exercises
-- 1. Display city and first four characters
SELECT City, SUBSTR(City, 1, 4) AS FIRST4
FROM Weather;


-- 2. Display 4 characters starting from second character
-- (Example: 'ondo', 'ysor')
SELECT City, SUBSTR(City, 2, 4) AS FOUR_FROM_2
FROM Weather;


-- 3. Display names of cities starting from third character
-- (Example: 'ndon', 'ngalore')
SELECT City, SUBSTR(City, 3) AS ALL_FROM_3
FROM Weather;


