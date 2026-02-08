-- Load transaction fact for order items

INSERT INTO fact_order_items (
  order_id, product_sk, customer_sk, order_created_date_sk,
  quantity, unit_price, gross_amount
)
SELECT
  oi.order_id,
  p.product_sk,
  c.customer_sk,
  CAST(REPLACE(CAST(o.order_created_date AS VARCHAR),'-','') AS INT) AS order_created_date_sk,
  oi.quantity,
  oi.unit_price,
  oi.quantity * oi.unit_price AS gross_amount
FROM stg_order_items oi
JOIN stg_orders o ON oi.order_id=o.order_id
JOIN dim_product p ON oi.product_id=p.product_id
JOIN dim_customer c ON o.customer_id=c.customer_id AND c.is_current=1;
