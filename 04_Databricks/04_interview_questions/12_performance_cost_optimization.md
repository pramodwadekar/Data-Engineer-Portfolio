# 12 - Performance + Cost Optimization (Interview Questions)

## 1) Biggest performance killers in Databricks?
- shuffle heavy joins
- data skew
- too many small files
- wrong partitioning
- unnecessary caching

---

## 2) How do you fix small files?
- OPTIMIZE
- Auto Optimize
- repartition before write

---

## 3) Broadcast join
Broadcast small table to avoid shuffle.

---

## 4) AQE (Adaptive Query Execution)
AQE optimizes:
- shuffle partitions
- skew joins
- join strategies

---

## 5) Partitioning best practice
Partition only when:
- frequent filtering on partition column
- large table

---

## 6) ZORDER usage
ZORDER improves data skipping for filter columns.

---

## 7) Explain plan
Use:
```python
df.explain("formatted")
```

---

## 8) Spark UI
Check:
- stages
- tasks
- shuffle read/write
- skewed partitions

---

## 9) Cost optimization tips
- job clusters
- auto-termination
- spot instances where safe
- warehouse auto-stop
- cluster policies

---

## 10) Interview scenario
**Q:** Pipeline cost is high. What do you do?  
**A:** job clusters + right sizing + optimize tables + reduce shuffle.

---

## 11) Must keywords for interview
- Photon
- OPTIMIZE
- ZORDER
- AQE
- broadcast
- small files
