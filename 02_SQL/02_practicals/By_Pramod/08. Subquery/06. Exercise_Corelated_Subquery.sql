-- ✅ 1: Exercise Correlated_LeastPrice
SELECT productid, vendorid, price
FROM vendoroffering v1
WHERE price = (
    SELECT MIN(price)
    FROM vendoroffering v2
    WHERE v1.productid = v2.productid
)
ORDER BY productid;

-- ✅ 2: Exercise Correlated_Third Costliest
SELECT vendorid, productid, price
FROM vendoroffering v1
WHERE price = (
    SELECT MAX(price)
    FROM vendoroffering v2
    WHERE price < (
        SELECT MAX(price)
        FROM vendoroffering v3
        WHERE price < (
            SELECT MAX(price)
            FROM vendoroffering v4
        )
    )
);

-- ✅ 3: Exercise Correlated Select
SELECT custid, custname,
       (SELECT MAX(discount) 
        FROM invoice i 
        WHERE c.custid = i.custid) AS HIGHESTDISCOUNT
FROM customer c
WHERE custlocation = 'Yonkers';
