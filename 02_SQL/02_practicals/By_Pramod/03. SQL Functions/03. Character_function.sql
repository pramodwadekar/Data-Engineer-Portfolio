-- 🔠 Character Function Querie

-- 1. Display all cities in upper case
SELECT City, UPPER(City) AS UPPERCASE
FROM Weather;

/*
City      UPPERCASE
--------  ----------
Mumbai    MUMBAI
Pune      PUNE
Delhi     DELHI
*/

-- 2. Display all cities in lower case
SELECT City, LOWER(City) AS LOWERCASE
FROM Weather;
/*
City      LOWERCASE
--------  ----------
Mumbai    mumbai
Pune      pune
Delhi     delhi
*/

-- 3. Display the city and the length of string values in the city column
SELECT City, LENGTH(City) AS LENGTH
FROM Weather;
/*
City      LENGTH
--------  ------
Mumbai       6
Pune         4
Delhi        5
London       6
*/

-- 4. Concatenate City and Country using CONCAT
SELECT City, Country, CONCAT(City, Country) AS CONCAT
FROM Weather;
/*
City      Country    CONCAT
--------  ---------  ----------------
Mumbai    India      MumbaiIndia
Pune      India      PuneIndia
Delhi     India      DelhiIndia
*/

-- 5. Concatenate City and Country using the || operator
SELECT City, Country, City || Country AS ConcatByOperator
FROM Weather;
/*
City      Country    CONCAT
--------  ---------  ----------------
Mumbai    India      MumbaiIndia
Pune      India      PuneIndia
Delhi     India      DelhiIndia
*/

--6. Display City and Country separated by a comma (,), e.g. London, UK
SELECT City, Country, CONCAT(CONCAT(City, ', '), Country) AS NestedConcat
FROM Weather;
/*
City      Country    Concat
--------  ---------  ----------------
Mumbai    India      Mumbai, India
Pune      India      Pune, India
Delhi     India      Delhi, India
*/
-- OR

SELECT City, Country,
       CONCAT(City, ', ', Country) AS Concat
FROM Weather;
/*
City      Country    Concat
--------  ---------  ----------------
Mumbai    India      Mumbai, India
Pune      India      Pune, India
Delhi     India      Delhi, India
*/







