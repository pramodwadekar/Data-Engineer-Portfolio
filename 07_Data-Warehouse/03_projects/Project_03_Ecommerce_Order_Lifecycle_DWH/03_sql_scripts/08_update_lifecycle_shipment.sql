-- Update lifecycle with shipment + delivery + partner

UPDATE fact_order_lifecycle f
SET packed_date_sk = CAST(REPLACE(CAST(s.packed_date AS VARCHAR),'-','') AS INT),
    shipped_date_sk = CAST(REPLACE(CAST(s.shipped_date AS VARCHAR),'-','') AS INT),
    delivered_date_sk = CAST(REPLACE(CAST(s.delivered_date AS VARCHAR),'-','') AS INT),
    partner_sk = dp.partner_sk,
    order_status = CASE WHEN s.delivered_date IS NOT NULL THEN 'DELIVERED' ELSE f.order_status END
FROM stg_shipments s
JOIN dim_delivery_partner dp ON s.delivery_partner_id=dp.delivery_partner_id
WHERE f.order_id = s.order_id;
