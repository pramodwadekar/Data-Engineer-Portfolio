-- Dimensions (SCD2 ready) + Facts

CREATE TABLE dim_customer (
  customer_sk INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  customer_id INT,
  full_name VARCHAR(100),
  city VARCHAR(50),
  start_date DATE,
  end_date DATE,
  is_current INT
);

CREATE TABLE dim_branch (
  branch_sk INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  branch_id INT,
  branch_name VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  start_date DATE,
  end_date DATE,
  is_current INT
);

CREATE TABLE dim_account (
  account_sk INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  account_id INT,
  customer_id INT,
  branch_id INT,
  account_type VARCHAR(50),
  status VARCHAR(20),
  opened_date DATE,
  start_date DATE,
  end_date DATE,
  is_current INT
);

CREATE TABLE dim_date (
  date_sk INT PRIMARY KEY,
  full_date DATE,
  year INT,
  month INT,
  day INT
);

CREATE TABLE fact_transactions (
  txn_sk INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  transaction_id INT,
  transaction_date_sk INT,
  account_sk INT,
  customer_sk INT,
  branch_sk INT,
  txn_type VARCHAR(10),
  amount DECIMAL(18,2)
);

CREATE TABLE fact_account_balance_snapshot (
  snapshot_sk INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  snapshot_date_sk INT,
  account_sk INT,
  customer_sk INT,
  branch_sk INT,
  balance_amount DECIMAL(18,2),
  available_balance DECIMAL(18,2),
  credit_limit DECIMAL(18,2)
);
