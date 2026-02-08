# 04 - Fact vs Dimension Questions (Interview Q&A)

## 1) What is a dimension table?
Descriptive attributes used for filtering/grouping.

## 2) What is a fact table?
Stores measures and foreign keys.

## 3) Fact table types?
- Transaction
- Snapshot
- Accumulating snapshot

## 4) Additive vs Semi-additive vs Non-additive?
- Additive: sum across all dims (sales)
- Semi-additive: bank balance (sum across customers, not time)
- Non-additive: ratios/percentages

## 5) Why keep fact table narrow?
- faster scans
- less storage
- better performance

---
