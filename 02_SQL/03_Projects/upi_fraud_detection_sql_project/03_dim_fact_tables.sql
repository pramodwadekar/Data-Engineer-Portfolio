DROP SCHEMA IF EXISTS upi_dwh CASCADE;
CREATE SCHEMA upi_dwh;

CREATE TABLE upi_dwh.dim_user AS
SELECT * FROM upi_stg.users_stg;

ALTER TABLE upi_dwh.dim_user
ADD PRIMARY KEY (user_id);

CREATE TABLE upi_dwh.dim_merchant AS
SELECT * FROM upi_stg.merchants_stg;

ALTER TABLE upi_dwh.dim_merchant
ADD PRIMARY KEY (merchant_id);

CREATE TABLE upi_dwh.fact_transactions AS
SELECT
    txn_id,
    user_id,
    merchant_id,
    txn_ts,
    amount,
    txn_status,
    channel,
    device_id
FROM upi_stg.transactions_stg;

ALTER TABLE upi_dwh.fact_transactions
ADD PRIMARY KEY (txn_id);

CREATE INDEX idx_txn_user_ts ON upi_dwh.fact_transactions(user_id, txn_ts);
CREATE INDEX idx_txn_status ON upi_dwh.fact_transactions(txn_status);
