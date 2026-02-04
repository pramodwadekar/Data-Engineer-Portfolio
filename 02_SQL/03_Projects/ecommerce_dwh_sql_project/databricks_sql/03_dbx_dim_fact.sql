CREATE OR REPLACE TABLE ecommerce_dwh.dim_customer
USING DELTA
AS SELECT * FROM ecommerce_stg.customers_stg;

CREATE OR REPLACE TABLE ecommerce_dwh.dim_product
USING DELTA
AS SELECT * FROM ecommerce_stg.products_stg;

CREATE OR REPLACE TABLE ecommerce_dwh.dim_date
USING DELTA
AS
SELECT DISTINCT
  order_date AS date_key,
  year(order_date) AS year,
  month(order_date) AS month,
  date_format(order_date, 'MMMM') AS month_name,
  day(order_date) AS day,
  dayofweek(order_date) AS day_of_week
FROM ecommerce_stg.orders_stg;

CREATE OR REPLACE TABLE ecommerce_dwh.fact_orders
USING DELTA
AS
SELECT order_id, order_date, customer_id, order_status, payment_method
FROM ecommerce_stg.orders_stg;

CREATE OR REPLACE TABLE ecommerce_dwh.fact_sales
USING DELTA
AS
SELECT
  o.order_id,
  o.order_date,
  o.customer_id,
  oi.product_id,
  oi.quantity,
  (oi.quantity * p.price) AS sales_amount
FROM ecommerce_stg.orders_stg o
JOIN ecommerce_stg.order_items_stg oi ON o.order_id = oi.order_id
JOIN ecommerce_stg.products_stg p ON oi.product_id = p.product_id;
