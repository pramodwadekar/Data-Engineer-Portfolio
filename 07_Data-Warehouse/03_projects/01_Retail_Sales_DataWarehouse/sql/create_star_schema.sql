-- Retail Sales Data Warehouse - Star Schema (DDL)
-- Works with Databricks SQL / Synapse SQL with small modifications.

CREATE TABLE IF NOT EXISTS dim_customer (
  customer_sk BIGINT GENERATED ALWAYS AS IDENTITY,
  customer_id INT NOT NULL,
  customer_name STRING,
  city STRING,
  segment STRING
);

CREATE TABLE IF NOT EXISTS dim_product (
  product_sk BIGINT GENERATED ALWAYS AS IDENTITY,
  product_id INT NOT NULL,
  product_name STRING,
  category STRING,
  brand STRING
);

CREATE TABLE IF NOT EXISTS fact_sales (
  order_id INT,
  order_line_id INT,
  date_key INT,
  customer_sk BIGINT,
  product_sk BIGINT,
  store_id INT,
  quantity INT,
  sales_amount DECIMAL(18,2)
);
