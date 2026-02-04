MERGE INTO ecommerce_dwh.fact_orders AS tgt
USING ecommerce_stg.orders_stg AS src
ON tgt.order_id = src.order_id
WHEN NOT MATCHED THEN INSERT *;

MERGE INTO ecommerce_dwh.fact_sales AS tgt
USING (
  SELECT
    o.order_id,
    o.order_date,
    o.customer_id,
    oi.product_id,
    oi.quantity,
    (oi.quantity * p.price) AS sales_amount
  FROM ecommerce_stg.orders_stg o
  JOIN ecommerce_stg.order_items_stg oi ON o.order_id = oi.order_id
  JOIN ecommerce_stg.products_stg p ON oi.product_id = p.product_id
) AS src
ON tgt.order_id = src.order_id AND tgt.product_id = src.product_id
WHEN NOT MATCHED THEN INSERT *;
