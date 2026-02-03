-- 1. Exercise_Join_UniqueCustomerProducts
-- Fetch each customer with the products they purchased (including customers who may not have purchased anything yet).
SELECT DISTINCT c.custname, i.productid
FROM customer c
LEFT OUTER JOIN invoice i 
    ON c.custid = i.custid;


-- 2. Exercise_Join_AllVendors
-- Fetch all vendors with their product names, showing NULL if no product is offered.
SELECT v.vendorname AS "VENDORNAME", 
       NVL(p.pname, 'NULL') AS "PNAME"
FROM vendor v
LEFT OUTER JOIN vendoroffering vo 
    ON v.vendorid = vo.vendorid
LEFT OUTER JOIN product p 
    ON p.productid = vo.productid;

