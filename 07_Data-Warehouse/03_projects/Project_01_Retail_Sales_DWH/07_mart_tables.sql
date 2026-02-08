-- Data mart tables for BI dashboards

CREATE TABLE mart_monthly_sales AS
SELECT
  d.year,
  d.month,
  d.month_name,
  SUM(f.net_amount) AS total_sales
FROM fact_sales f
JOIN dim_date d ON f.order_date_sk = d.date_sk
WHERE f.order_status = 'DELIVERED'
GROUP BY d.year, d.month, d.month_name;

CREATE TABLE mart_store_performance AS
SELECT
  s.store_name,
  s.city,
  SUM(f.net_amount) AS total_sales
FROM fact_sales f
JOIN dim_store s ON f.store_sk = s.store_sk
WHERE f.order_status = 'DELIVERED'
GROUP BY s.store_name, s.city;
