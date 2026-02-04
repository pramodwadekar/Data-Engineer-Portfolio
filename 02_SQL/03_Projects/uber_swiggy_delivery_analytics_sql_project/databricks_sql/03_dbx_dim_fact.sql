CREATE OR REPLACE TABLE delivery_dwh.dim_customer
USING DELTA
AS SELECT * FROM delivery_stg.customers_stg;

CREATE OR REPLACE TABLE delivery_dwh.dim_driver
USING DELTA
AS SELECT * FROM delivery_stg.drivers_stg;

CREATE OR REPLACE TABLE delivery_dwh.dim_restaurant
USING DELTA
AS SELECT * FROM delivery_stg.restaurants_stg;

CREATE OR REPLACE TABLE delivery_dwh.dim_date
USING DELTA
AS
SELECT DISTINCT
  date(order_ts) AS date_key,
  year(order_ts) AS year,
  month(order_ts) AS month,
  date_format(order_ts, 'MMMM') AS month_name,
  dayofweek(order_ts) AS day_of_week
FROM delivery_stg.orders_stg;

CREATE OR REPLACE TABLE delivery_dwh.fact_orders
USING DELTA
AS
SELECT
  order_id,
  date(order_ts) AS order_date,
  order_ts,
  customer_id,
  restaurant_id,
  driver_id,
  order_status,
  distance_km,
  order_amount
FROM delivery_stg.orders_stg;

CREATE OR REPLACE TABLE delivery_dwh.fact_sla
USING DELTA
AS
SELECT
  order_id,
  customer_id,
  restaurant_id,
  driver_id,
  order_ts,
  estimated_delivery_ts,
  actual_delivery_ts,
  CASE 
    WHEN order_status <> 'DELIVERED' THEN 'NOT_APPLICABLE'
    WHEN actual_delivery_ts > estimated_delivery_ts THEN 'LATE'
    ELSE 'ON_TIME'
  END AS sla_status,
  (unix_timestamp(actual_delivery_ts) - unix_timestamp(order_ts))/60 AS actual_delivery_mins,
  (unix_timestamp(estimated_delivery_ts) - unix_timestamp(order_ts))/60 AS eta_mins
FROM delivery_stg.orders_stg;
