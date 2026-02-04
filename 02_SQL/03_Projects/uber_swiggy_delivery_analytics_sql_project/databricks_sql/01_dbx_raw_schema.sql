CREATE DATABASE IF NOT EXISTS delivery_raw;
CREATE DATABASE IF NOT EXISTS delivery_stg;
CREATE DATABASE IF NOT EXISTS delivery_dwh;

CREATE OR REPLACE TABLE delivery_raw.customers_raw (
  customer_id INT,
  customer_name STRING,
  city STRING,
  zone STRING,
  signup_date DATE
) USING DELTA;

CREATE OR REPLACE TABLE delivery_raw.drivers_raw (
  driver_id INT,
  driver_name STRING,
  city STRING,
  vehicle_type STRING,
  join_date DATE
) USING DELTA;

CREATE OR REPLACE TABLE delivery_raw.restaurants_raw (
  restaurant_id INT,
  restaurant_name STRING,
  city STRING,
  zone STRING,
  cuisine STRING
) USING DELTA;

CREATE OR REPLACE TABLE delivery_raw.orders_raw (
  order_id INT,
  customer_id INT,
  restaurant_id INT,
  driver_id INT,
  order_ts TIMESTAMP,
  estimated_delivery_ts TIMESTAMP,
  actual_delivery_ts TIMESTAMP,
  order_status STRING,
  distance_km DECIMAL(10,2),
  order_amount DECIMAL(10,2)
) USING DELTA;
