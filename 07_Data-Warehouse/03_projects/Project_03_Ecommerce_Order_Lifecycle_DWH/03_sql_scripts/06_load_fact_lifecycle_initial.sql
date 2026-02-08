-- Initial load accumulating snapshot with order created stage

INSERT INTO fact_order_lifecycle (
  order_id, customer_sk, partner_sk,
  order_created_date_sk, payment_date_sk, packed_date_sk, shipped_date_sk,
  delivered_date_sk, returned_date_sk, order_status, total_amount
)
SELECT
  o.order_id,
  c.customer_sk,
  NULL AS partner_sk,
  CAST(REPLACE(CAST(o.order_created_date AS VARCHAR),'-','') AS INT) AS order_created_date_sk,
  NULL, NULL, NULL,
  NULL, NULL,
  o.order_status,
  o.total_amount
FROM stg_orders o
JOIN dim_customer c ON o.customer_id=c.customer_id AND c.is_current=1;
