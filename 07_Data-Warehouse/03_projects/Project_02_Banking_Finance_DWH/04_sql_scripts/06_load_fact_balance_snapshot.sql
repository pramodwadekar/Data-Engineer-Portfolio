-- Load daily balance snapshot fact

INSERT INTO fact_account_balance_snapshot (
  snapshot_date_sk, account_sk, customer_sk, branch_sk,
  balance_amount, available_balance, credit_limit
)
SELECT
  CAST(REPLACE(CAST(s.snapshot_date AS VARCHAR),'-','') AS INT) AS snapshot_date_sk,
  a.account_sk,
  c.customer_sk,
  b.branch_sk,
  s.balance_amount,
  s.available_balance,
  s.credit_limit
FROM stg_daily_balances s
JOIN dim_account a ON s.account_id = a.account_id AND a.is_current = 1
JOIN dim_customer c ON a.customer_id = c.customer_id AND c.is_current = 1
JOIN dim_branch b ON a.branch_id = b.branch_id AND b.is_current = 1;
