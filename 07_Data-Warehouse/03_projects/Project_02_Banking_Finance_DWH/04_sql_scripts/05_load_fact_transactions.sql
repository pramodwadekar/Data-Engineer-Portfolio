-- Load transaction fact

INSERT INTO fact_transactions (
  transaction_id, transaction_date_sk, account_sk, customer_sk, branch_sk, txn_type, amount
)
SELECT
  t.transaction_id,
  CAST(REPLACE(CAST(t.transaction_date AS VARCHAR),'-','') AS INT) AS transaction_date_sk,
  a.account_sk,
  c.customer_sk,
  b.branch_sk,
  t.txn_type,
  t.amount
FROM stg_transactions t
JOIN dim_account a ON t.account_id = a.account_id AND a.is_current = 1
JOIN dim_customer c ON a.customer_id = c.customer_id AND c.is_current = 1
JOIN dim_branch b ON a.branch_id = b.branch_id AND b.is_current = 1;
