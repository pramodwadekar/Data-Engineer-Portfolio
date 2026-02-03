
-- 1: Exercise Sorting PCategory Review
SELECT productid, pcategory, brand
FROM product
WHERE pcategory = 'Clothing' OR pcategory = 'Accessories'
ORDER BY pcategory, review;


-- 2. Exercise Sorting PCategory Color
SELECT productid, pcategory, brand, color
FROM product
ORDER BY pcategory DESC, color ASC;
