CREATE DATABASE IF NOT EXISTS ecommerce_raw;
CREATE DATABASE IF NOT EXISTS ecommerce_stg;
CREATE DATABASE IF NOT EXISTS ecommerce_dwh;

CREATE OR REPLACE TABLE ecommerce_raw.customers_raw (
  customer_id INT,
  customer_name STRING,
  city STRING,
  signup_date DATE,
  email STRING
) USING DELTA;

CREATE OR REPLACE TABLE ecommerce_raw.products_raw (
  product_id INT,
  product_name STRING,
  category STRING,
  price DECIMAL(10,2)
) USING DELTA;

CREATE OR REPLACE TABLE ecommerce_raw.orders_raw (
  order_id INT,
  customer_id INT,
  order_date DATE,
  order_status STRING,
  payment_method STRING
) USING DELTA;

CREATE OR REPLACE TABLE ecommerce_raw.order_items_raw (
  order_id INT,
  product_id INT,
  quantity INT
) USING DELTA;
