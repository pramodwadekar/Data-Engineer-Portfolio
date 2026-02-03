
-- 1. Exercise Join_CoLocatedCustomers
-- Find customers who share the same location but are not the same person.
SELECT DISTINCT c1.custid, c1.custname, c1.custlocation
FROM customer c1
INNER JOIN customer c2 
    ON c1.custlocation = c2.custlocation 
   AND c1.custid <> c2.custid;
-- 👉 No need for GROUP BY here since DISTINCT already ensures uniqueness.



-- 2. Exercise_Join_FilterProducts
-- Find products in the same category with the same review, excluding “Bad”.
SELECT DISTINCT p1.pname, p1.pcategory, p1.review
FROM product p1
INNER JOIN product p2 
    ON p1.pcategory = p2.pcategory 
   AND p1.review = p2.review 
   AND p1.productid <> p2.productid
WHERE p1.review <> 'Bad';
-- 👉 Again, DISTINCT is enough. GROUP BY is not required unless you want aggregates.



-- 3. Exercise Join_LoyalCustomers
Find customers who purchased the same product from the same vendor more than once (different invoices).
SELECT DISTINCT i1.custid, i1.vendorid, i1.productid
FROM invoice i1
INNER JOIN invoice i2 
    ON i1.custid = i2.custid
   AND i1.vendorid = i2.vendorid
   AND i1.productid = i2.productid
   AND i1.invoiceid <> i2.invoiceid;
-- 👉 This correctly identifies “loyal customers” who bought the same product from the same vendor multiple times.
