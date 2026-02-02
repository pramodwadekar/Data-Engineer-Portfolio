-- 🔠 Character Function Querie

-- 1. Display all cities in upper case
SELECT City, UPPER(City) AS UPPERCASE
FROM Weather;

-- 2. Display all cities in lower case
SELECT City, LOWER(City) AS LOWERCASE
FROM Weather;

-- 3. Display the city and the length of string values in the city column
SELECT City, LENGTH(City) AS LENGTH
FROM Weather;

-- 4. Concatenate City and Country using CONCAT
SELECT City, Country, CONCAT(City, Country) AS CONCAT
FROM Weather;

-- 5. Concatenate City and Country using the || operator
SELECT City, Country, City || Country AS ConcatByOperator
FROM Weather;

--6. Display City and Country separated by a comma (,), e.g. London, UK
SELECT City, Country, CONCAT(CONCAT(City, ', '), Country) AS NestedConcat
FROM Weather;







