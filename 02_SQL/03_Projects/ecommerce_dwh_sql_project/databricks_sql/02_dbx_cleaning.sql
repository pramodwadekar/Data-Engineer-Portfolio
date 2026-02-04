CREATE OR REPLACE TABLE ecommerce_stg.customers_stg
USING DELTA
AS
SELECT DISTINCT
  customer_id,
  trim(customer_name) AS customer_name,
  COALESCE(NULLIF(trim(city), ''), 'UNKNOWN') AS city,
  signup_date,
  CASE 
    WHEN lower(email) RLIKE '^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$' THEN lower(email)
    ELSE NULL
  END AS email
FROM ecommerce_raw.customers_raw
WHERE customer_id IS NOT NULL;

CREATE OR REPLACE TABLE ecommerce_stg.products_stg
USING DELTA
AS
SELECT DISTINCT
  product_id,
  trim(product_name) AS product_name,
  COALESCE(NULLIF(trim(category), ''), 'UNKNOWN') AS category,
  CASE WHEN price IS NULL OR price < 0 THEN 0 ELSE price END AS price
FROM ecommerce_raw.products_raw
WHERE product_id IS NOT NULL;

CREATE OR REPLACE TABLE ecommerce_stg.orders_stg
USING DELTA
AS
SELECT DISTINCT
  order_id,
  customer_id,
  order_date,
  CASE 
    WHEN order_status IN ('PLACED','SHIPPED','DELIVERED','CANCELLED','RETURNED') THEN order_status
    ELSE 'PLACED'
  END AS order_status,
  COALESCE(payment_method, 'UNKNOWN') AS payment_method
FROM ecommerce_raw.orders_raw
WHERE order_id IS NOT NULL AND customer_id IS NOT NULL AND order_date IS NOT NULL;

CREATE OR REPLACE TABLE ecommerce_stg.order_items_stg
USING DELTA
AS
SELECT DISTINCT
  order_id,
  product_id,
  CASE WHEN quantity IS NULL OR quantity <= 0 THEN 1 ELSE quantity END AS quantity
FROM ecommerce_raw.order_items_raw
WHERE order_id IS NOT NULL AND product_id IS NOT NULL;
