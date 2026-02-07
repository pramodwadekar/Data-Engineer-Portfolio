# 12 - Mapping Data Flows (Interview Questions)

## 1) What is Mapping Data Flow?
GUI-based transformation in ADF running on Spark.

---

## 2) Data Flow vs Copy Activity?
- Copy: movement
- Data Flow: transformations

---

## 3) Data Flow vs Databricks?
Databricks is more powerful.
Data Flow is used when no-code transformation is needed.

---

## 4) When NOT to use Data Flow?
- complex transformations
- large enterprise pipelines already using Databricks

---

## 5) Interview scenario
**Q:** Data Flow runs on what?
A: ADF-managed Spark cluster.

---

## 6) Best practices
- keep data flows simple
- monitor cost (spark cluster spins up)
