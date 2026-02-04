DROP SCHEMA IF EXISTS delivery_raw CASCADE;
CREATE SCHEMA delivery_raw;

CREATE TABLE delivery_raw.customers_raw (
  customer_id INT,
  customer_name VARCHAR(100),
  city VARCHAR(50),
  zone VARCHAR(50),
  signup_date DATE
);

CREATE TABLE delivery_raw.drivers_raw (
  driver_id INT,
  driver_name VARCHAR(100),
  city VARCHAR(50),
  vehicle_type VARCHAR(20),
  join_date DATE
);

CREATE TABLE delivery_raw.restaurants_raw (
  restaurant_id INT,
  restaurant_name VARCHAR(120),
  city VARCHAR(50),
  zone VARCHAR(50),
  cuisine VARCHAR(50)
);

CREATE TABLE delivery_raw.orders_raw (
  order_id INT,
  customer_id INT,
  restaurant_id INT,
  driver_id INT,
  order_ts TIMESTAMP,
  estimated_delivery_ts TIMESTAMP,
  actual_delivery_ts TIMESTAMP,
  order_status VARCHAR(20),
  distance_km NUMERIC(10,2),
  order_amount NUMERIC(10,2)
);
