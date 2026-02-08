# Practical 08 — Statistics

## Goal
Improve query optimizer decisions.

```sql
CREATE STATISTICS st_fact_sales_date
ON dwh.fact_sales(order_date);
```

## Interview point
Missing statistics = slow queries.
