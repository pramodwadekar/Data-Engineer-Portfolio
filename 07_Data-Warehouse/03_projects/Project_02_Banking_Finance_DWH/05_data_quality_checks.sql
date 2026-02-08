-- Data Quality checks

-- 1) Only 1 current row per customer
SELECT customer_id, COUNT(*)
FROM dim_customer
WHERE is_current=1
GROUP BY customer_id
HAVING COUNT(*)>1;

-- 2) Snapshot duplicates (same account, same day)
SELECT snapshot_date_sk, account_sk, COUNT(*)
FROM fact_account_balance_snapshot
GROUP BY snapshot_date_sk, account_sk
HAVING COUNT(*)>1;

-- 3) Null SK in facts
SELECT COUNT(*) AS null_sk
FROM fact_account_balance_snapshot
WHERE account_sk IS NULL OR customer_sk IS NULL OR branch_sk IS NULL;
