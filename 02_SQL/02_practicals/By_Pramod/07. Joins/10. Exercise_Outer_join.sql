
-- 1: Exercise OuterJoin FilterMain_W
SELECT productid,
       NVL(invoiceid, 'NOT YET SOLD') AS "INVOICEID"
FROM product p
LEFT JOIN invoice i ON p.productid = i.productid
WHERE p.pcategory = 'Clothing';


-- 2: Exercise Outer Join FilterMain_O
SELECT productid,
       NVL(invoiceid, 'NOT YET SOLD') AS "INVOICEID"
FROM product p
LEFT JOIN invoice i
     ON p.productid = i.productid
    AND p.pcategory = 'Clothing';


-- 3: Exercise OuterJoin_FilterLookup
SELECT productid,
       NVL(invoiceid, 'Not sold since Sept, 23') AS "INVOICEID"
FROM product p
LEFT JOIN invoice i
     ON p.productid = i.productid
    AND i.purchasedate > DATE '2023-08-31';


✅ Corrections made
