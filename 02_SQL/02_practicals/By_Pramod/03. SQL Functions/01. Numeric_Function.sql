-- 1. CEIL Function
SELECT City, MinTemp, CEIL(MinTemp) AS "Ceiling"
  FROM Weather;
/*
| City    | MinTemp | Ceiling |
| ------- | ------  | ------  |
| Mumbai  |    24.2 |      25 |
| Pune    |    18.7 |      19 |
| Delhi   |    15.1 |      16 |
| Chennai |    29.0 |      29 |
| Jaipur  |    20.8 |      21 |
*/


-- 2. FLOOR Function
SELECT City, MinTemp, FLOOR(MinTemp) AS "Floor"
FROM Weather;
/*
City      MinTemp   Floor
--------- --------  -----
Mumbai      24.2      24
Pune        18.7      18
Delhi      -15.1     -16
Chennai     29.0      29
Jaipur      20.8      20
*/

-- 3. ABS Function
SELECT City, MinTemp, ABS(MinTemp) AS "Absolute"
FROM Weather;
/*
City      MinTemp   Absolute
--------- --------  --------
Mumbai      24.2      24.2
Pune        18.7      18.7
Delhi      -15.1      15.1
Chennai     29.0      29.0
Jaipur      20.8      20.8
*/

-- 4. ROUND Function
SELECT City, MinTemp,
       ROUND(MinTemp) AS "Round",
       ROUND(MinTemp, 1) AS "RoundTo1Digit",
       ROUND(MinTemp, 2) AS "RoundTo2Digit"
FROM Weather;
/*
City      MinTemp   Round   RoundTo1Digit   RoundTo2Digit
--------- --------  ------  --------------  --------------
Mumbai      24.2      24         24.2            24.20
Pune        18.7      19         18.7            18.70
Delhi      -15.1     -15        -15.1           -15.10
Chennai     29.0      29         29.0            29.00
Jaipur      20.8      21         20.8            20.80
*/
