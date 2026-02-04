CREATE OR REPLACE TABLE upi_dwh.fraud_alerts
USING DELTA
AS
WITH base AS (SELECT * FROM upi_dwh.fact_transactions),
rule_high_value AS (
  SELECT txn_id, user_id, 'HIGH_VALUE_TXN' AS fraud_rule, txn_ts, amount
  FROM base WHERE amount > 50000
),
rule_many_txn_2min AS (
  SELECT txn_id, user_id, 'MANY_TXN_2_MIN' AS fraud_rule, txn_ts, amount
  FROM (
    SELECT txn_id, user_id, txn_ts, amount,
      COUNT(*) OVER (
        PARTITION BY user_id
        ORDER BY txn_ts
        RANGE BETWEEN INTERVAL 2 MINUTES PRECEDING AND CURRENT ROW
      ) AS txn_cnt_2min
    FROM base WHERE txn_status='SUCCESS'
  ) t
  WHERE txn_cnt_2min >= 5
)
SELECT * FROM rule_high_value
UNION ALL
SELECT * FROM rule_many_txn_2min;
