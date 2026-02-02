-- 🔹 Question 1: Clothing type products
-- Problem: Display product id, brand, product category and color of all clothing type products.

SELECT ProductId, Brand, PCategory, Color
FROM Product
WHERE PCategory = 'Clothing';

-- 🔹 Question 2: List all ratings from Vendor table
-- Problem: Write a query to list all ratings given to the vendors.

SELECT Rating
FROM Vendor;

-- 🔹 Question 3: Vendors without rating
-- Problem: Display vendorid, vendorname and rating of those vendors that do not have a rating.

SELECT VendorId, VendorName, Rating
FROM Vendor
WHERE Rating IS NULL;
