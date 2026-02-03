-- Exercises

-- inner join
-- 1. Exercise Join_Condition
SELECT custname, LOWER(email) AS email, invoiceid
FROM customer c
INNER JOIN invoice i ON c.custid = i.custid
WHERE discount > 12;

-- 2: Exercise Join SelectiveCustomers
SELECT p.productid AS "Product Id",
       p.pname AS "Product Name",
       p.pcategory AS "Category"
FROM Product p
INNER JOIN invoice i ON p.productid = i.productid
WHERE i.custid IN ('C101', 'C108');

-- 3:Exercise_InnerJoin_SelectiveAgeGroup
SELECT c.custid AS "Customer ID",
       c.custname AS "Customer Name",
       i.productid AS "Product ID"
FROM customer c
INNER JOIN invoice i ON c.custid = i.custid
WHERE c.age > 35;

-- 4: Exercise Join_ConditionOnMonth
SELECT c.custid, c.custname
FROM customer c
INNER JOIN invoice i ON c.custid = i.custid
WHERE TO_CHAR(i.purchasedate, 'MONTH') = 'AUGUST'
GROUP BY c.custid, c.custname;

-- 5:Exercise_Join_CategoryWiseCount
SELECT p.pcategory,
       COUNT(*) AS "NUMBER_OF_PRODUCTS"
FROM product p
INNER JOIN invoice i ON p.productid = i.productid
GROUP BY p.pcategory;

-- 6: Exercise Join SelectiveColorProducts
SELECT v.vendorid, p.pname, p.color,
       FLOOR(p.price) AS "BASEPRICE"
FROM vendoroffering v
INNER JOIN product p ON v.productid = p.productid
WHERE p.color IN ('White', 'Blue');

-- 7:Exercise_Join_CategoryWiseSelectiveCount
SELECT p.pcategory AS "Category",
       COUNT(*) AS "Total Products"
FROM product p
INNER JOIN invoice i ON p.productid = i.productid
WHERE i.review = 'Good'
  AND i.quantitypurchased > 8
GROUP BY p.pcategory;

-- 8: Exercise Join_SelectiveVendors
SELECT v.vendorname, vo.productid, vo.price
FROM vendoroffering vo
INNER JOIN vendor v ON v.vendorid = vo.vendorid
WHERE LENGTH(v.vendorname) > 15
  AND vo.price > 1000;

-- 9: Exercise_Join_DiscountCalculation
SELECT i.custid, i.invoiceid,
       ROUND(vo.price * i.quantitypurchased) AS "MRP",
       ROUND((vo.price * i.quantitypurchased) * (1 - i.discount/100)) AS "FINAL_PRICE"
FROM vendoroffering vo
INNER JOIN invoice i
  ON vo.vendorid = i.vendorid
 AND vo.productid = i.productid
WHERE i.quantitypurchased > 2;


-- 10: Exercise_Join_GB_OB
SELECT c.custlocation AS "LOCATION",
       p.brand,
       SUM(i.quantitypurchased) AS "PRODUCTSSOLD"
FROM product p
INNER JOIN invoice i ON p.productid = i.productid
INNER JOIN customer c ON c.custid = i.custid
GROUP BY c.custlocation, p.brand
ORDER BY c.custlocation, p.brand;
