USE CATALOG main;
USE SCHEMA sql_dashboard;

-- Alert 1: Daily revenue too low
SELECT event_date, total_revenue
FROM gold_daily_revenue
WHERE total_revenue < 1000;

-- Alert 2: Conversion drop
SELECT channel, AVG(purchase_per_click) AS avg_purchase_per_click
FROM gold_campaign_kpis
GROUP BY channel
HAVING AVG(purchase_per_click) < 0.05;
