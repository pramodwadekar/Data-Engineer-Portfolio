-- SLA + Funnel marts

-- SLA: delivery days
CREATE TABLE mart_sla_delivery AS
SELECT
  order_id,
  (delivered_date_sk - order_created_date_sk) AS delivery_days
FROM fact_order_lifecycle
WHERE delivered_date_sk IS NOT NULL;

-- Partner performance
CREATE TABLE mart_partner_performance AS
SELECT
  p.partner_name,
  AVG(l.delivered_date_sk - l.order_created_date_sk) AS avg_delivery_days,
  COUNT(*) AS total_orders
FROM fact_order_lifecycle l
JOIN dim_delivery_partner p ON l.partner_sk=p.partner_sk
WHERE l.delivered_date_sk IS NOT NULL
GROUP BY p.partner_name;

-- Funnel metrics
CREATE TABLE mart_funnel_metrics AS
SELECT
  COUNT(*) AS total_orders,
  SUM(CASE WHEN payment_date_sk IS NOT NULL THEN 1 ELSE 0 END) AS paid_orders,
  SUM(CASE WHEN shipped_date_sk IS NOT NULL THEN 1 ELSE 0 END) AS shipped_orders,
  SUM(CASE WHEN delivered_date_sk IS NOT NULL THEN 1 ELSE 0 END) AS delivered_orders,
  SUM(CASE WHEN returned_date_sk IS NOT NULL THEN 1 ELSE 0 END) AS returned_orders
FROM fact_order_lifecycle;
