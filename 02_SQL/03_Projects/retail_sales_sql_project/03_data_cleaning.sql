-- Remove duplicate customers
DELETE FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM customers
    GROUP BY customer_id
    HAVING COUNT(*) > 1
);

-- Handle null city
UPDATE customers
SET city = 'UNKNOWN'
WHERE city IS NULL;
