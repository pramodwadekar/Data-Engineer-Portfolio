-- Update lifecycle with payment stage

UPDATE fact_order_lifecycle f
SET payment_date_sk = CAST(REPLACE(CAST(p.payment_date AS VARCHAR),'-','') AS INT),
    order_status = CASE WHEN p.payment_status='SUCCESS' THEN 'PAID' ELSE f.order_status END
FROM stg_payments p
WHERE f.order_id = p.order_id
  AND f.payment_date_sk IS NULL;
