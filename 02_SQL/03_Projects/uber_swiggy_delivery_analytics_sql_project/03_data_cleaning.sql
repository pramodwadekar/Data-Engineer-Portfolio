DROP SCHEMA IF EXISTS delivery_stg CASCADE;
CREATE SCHEMA delivery_stg;

-- Customers
CREATE TABLE delivery_stg.customers_stg AS
SELECT DISTINCT
  customer_id,
  TRIM(customer_name) AS customer_name,
  COALESCE(NULLIF(TRIM(city), ''), 'UNKNOWN') AS city,
  COALESCE(NULLIF(TRIM(zone), ''), 'UNKNOWN') AS zone,
  signup_date
FROM delivery_raw.customers_raw
WHERE customer_id IS NOT NULL;

-- Drivers
CREATE TABLE delivery_stg.drivers_stg AS
SELECT DISTINCT
  driver_id,
  TRIM(driver_name) AS driver_name,
  COALESCE(NULLIF(TRIM(city), ''), 'UNKNOWN') AS city,
  CASE WHEN vehicle_type IN ('BIKE','SCOOTER','CAR') THEN vehicle_type ELSE 'BIKE' END AS vehicle_type,
  join_date
FROM delivery_raw.drivers_raw
WHERE driver_id IS NOT NULL;

-- Restaurants
CREATE TABLE delivery_stg.restaurants_stg AS
SELECT DISTINCT
  restaurant_id,
  TRIM(restaurant_name) AS restaurant_name,
  COALESCE(NULLIF(TRIM(city), ''), 'UNKNOWN') AS city,
  COALESCE(NULLIF(TRIM(zone), ''), 'UNKNOWN') AS zone,
  COALESCE(NULLIF(TRIM(cuisine), ''), 'UNKNOWN') AS cuisine
FROM delivery_raw.restaurants_raw
WHERE restaurant_id IS NOT NULL;

-- Orders
CREATE TABLE delivery_stg.orders_stg AS
SELECT DISTINCT
  order_id,
  customer_id,
  restaurant_id,
  driver_id,
  order_ts,
  estimated_delivery_ts,
  actual_delivery_ts,
  CASE
    WHEN order_status IN ('PLACED','ACCEPTED','PICKED','DELIVERED','CANCELLED') THEN order_status
    ELSE 'PLACED'
  END AS order_status,
  CASE WHEN distance_km IS NULL OR distance_km < 0 THEN 0 ELSE distance_km END AS distance_km,
  CASE WHEN order_amount IS NULL OR order_amount < 0 THEN 0 ELSE order_amount END AS order_amount
FROM delivery_raw.orders_raw
WHERE order_id IS NOT NULL
  AND customer_id IS NOT NULL
  AND restaurant_id IS NOT NULL
  AND driver_id IS NOT NULL
  AND order_ts IS NOT NULL
  AND estimated_delivery_ts IS NOT NULL;
