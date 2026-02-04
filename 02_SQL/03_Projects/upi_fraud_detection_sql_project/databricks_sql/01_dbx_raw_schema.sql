CREATE DATABASE IF NOT EXISTS upi_raw;
CREATE DATABASE IF NOT EXISTS upi_stg;
CREATE DATABASE IF NOT EXISTS upi_dwh;

CREATE OR REPLACE TABLE upi_raw.users_raw (
  user_id INT,
  user_name STRING,
  city STRING,
  kyc_status STRING,
  created_date DATE
) USING DELTA;

CREATE OR REPLACE TABLE upi_raw.merchants_raw (
  merchant_id INT,
  merchant_name STRING,
  mcc STRING,
  city STRING
) USING DELTA;

CREATE OR REPLACE TABLE upi_raw.transactions_raw (
  txn_id INT,
  user_id INT,
  merchant_id INT,
  txn_ts TIMESTAMP,
  amount DECIMAL(12,2),
  txn_status STRING,
  channel STRING,
  device_id STRING
) USING DELTA;
