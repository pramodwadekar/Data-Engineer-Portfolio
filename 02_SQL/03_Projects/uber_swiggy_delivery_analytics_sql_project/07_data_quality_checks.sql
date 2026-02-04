-- Duplicate orders
SELECT order_id, COUNT(*)
FROM delivery_stg.orders_stg
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Negative distance in raw
SELECT *
FROM delivery_raw.orders_raw
WHERE distance_km < 0;

-- Invalid status
SELECT DISTINCT order_status
FROM delivery_raw.orders_raw
WHERE order_status NOT IN ('PLACED','ACCEPTED','PICKED','DELIVERED','CANCELLED');
