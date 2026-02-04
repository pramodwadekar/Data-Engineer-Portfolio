DROP SCHEMA IF EXISTS delivery_dwh CASCADE;
CREATE SCHEMA delivery_dwh;

CREATE TABLE delivery_dwh.dim_customer AS
SELECT * FROM delivery_stg.customers_stg;
ALTER TABLE delivery_dwh.dim_customer ADD PRIMARY KEY(customer_id);

CREATE TABLE delivery_dwh.dim_driver AS
SELECT * FROM delivery_stg.drivers_stg;
ALTER TABLE delivery_dwh.dim_driver ADD PRIMARY KEY(driver_id);

CREATE TABLE delivery_dwh.dim_restaurant AS
SELECT * FROM delivery_stg.restaurants_stg;
ALTER TABLE delivery_dwh.dim_restaurant ADD PRIMARY KEY(restaurant_id);

CREATE TABLE delivery_dwh.dim_date AS
SELECT DISTINCT
  DATE(order_ts) AS date_key,
  EXTRACT(YEAR FROM order_ts) AS year,
  EXTRACT(MONTH FROM order_ts) AS month,
  TO_CHAR(order_ts, 'Month') AS month_name,
  EXTRACT(DOW FROM order_ts) AS day_of_week
FROM delivery_stg.orders_stg;
ALTER TABLE delivery_dwh.dim_date ADD PRIMARY KEY(date_key);
