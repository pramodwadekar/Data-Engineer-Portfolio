# 08 — Columnstore Index, Partitioning, Statistics (Dedicated SQL Pool)

## Columnstore Index
Dedicated SQL pool uses columnstore for large tables.

Benefits:
- high compression
- fast scans
- fast aggregations

Best for:
- fact tables

---

## Partitioning
Partition by:
- date/month/year

Benefits:
- partition pruning
- faster queries
- easier maintenance

---

## Statistics
Synapse needs statistics for query optimizer.

Example:
```sql
CREATE STATISTICS st_sales_date ON fact_sales(order_date_sk);
```

---

## Interview points
- Columnstore + partitioning = best performance
- Update stats regularly
