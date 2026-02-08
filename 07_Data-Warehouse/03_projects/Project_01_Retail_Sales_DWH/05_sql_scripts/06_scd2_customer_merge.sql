-- SCD2 merge logic (generic)
-- NOTE: Syntax differs by SQL engine; treat as reference.

-- 1) Expire changed records
UPDATE dim_customer d
SET end_date = CURRENT_DATE - INTERVAL '1 day',
    is_current = 0
WHERE d.is_current = 1
  AND EXISTS (
    SELECT 1
    FROM stg_customers s
    WHERE s.customer_id = d.customer_id
      AND (s.city <> d.city OR s.state <> d.state OR s.phone <> d.phone)
  );

-- 2) Insert new current records for changed customers
INSERT INTO dim_customer (customer_id, full_name, phone, city, state, start_date, end_date, is_current)
SELECT s.customer_id, s.full_name, s.phone, s.city, s.state, CURRENT_DATE, '9999-12-31', 1
FROM stg_customers s
LEFT JOIN dim_customer d
  ON s.customer_id = d.customer_id AND d.is_current = 1
WHERE d.customer_id IS NULL
   OR (s.city <> d.city OR s.state <> d.state OR s.phone <> d.phone);
