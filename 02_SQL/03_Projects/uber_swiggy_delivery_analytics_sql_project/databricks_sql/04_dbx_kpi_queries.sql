SELECT
  ROUND(100.0 * SUM(CASE WHEN sla_status='LATE' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN sla_status IN ('LATE','ON_TIME') THEN 1 ELSE 0 END),0), 2) AS late_rate_pct
FROM delivery_dwh.fact_sla;

SELECT
  r.restaurant_name,
  ROUND(100.0 * SUM(CASE WHEN s.sla_status='LATE' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN s.sla_status IN ('LATE','ON_TIME') THEN 1 ELSE 0 END),0), 2) AS late_rate_pct
FROM delivery_dwh.fact_sla s
JOIN delivery_dwh.dim_restaurant r ON s.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
HAVING SUM(CASE WHEN s.sla_status IN ('LATE','ON_TIME') THEN 1 ELSE 0 END) >= 10
ORDER BY late_rate_pct DESC
LIMIT 10;
