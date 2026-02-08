-- SCD2 example: customer changes city

-- Step 1: update staging (simulate change)
UPDATE stg_customers
SET city='Bangalore', updated_ts=CURRENT_TIMESTAMP
WHERE customer_id=1001;

-- Step 2: expire current
UPDATE dim_customer d
SET end_date = CURRENT_DATE - INTERVAL '1 day',
    is_current = 0
WHERE d.customer_id=1001 AND d.is_current=1
  AND EXISTS (
    SELECT 1 FROM stg_customers s
    WHERE s.customer_id=d.customer_id AND s.city<>d.city
  );

-- Step 3: insert new
INSERT INTO dim_customer (customer_id, full_name, city, start_date, end_date, is_current)
SELECT customer_id, full_name, city, CURRENT_DATE, '9999-12-31', 1
FROM stg_customers
WHERE customer_id=1001;
