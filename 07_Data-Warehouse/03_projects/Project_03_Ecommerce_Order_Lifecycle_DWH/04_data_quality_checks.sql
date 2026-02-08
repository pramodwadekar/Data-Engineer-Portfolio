-- Data quality checks

-- 1) Only 1 lifecycle row per order
SELECT order_id, COUNT(*)
FROM fact_order_lifecycle
GROUP BY order_id
HAVING COUNT(*)>1;

-- 2) Null customer_sk
SELECT COUNT(*) AS null_customer_sk
FROM fact_order_lifecycle
WHERE customer_sk IS NULL;

-- 3) Delivered but delivered_date_sk missing
SELECT *
FROM fact_order_lifecycle
WHERE order_status='DELIVERED' AND delivered_date_sk IS NULL;
