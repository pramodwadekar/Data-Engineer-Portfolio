
-- 1: Exercise Functions Filter Products
-- Using CONCAT + SUBSTR
SELECT CONCAT(SUBSTR(ProductId, 2), PName) AS Product
FROM Product
WHERE UPPER(Color) = 'WHITE'
  AND LENGTH(PName) > 9;

-- Using LOWER for comparison
SELECT CONCAT(SUBSTR(ProductId, 2), PName) AS Product
FROM Product
WHERE LOWER(Color) = 'white'
  AND LENGTH(PName) > 9;

-- Using || operator
SELECT SUBSTR(ProductId, 2) || PName AS Product
FROM Product
WHERE LOWER(Color) = 'white'
  AND LENGTH(PName) > 9;



   
