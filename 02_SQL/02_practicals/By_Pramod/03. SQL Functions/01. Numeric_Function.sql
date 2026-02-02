-- 1. CEIL Function
SELECT City, MinTemp, CEIL(MinTemp) AS "Ceiling"
  FROM Weather;

-- 2. FLOOR Function
SELECT City, MinTemp, FLOOR(MinTemp) AS "Floor"
FROM Weather;

-- 3. ABS Function
SELECT City, MinTemp, ABS(MinTemp) AS "Absolute"
FROM Weather;

-- 4. ROUND Function
SELECT City, MinTemp,
       ROUND(MinTemp) AS "Round",
       ROUND(MinTemp, 1) AS "RoundTo1Digit",
       ROUND(MinTemp, 2) AS "RoundTo2Digit"
FROM Weather;
