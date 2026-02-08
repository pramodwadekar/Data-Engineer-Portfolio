-- KPI queries

-- Avg delivery time (order created -> delivered)
SELECT
  AVG(delivered_date_sk - order_created_date_sk) AS avg_delivery_days
FROM fact_order_lifecycle
WHERE delivered_date_sk IS NOT NULL;

-- Return rate
SELECT
  (SUM(CASE WHEN returned_date_sk IS NOT NULL THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS return_rate_percent
FROM fact_order_lifecycle;
