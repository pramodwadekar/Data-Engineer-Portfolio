-- Check for NULL keys in fact table
SELECT * FROM fact_sales
WHERE date_key IS NULL
   OR customer_key IS NULL
   OR product_key IS NULL;

-- Check for negative or zero quantities
SELECT * FROM fact_sales
WHERE quantity <= 0;

-- Check for negative sales
SELECT * FROM fact_sales
WHERE total_amount < 0;

-- Count records
SELECT COUNT(*) AS total_sales_records FROM fact_sales;
