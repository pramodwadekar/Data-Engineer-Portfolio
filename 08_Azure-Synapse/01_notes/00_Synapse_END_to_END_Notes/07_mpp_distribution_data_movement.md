# 07 — MPP Architecture, Distribution & Data Movement (Dedicated SQL Pool)

## What is MPP?
Massively Parallel Processing.
Data is distributed across compute nodes.

---

## Distribution types
### 1) Hash distributed
Best for large fact tables.

### 2) Round-robin
Good for staging tables.

### 3) Replicated
Best for small dimensions.

---

## Data movement
Occurs when:
- joining tables with different distribution keys
- aggregations require shuffling

Data movement is expensive.

---

## Choosing distribution keys
Pick column that:
- high cardinality
- evenly distributed
- used frequently in joins

Avoid:
- low cardinality columns (status, country)

---

## Interview questions
- What is data skew?
- How to fix skew?
- Hash vs replicated?
