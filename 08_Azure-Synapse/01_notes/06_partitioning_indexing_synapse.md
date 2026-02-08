# 06 - Partitions, Indexes, Statistics (Performance)

## Partitioning
Partition large fact tables by date.
Benefits:
- partition elimination
- faster loads and queries

## Columnstore index
Default for large tables.
Benefits:
- compression
- fast aggregations

## Heap
Use for staging tables.

## Statistics
Very important for query optimizer.
Update stats after large loads.

```sql
UPDATE STATISTICS dbo.fact_sales;
```

---
