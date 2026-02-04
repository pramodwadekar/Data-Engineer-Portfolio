-- Total transactions
SELECT COUNT(*) AS total_txns
FROM upi_dwh.fact_transactions;

-- Success rate
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN txn_status='SUCCESS' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS success_rate_pct
FROM upi_dwh.fact_transactions;

-- Daily transaction volume
SELECT
    DATE(txn_ts) AS day,
    COUNT(*) AS txns
FROM upi_dwh.fact_transactions
GROUP BY day
ORDER BY day;

-- Top merchants by revenue
SELECT
    merchant_id,
    SUM(amount) AS total_amount
FROM upi_dwh.fact_transactions
WHERE txn_status='SUCCESS'
GROUP BY merchant_id
ORDER BY total_amount DESC
LIMIT 10;

-- Fraud alerts count by rule
SELECT
    fraud_rule,
    COUNT(*) AS alerts
FROM upi_dwh.fraud_alerts
GROUP BY fraud_rule
ORDER BY alerts DESC;
