USE CATALOG main;
USE SCHEMA sql_dashboard;

-- Gold KPI: Campaign-level KPIs
CREATE OR REPLACE TABLE gold_campaign_kpis AS
SELECT
  c.channel,
  c.objective,
  c.campaign_id,
  c.campaign_name,
  COUNT(*) AS total_events,
  SUM(CASE WHEN e.event_type='click' THEN 1 ELSE 0 END) AS clicks,
  SUM(CASE WHEN e.event_type='lead' THEN 1 ELSE 0 END) AS leads,
  SUM(CASE WHEN e.event_type='purchase' THEN 1 ELSE 0 END) AS purchases,
  SUM(e.revenue) AS total_revenue,
  ROUND(SUM(CASE WHEN e.event_type='purchase' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN e.event_type='click' THEN 1 ELSE 0 END),0), 4) AS purchase_per_click
FROM silver_campaigns c
JOIN silver_marketing_events e
  ON c.campaign_id = e.campaign_id
GROUP BY 1,2,3,4;

-- Gold KPI: Daily revenue
CREATE OR REPLACE TABLE gold_daily_revenue AS
SELECT
  event_date,
  SUM(revenue) AS total_revenue,
  SUM(CASE WHEN event_type='purchase' THEN 1 ELSE 0 END) AS purchases
FROM silver_marketing_events
GROUP BY event_date
ORDER BY event_date;
