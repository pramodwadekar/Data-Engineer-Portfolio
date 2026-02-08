-- Update lifecycle with return stage

UPDATE fact_order_lifecycle f
SET returned_date_sk = CAST(REPLACE(CAST(r.returned_date AS VARCHAR),'-','') AS INT),
    order_status = 'RETURNED'
FROM stg_returns r
WHERE f.order_id = r.order_id;
