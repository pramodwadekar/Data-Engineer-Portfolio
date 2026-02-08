# 06 - KPI Views (Practical)

## Goal
Create reporting-ready KPI views.

---

## 1) Daily Sales KPI
```sql
CREATE OR REPLACE VIEW vw_daily_sales_kpi AS
SELECT
  date_key,
  SUM(sales_amount) AS total_sales,
  COUNT(DISTINCT order_id) AS total_orders,
  SUM(quantity) AS total_qty,
  ROUND(SUM(sales_amount) / NULLIF(COUNT(DISTINCT order_id), 0), 2) AS avg_order_value
FROM fact_sales
GROUP BY date_key;
```

---

## 2) Top Products KPI
```sql
CREATE OR REPLACE VIEW vw_top_products AS
SELECT
  p.category,
  p.product_name,
  SUM(f.sales_amount) AS total_sales
FROM fact_sales f
JOIN dim_product p ON f.product_sk = p.product_sk
GROUP BY p.category, p.product_name
ORDER BY total_sales DESC;
```

---

## Interview Tip
KPI layer is what BI tools consume (Power BI/Tableau).

---
