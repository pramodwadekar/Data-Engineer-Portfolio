-- 1: Exercise_Subquery_MaxPurchaseDate 
SELECT invoiceid, purchasedate
FROM invoice
WHERE purchasedate = (SELECT MAX(purchasedate) FROM invoice);


-- 2: Exercise Subquery AvgPrice
SELECT productid, AVG(price) AS "AVERAGEPRICE"
FROM vendoroffering
GROUP BY productid
HAVING AVG(price) > (SELECT AVG(price) FROM vendoroffering);


-- 3: Exercise Subquery Having 
SELECT productid
FROM invoice
GROUP BY productid
HAVING AVG(discount) > (
    SELECT AVG(discount)
    FROM invoice
    WHERE productid = 'P101'
);


-- 4: Exercise Subquery CustomerCount
SELECT custname
FROM customer
WHERE custid IN (
    SELECT custid
    FROM invoice
    GROUP BY custid
    HAVING COUNT(*) >= 2
);

-- OR

SELECT c.custname
FROM customer c
INNER JOIN invoice i ON c.custid = i.custid
GROUP BY c.custid, c.custname
HAVING COUNT(i.quantitypurchased) >= 2;


-- 5: Exercise GroupBy MinTotalQuantity
SELECT productid
FROM invoice
GROUP BY productid
HAVING SUM(quantitypurchased) = (
    SELECT MIN(q.qmax)
    FROM (
        SELECT SUM(quantitypurchased) AS qmax
        FROM invoice
        GROUP BY productid
    ) q
);


-- 6: Exercise Subquery MinTotalQty
SELECT productid
FROM invoice
GROUP BY productid
HAVING SUM(quantitypurchased) = (
    SELECT MIN(q.qmax)
    FROM (
        SELECT SUM(quantitypurchased) AS qmax
        FROM invoice
        GROUP BY productid
    ) q
);


-- 7.Exercise Subquery min Total quantity
SELECT productid, pname
FROM product
WHERE productid IN (
    SELECT productid
    FROM invoice
    GROUP BY productid
    HAVING SUM(quantitypurchased) = (
        SELECT MIN(q.qmax)
        FROM (
            SELECT SUM(quantitypurchased) AS qmax
            FROM invoice
            GROUP BY productid
        ) q
    )
);
