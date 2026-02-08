# 07 - Query Optimization in DW (Practical)

## Goal
Understand how to optimize DW queries.

---

## 1) Typical slow query
```sql
SELECT
  c.city,
  SUM(f.sales_amount) AS total_sales
FROM fact_sales f
JOIN dim_customer c ON f.customer_sk = c.customer_sk
WHERE f.date_key BETWEEN 20260101 AND 20261231
GROUP BY c.city;
```

---

## 2) Optimization checklist
### A) Partition by date
Partition fact_sales by date_key (technology dependent).

### B) Columnstore index
For MPP warehouses (Synapse, Redshift):
- use columnstore

### C) Avoid SELECT *
Always project only required columns.

### D) Pre-aggregate
Use materialized views or aggregate tables.

---

## 3) Explain plan
Use:
- `EXPLAIN`
- `EXPLAIN ANALYZE`

---

## Interview Tip
Say:
> “I check scan size, joins, and shuffle/data movement, then apply partitioning + indexing.”

---
