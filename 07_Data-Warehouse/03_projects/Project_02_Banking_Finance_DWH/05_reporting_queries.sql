-- Finance reporting queries

-- Daily total deposits
SELECT snapshot_date_sk, SUM(balance_amount) AS total_deposits
FROM fact_account_balance_snapshot
GROUP BY snapshot_date_sk
ORDER BY snapshot_date_sk;

-- Branch-wise deposits
SELECT b.branch_name, SUM(f.balance_amount) AS total_deposits
FROM fact_account_balance_snapshot f
JOIN dim_branch b ON f.branch_sk = b.branch_sk
GROUP BY b.branch_name
ORDER BY total_deposits DESC;
