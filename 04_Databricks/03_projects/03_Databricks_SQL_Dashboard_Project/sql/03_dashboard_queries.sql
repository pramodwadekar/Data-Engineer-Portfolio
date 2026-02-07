USE CATALOG main;
USE SCHEMA sql_dashboard;

-- 1) Revenue by channel
SELECT channel, SUM(total_revenue) AS revenue
FROM gold_campaign_kpis
GROUP BY channel
ORDER BY revenue DESC;

-- 2) Top campaigns by revenue
SELECT campaign_name, total_revenue
FROM gold_campaign_kpis
ORDER BY total_revenue DESC
LIMIT 10;

-- 3) Daily revenue trend
SELECT * FROM gold_daily_revenue ORDER BY event_date;

-- 4) Conversion rate (purchase per click)
SELECT channel, AVG(purchase_per_click) AS avg_purchase_per_click
FROM gold_campaign_kpis
GROUP BY channel
ORDER BY avg_purchase_per_click DESC;
