-- 1) Late delivery rate
SELECT
  ROUND(100.0 * SUM(CASE WHEN sla_status='LATE' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN sla_status IN ('LATE','ON_TIME') THEN 1 ELSE 0 END),0), 2) AS late_rate_pct
FROM delivery_dwh.fact_sla;

-- 2) City wise late rate
SELECT
  c.city,
  ROUND(100.0 * SUM(CASE WHEN s.sla_status='LATE' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN s.sla_status IN ('LATE','ON_TIME') THEN 1 ELSE 0 END),0), 2) AS late_rate_pct
FROM delivery_dwh.fact_sla s
JOIN delivery_dwh.dim_customer c ON s.customer_id = c.customer_id
GROUP BY c.city
ORDER BY late_rate_pct DESC;

-- 3) Top 10 worst restaurants by late rate
SELECT
  r.restaurant_name,
  ROUND(100.0 * SUM(CASE WHEN s.sla_status='LATE' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN s.sla_status IN ('LATE','ON_TIME') THEN 1 ELSE 0 END),0), 2) AS late_rate_pct
FROM delivery_dwh.fact_sla s
JOIN delivery_dwh.dim_restaurant r ON s.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
HAVING SUM(CASE WHEN s.sla_status IN ('LATE','ON_TIME') THEN 1 ELSE 0 END) >= 10
ORDER BY late_rate_pct DESC
LIMIT 10;

-- 4) Top 10 best drivers by on-time rate
SELECT
  d.driver_name,
  ROUND(100.0 * SUM(CASE WHEN s.sla_status='ON_TIME' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN s.sla_status IN ('LATE','ON_TIME') THEN 1 ELSE 0 END),0), 2) AS on_time_pct
FROM delivery_dwh.fact_sla s
JOIN delivery_dwh.dim_driver d ON s.driver_id = d.driver_id
GROUP BY d.driver_name
HAVING SUM(CASE WHEN s.sla_status IN ('LATE','ON_TIME') THEN 1 ELSE 0 END) >= 10
ORDER BY on_time_pct DESC
LIMIT 10;
