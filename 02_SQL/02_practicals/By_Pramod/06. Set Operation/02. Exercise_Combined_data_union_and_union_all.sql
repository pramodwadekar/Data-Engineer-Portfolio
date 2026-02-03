
-- 1: Exercise Union SelectiveInvoices
SELECT invoiceid, quantitypurchased, discount
FROM invoice
WHERE SUBSTR(productid, 4) < 5
UNION ALL
SELECT invoiceid, quantitypurchased, discount
FROM invoice
WHERE discount < 10;

-- 2: Exercise Union_SelectiveProducts
SELECT pname, brand
FROM product
WHERE color NOT IN ('Brown', 'Yellow')
UNION
SELECT pname, brand
FROM product
WHERE review != 'Bad';

-- 3: Exercise Union_FilterVendors
SELECT vendorid, vendorname, vendorcontactno, rating
FROM vendor
WHERE rating > 3 AND vendorcontactno IS NOT NULL
UNION ALL
SELECT vendorid, vendorname, vendorcontactno, rating
FROM vendor
WHERE vendorname LIKE '%a%' AND vendorcontactno IS NOT NULL;
