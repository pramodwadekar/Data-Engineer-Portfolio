-- 1: Exercise Functions Character
SELECT CONCAT(PName, SUBSTR(Review, 1, 1)) AS "Product Review"
FROM Product
WHERE PCategory LIKE '%i%';
