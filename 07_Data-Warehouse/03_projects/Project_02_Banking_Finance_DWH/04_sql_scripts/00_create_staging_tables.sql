-- Staging tables (raw extracts)

CREATE TABLE stg_customers (
  customer_id INT,
  full_name VARCHAR(100),
  city VARCHAR(50),
  created_ts TIMESTAMP,
  updated_ts TIMESTAMP
);

CREATE TABLE stg_accounts (
  account_id INT,
  customer_id INT,
  branch_id INT,
  account_type VARCHAR(50),
  status VARCHAR(20),
  opened_date DATE,
  updated_ts TIMESTAMP
);

CREATE TABLE stg_branches (
  branch_id INT,
  branch_name VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  updated_ts TIMESTAMP
);

CREATE TABLE stg_transactions (
  transaction_id INT,
  account_id INT,
  transaction_date DATE,
  txn_type VARCHAR(10), -- DEBIT/CREDIT
  amount DECIMAL(18,2),
  updated_ts TIMESTAMP
);

-- Daily balance extract from core banking
CREATE TABLE stg_daily_balances (
  snapshot_date DATE,
  account_id INT,
  balance_amount DECIMAL(18,2),
  available_balance DECIMAL(18,2),
  credit_limit DECIMAL(18,2),
  updated_ts TIMESTAMP
);
