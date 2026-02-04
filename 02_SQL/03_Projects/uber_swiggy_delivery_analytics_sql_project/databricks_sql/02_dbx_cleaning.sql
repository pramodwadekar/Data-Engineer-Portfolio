CREATE OR REPLACE TABLE delivery_stg.customers_stg
USING DELTA
AS
SELECT DISTINCT
  customer_id,
  trim(customer_name) AS customer_name,
  COALESCE(NULLIF(trim(city), ''), 'UNKNOWN') AS city,
  COALESCE(NULLIF(trim(zone), ''), 'UNKNOWN') AS zone,
  signup_date
FROM delivery_raw.customers_raw
WHERE customer_id IS NOT NULL;

CREATE OR REPLACE TABLE delivery_stg.drivers_stg
USING DELTA
AS
SELECT DISTINCT
  driver_id,
  trim(driver_name) AS driver_name,
  COALESCE(NULLIF(trim(city), ''), 'UNKNOWN') AS city,
  CASE WHEN vehicle_type IN ('BIKE','SCOOTER','CAR') THEN vehicle_type ELSE 'BIKE' END AS vehicle_type,
  join_date
FROM delivery_raw.drivers_raw
WHERE driver_id IS NOT NULL;

CREATE OR REPLACE TABLE delivery_stg.restaurants_stg
USING DELTA
AS
SELECT DISTINCT
  restaurant_id,
  trim(restaurant_name) AS restaurant_name,
  COALESCE(NULLIF(trim(city), ''), 'UNKNOWN') AS city,
  COALESCE(NULLIF(trim(zone), ''), 'UNKNOWN') AS zone,
  COALESCE(NULLIF(trim(cuisine), ''), 'UNKNOWN') AS cuisine
FROM delivery_raw.restaurants_raw
WHERE restaurant_id IS NOT NULL;

CREATE OR REPLACE TABLE delivery_stg.orders_stg
USING DELTA
AS
SELECT DISTINCT
  order_id,
  customer_id,
  restaurant_id,
  driver_id,
  order_ts,
  estimated_delivery_ts,
  actual_delivery_ts,
  CASE WHEN order_status IN ('PLACED','ACCEPTED','PICKED','DELIVERED','CANCELLED') THEN order_status ELSE 'PLACED' END AS order_status,
  CASE WHEN distance_km IS NULL OR distance_km < 0 THEN 0 ELSE distance_km END AS distance_km,
  CASE WHEN order_amount IS NULL OR order_amount < 0 THEN 0 ELSE order_amount END AS order_amount
FROM delivery_raw.orders_raw
WHERE order_id IS NOT NULL
  AND customer_id IS NOT NULL
  AND restaurant_id IS NOT NULL
  AND driver_id IS NOT NULL
  AND order_ts IS NOT NULL
  AND estimated_delivery_ts IS NOT NULL;
