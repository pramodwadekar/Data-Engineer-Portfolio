-- Validation

-- Null SK checks
SELECT COUNT(*) AS null_customer_sk
FROM dwh.fact_sales
WHERE customer_sk IS NULL;

-- Reconciliation totals
SELECT SUM(amount) FROM dwh.fact_sales;
