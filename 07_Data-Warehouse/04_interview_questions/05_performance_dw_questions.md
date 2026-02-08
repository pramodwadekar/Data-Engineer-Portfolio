# 05 - DW Performance Questions (Interview Q&A)

## 1) Why partitioning helps?
Partition elimination reduces scanned data.

## 2) What is columnstore index?
Column-based storage, high compression, fast aggregations.

## 3) What are statistics?
Metadata about data distribution, helps query optimizer.

## 4) What is query pruning?
Skipping partitions/files based on filters.

## 5) Common DW optimization techniques
- partition by date
- columnstore
- pre-aggregations
- materialized views
- avoid SELECT *
- correct distribution key (MPP)

---
