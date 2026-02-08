# 12 — Performance Optimization Practical

## Goal
Apply practical optimization ideas.

---

## Step 1: Partition fact table (if supported)
Partition by order_date_sk or order_date.

Example (conceptual):
- Partition fact_sales by month/year

---

## Step 2: Index foreign keys
```sql
CREATE INDEX idx_fact_sales_customer_sk ON fact_sales(customer_sk);
CREATE INDEX idx_fact_sales_product_sk ON fact_sales(product_sk);
CREATE INDEX idx_fact_sales_store_sk ON fact_sales(store_sk);
CREATE INDEX idx_fact_sales_date_sk ON fact_sales(order_date_sk);
```

---

## Step 3: Avoid SELECT *
Always select required columns.

---

## Step 4: Pre-aggregation for dashboards
Create a summary table:
```sql
CREATE TABLE mart_monthly_sales AS
SELECT
  d.year,
  d.month,
  SUM(f.net_amount) AS total_sales
FROM fact_sales f
JOIN dim_date d ON f.order_date_sk = d.date_sk
WHERE f.order_status = 'DELIVERED'
GROUP BY d.year, d.month;
```

---

## Step 5: Validate performance
Measure query runtime before vs after.

---

## Key learning
Warehouse performance = partitioning + indexing + modeling.
