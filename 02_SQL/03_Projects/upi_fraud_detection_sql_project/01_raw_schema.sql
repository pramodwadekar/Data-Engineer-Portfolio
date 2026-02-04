DROP SCHEMA IF EXISTS upi_raw CASCADE;
CREATE SCHEMA upi_raw;

CREATE TABLE upi_raw.users_raw (
    user_id       INT,
    user_name     VARCHAR(100),
    city          VARCHAR(50),
    kyc_status    VARCHAR(20),
    created_date  DATE
);

CREATE TABLE upi_raw.merchants_raw (
    merchant_id    INT,
    merchant_name  VARCHAR(120),
    mcc            VARCHAR(50),
    city           VARCHAR(50)
);

CREATE TABLE upi_raw.transactions_raw (
    txn_id       INT,
    user_id      INT,
    merchant_id  INT,
    txn_ts       TIMESTAMP,
    amount       NUMERIC(12,2),
    txn_status   VARCHAR(20),
    channel      VARCHAR(20),
    device_id    VARCHAR(20)
);
