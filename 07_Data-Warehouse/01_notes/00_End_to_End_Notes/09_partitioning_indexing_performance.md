# 09 — Partitioning, Indexing, Clustering & Performance (Warehouse)

## 1) Why performance tuning matters?
Warehouse queries often scan TBs of data.
Without optimization:
- High cost
- Slow dashboards
- Timeouts

---

## 2) Partitioning
Partitioning splits table into smaller chunks.

### Common partition keys
- date
- region
- customer_segment

### Benefits
✅ Partition pruning reduces scan  
✅ Faster queries  
✅ Better manageability  

### Bad partitioning
If partition key has too many distinct values (high cardinality):
- too many small partitions
- overhead increases

---

## 3) Indexing (Warehouse context)
Traditional indexes:
- B-Tree
- Clustered index
- Non-clustered

But modern warehouses rely more on:
- columnar storage
- metadata pruning
- clustering keys

---

## 4) Columnstore / Columnar storage
Warehouse tables often stored column-wise:
- faster aggregations
- better compression

Examples:
- Synapse columnstore index
- Redshift columnar
- Snowflake micro-partitions

---

## 5) Distribution (MPP systems)
In MPP warehouses (Synapse Dedicated):
Data distributed across nodes.

Distribution types:
- Hash distribution
- Round robin
- Replicated

Goal:
- reduce data movement

---

## 6) Common performance issues
- Too many joins on large tables
- No partition pruning
- Wrong grain
- High-cardinality group by
- Skewed distribution keys

---

## 7) Best practices
- Partition on date
- Use surrogate keys
- Keep facts narrow
- Pre-aggregate for dashboards
- Avoid SELECT *

---

## 8) Interview questions
- What is partitioning?
- Hash vs round robin distribution?
- Columnstore index?
