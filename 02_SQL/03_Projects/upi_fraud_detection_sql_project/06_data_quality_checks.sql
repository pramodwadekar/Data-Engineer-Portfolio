-- Duplicate txn_id
SELECT txn_id, COUNT(*)
FROM upi_stg.transactions_stg
GROUP BY txn_id
HAVING COUNT(*) > 1;

-- Orphan merchant_id in transactions
SELECT t.*
FROM upi_raw.transactions_raw t
LEFT JOIN upi_raw.merchants_raw m ON t.merchant_id = m.merchant_id
WHERE m.merchant_id IS NULL;

-- Invalid amounts
SELECT *
FROM upi_raw.transactions_raw
WHERE amount < 0;

-- Invalid statuses
SELECT DISTINCT txn_status
FROM upi_raw.transactions_raw
WHERE txn_status NOT IN ('SUCCESS','FAILED','PENDING');
