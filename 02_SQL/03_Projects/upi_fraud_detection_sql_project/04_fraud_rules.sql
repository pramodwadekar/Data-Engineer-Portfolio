DROP TABLE IF EXISTS upi_dwh.fraud_alerts;

CREATE TABLE upi_dwh.fraud_alerts AS
WITH base AS (
    SELECT
        txn_id,
        user_id,
        merchant_id,
        txn_ts,
        amount,
        txn_status,
        channel,
        device_id
    FROM upi_dwh.fact_transactions
),

-- Rule 1: High value transaction
rule_high_value AS (
    SELECT
        txn_id,
        user_id,
        'HIGH_VALUE_TXN' AS fraud_rule,
        txn_ts,
        amount
    FROM base
    WHERE amount > 50000
),

-- Rule 2: Many transactions in 2 minutes
rule_many_txn_2min AS (
    SELECT
        txn_id,
        user_id,
        'MANY_TXN_2_MIN' AS fraud_rule,
        txn_ts,
        amount
    FROM (
        SELECT
            txn_id,
            user_id,
            txn_ts,
            amount,
            COUNT(*) OVER (
                PARTITION BY user_id
                ORDER BY txn_ts
                RANGE BETWEEN INTERVAL '2 minutes' PRECEDING AND CURRENT ROW
            ) AS txn_cnt_2min
        FROM base
        WHERE txn_status = 'SUCCESS'
    ) t
    WHERE txn_cnt_2min >= 5
),

-- Rule 3: Many failed txns in 10 minutes
rule_failed_10min AS (
    SELECT
        txn_id,
        user_id,
        'FAILED_10_MIN' AS fraud_rule,
        txn_ts,
        amount
    FROM (
        SELECT
            txn_id,
            user_id,
            txn_ts,
            amount,
            COUNT(*) OVER (
                PARTITION BY user_id
                ORDER BY txn_ts
                RANGE BETWEEN INTERVAL '10 minutes' PRECEDING AND CURRENT ROW
            ) AS failed_cnt_10min
        FROM base
        WHERE txn_status = 'FAILED'
    ) t
    WHERE failed_cnt_10min >= 3
),

-- Rule 4: Same device used by multiple users
rule_device_multi_user AS (
    SELECT
        txn_id,
        user_id,
        'DEVICE_MULTI_USER' AS fraud_rule,
        txn_ts,
        amount
    FROM (
        SELECT
            txn_id,
            user_id,
            txn_ts,
            amount,
            device_id,
            COUNT(DISTINCT user_id) OVER (PARTITION BY device_id) AS users_per_device
        FROM base
        WHERE device_id <> 'UNKNOWN'
    ) t
    WHERE users_per_device >= 3
)

SELECT * FROM rule_high_value
UNION ALL
SELECT * FROM rule_many_txn_2min
UNION ALL
SELECT * FROM rule_failed_10min
UNION ALL
SELECT * FROM rule_device_multi_user;
