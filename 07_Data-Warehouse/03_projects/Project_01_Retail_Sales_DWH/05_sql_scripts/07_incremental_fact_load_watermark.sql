-- Incremental fact load using watermark

CREATE TABLE IF NOT EXISTS etl_watermark (
  pipeline_name VARCHAR(100) PRIMARY KEY,
  last_ts TIMESTAMP
);

INSERT INTO etl_watermark
SELECT 'fact_sales_load', '1900-01-01 00:00:00'
WHERE NOT EXISTS (SELECT 1 FROM etl_watermark WHERE pipeline_name='fact_sales_load');

INSERT INTO fact_sales (
  order_id, order_date_sk, customer_sk, product_sk, store_sk,
  quantity, unit_price, discount, gross_amount, net_amount, order_status
)
SELECT
  oi.order_id,
  CAST(REPLACE(CAST(o.order_date AS VARCHAR),'-','') AS INT) AS order_date_sk,
  dc.customer_sk,
  dp.product_sk,
  ds.store_sk,
  oi.quantity,
  oi.unit_price,
  oi.discount,
  (oi.quantity * oi.unit_price) AS gross_amount,
  (oi.quantity * oi.unit_price) - oi.discount AS net_amount,
  o.order_status
FROM stg_order_items oi
JOIN stg_orders o ON oi.order_id = o.order_id
JOIN dim_customer dc ON o.customer_id = dc.customer_id AND dc.is_current = 1
JOIN dim_product dp ON oi.product_id = dp.product_id AND dp.is_current = 1
JOIN dim_store ds ON o.store_id = ds.store_id AND ds.is_current = 1
WHERE GREATEST(o.updated_ts, oi.updated_ts) >
      (SELECT last_ts FROM etl_watermark WHERE pipeline_name = 'fact_sales_load');

UPDATE etl_watermark
SET last_ts = CURRENT_TIMESTAMP
WHERE pipeline_name = 'fact_sales_load';
