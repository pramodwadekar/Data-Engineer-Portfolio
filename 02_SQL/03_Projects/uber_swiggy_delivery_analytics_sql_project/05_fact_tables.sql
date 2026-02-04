-- Fact Orders
CREATE TABLE delivery_dwh.fact_orders AS
SELECT
  order_id,
  DATE(order_ts) AS order_date,
  order_ts,
  customer_id,
  restaurant_id,
  driver_id,
  order_status,
  distance_km,
  order_amount
FROM delivery_stg.orders_stg;

ALTER TABLE delivery_dwh.fact_orders ADD PRIMARY KEY(order_id);

-- Fact SLA
CREATE TABLE delivery_dwh.fact_sla AS
SELECT
  o.order_id,
  o.customer_id,
  o.restaurant_id,
  o.driver_id,
  o.order_ts,
  o.estimated_delivery_ts,
  o.actual_delivery_ts,
  CASE 
    WHEN o.order_status <> 'DELIVERED' THEN 'NOT_APPLICABLE'
    WHEN o.actual_delivery_ts > o.estimated_delivery_ts THEN 'LATE'
    ELSE 'ON_TIME'
  END AS sla_status,
  EXTRACT(EPOCH FROM (o.actual_delivery_ts - o.order_ts))/60 AS actual_delivery_mins,
  EXTRACT(EPOCH FROM (o.estimated_delivery_ts - o.order_ts))/60 AS eta_mins
FROM delivery_stg.orders_stg o;

CREATE INDEX idx_sla_status ON delivery_dwh.fact_sla(sla_status);
CREATE INDEX idx_sla_driver ON delivery_dwh.fact_sla(driver_id);
CREATE INDEX idx_sla_rest ON delivery_dwh.fact_sla(restaurant_id);
