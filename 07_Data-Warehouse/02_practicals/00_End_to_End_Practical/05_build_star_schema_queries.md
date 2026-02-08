# 05 — Star Schema Queries (BI style)

## Goal
Practice real BI queries using star schema.

---

## Query 1: Total sales by month
```sql
SELECT
  d.year,
  d.month_name,
  SUM(f.net_amount) AS total_sales
FROM fact_sales f
JOIN dim_date d ON f.order_date_sk = d.date_sk
WHERE f.order_status = 'DELIVERED'
GROUP BY d.year, d.month_name
ORDER BY d.year, MIN(d.month);
```

---

## Query 2: Top products by sales
```sql
SELECT
  p.product_name,
  SUM(f.net_amount) AS total_sales
FROM fact_sales f
JOIN dim_product p ON f.product_sk = p.product_sk
WHERE f.order_status = 'DELIVERED'
GROUP BY p.product_name
ORDER BY total_sales DESC;
```

---

## Query 3: Sales by city
```sql
SELECT
  c.city,
  SUM(f.net_amount) AS total_sales
FROM fact_sales f
JOIN dim_customer c ON f.customer_sk = c.customer_sk
WHERE f.order_status = 'DELIVERED'
GROUP BY c.city
ORDER BY total_sales DESC;
```

---

## Output
You now understand how BI tools query a warehouse.
