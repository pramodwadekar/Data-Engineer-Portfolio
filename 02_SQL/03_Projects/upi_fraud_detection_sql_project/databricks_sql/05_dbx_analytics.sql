SELECT fraud_rule, COUNT(*) AS alerts
FROM upi_dwh.fraud_alerts
GROUP BY fraud_rule
ORDER BY alerts DESC;
