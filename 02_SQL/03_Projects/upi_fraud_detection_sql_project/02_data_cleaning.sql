DROP SCHEMA IF EXISTS upi_stg CASCADE;
CREATE SCHEMA upi_stg;

-- Users staging
CREATE TABLE upi_stg.users_stg AS
SELECT DISTINCT
    user_id,
    TRIM(user_name) AS user_name,
    COALESCE(NULLIF(TRIM(city), ''), 'UNKNOWN') AS city,
    CASE 
        WHEN kyc_status IN ('FULL','MINIMAL','NONE') THEN kyc_status
        ELSE 'NONE'
    END AS kyc_status,
    created_date
FROM upi_raw.users_raw
WHERE user_id IS NOT NULL;

-- Merchants staging
CREATE TABLE upi_stg.merchants_stg AS
SELECT DISTINCT
    merchant_id,
    TRIM(merchant_name) AS merchant_name,
    COALESCE(NULLIF(TRIM(mcc), ''), 'UNKNOWN') AS mcc,
    COALESCE(NULLIF(TRIM(city), ''), 'UNKNOWN') AS city
FROM upi_raw.merchants_raw
WHERE merchant_id IS NOT NULL;

-- Transactions staging
CREATE TABLE upi_stg.transactions_stg AS
SELECT DISTINCT
    txn_id,
    user_id,
    merchant_id,
    txn_ts,
    CASE WHEN amount IS NULL OR amount < 0 THEN 0 ELSE amount END AS amount,
    CASE 
        WHEN txn_status IN ('SUCCESS','FAILED','PENDING') THEN txn_status
        ELSE 'FAILED'
    END AS txn_status,
    COALESCE(channel, 'UPI') AS channel,
    COALESCE(device_id, 'UNKNOWN') AS device_id
FROM upi_raw.transactions_raw
WHERE txn_id IS NOT NULL
  AND user_id IS NOT NULL
  AND merchant_id IS NOT NULL
  AND txn_ts IS NOT NULL;
