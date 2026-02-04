DROP SCHEMA IF EXISTS ecommerce_dwh CASCADE;
CREATE SCHEMA ecommerce_dwh;

CREATE TABLE ecommerce_dwh.dim_customer AS
SELECT * FROM ecommerce_stg.customers_stg;
ALTER TABLE ecommerce_dwh.dim_customer ADD PRIMARY KEY (customer_id);

CREATE TABLE ecommerce_dwh.dim_product AS
SELECT * FROM ecommerce_stg.products_stg;
ALTER TABLE ecommerce_dwh.dim_product ADD PRIMARY KEY (product_id);

CREATE TABLE ecommerce_dwh.dim_date AS
SELECT DISTINCT
    order_date AS date_key,
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    TO_CHAR(order_date, 'Month') AS month_name,
    EXTRACT(DAY FROM order_date) AS day,
    EXTRACT(DOW FROM order_date) AS day_of_week
FROM ecommerce_stg.orders_stg;
ALTER TABLE ecommerce_dwh.dim_date ADD PRIMARY KEY (date_key);
