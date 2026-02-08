-- Validation queries

-- 1) NULL surrogate keys in fact
SELECT COUNT(*) AS null_sk_count
FROM fact_sales
WHERE customer_sk IS NULL OR product_sk IS NULL OR store_sk IS NULL;

-- 2) Only 1 current row per customer
SELECT customer_id, COUNT(*)
FROM dim_customer
WHERE is_current = 1
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 3) Reconciliation
SELECT SUM(quantity*unit_price - discount) AS stg_total
FROM stg_order_items;

SELECT SUM(net_amount) AS dwh_total
FROM fact_sales;
