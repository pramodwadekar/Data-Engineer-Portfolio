# 09 - Partitioning, Clustering, Indexing (DW Performance)

## Why performance tuning matters?
DW tables are huge (billions of rows).

---

## Partitioning
Splits table into partitions based on column.

Common:
- date partition

Benefits:
- partition pruning
- faster scans

---

## Clustering
Sorts data inside partitions.

Benefits:
- faster filters on clustered column

---

## Indexing
Depends on DW technology.

### In SQL Server / Synapse Dedicated
- Clustered index
- Columnstore index (DW best)

---

## Columnstore index
Stores data column-wise.

Benefits:
- high compression
- fast aggregations

---

## Interview must know
- Partition pruning
- Columnstore advantages
- When too many partitions is bad

---
