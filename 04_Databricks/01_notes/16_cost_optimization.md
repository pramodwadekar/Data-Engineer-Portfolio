# 16 - Databricks Cost Optimization (Must)

Cost optimization is a very important topic in Databricks interviews.

---

## 1) Why cost optimization matters?
Databricks billing is mainly based on:
- DBUs (Databricks Units)
- cloud compute cost

If clusters are idle or over-sized → huge cost.

---

## 2) Biggest Cost Drivers
- long running clusters
- large node types
- too many workers
- inefficient Spark jobs (huge shuffle)
- writing too many small files

---

## 3) Best Practices for Cost Saving

### 3.1 Use Job Clusters
Job clusters terminate after run.

### 3.2 Enable Auto Termination
Avoid paying for idle compute.

### 3.3 Right-size Clusters
Do not use huge clusters for small jobs.

### 3.4 Use Autoscaling Carefully
Autoscaling helps but can also increase cost if misused.

### 3.5 Optimize Delta Tables
- OPTIMIZE
- ZORDER
- avoid small files

### 3.6 Reduce Shuffle
- broadcast joins
- correct partitions
- AQE enabled

### 3.7 Use Photon
Photon improves performance and reduces cost.

---

## 4) Cost Optimization in Jobs
- schedule off-peak hours
- run only required tasks
- avoid frequent triggers

---

## 5) SQL Warehouse Cost
Use:
- auto stop
- serverless (if available)
- correct size

---

## 6) Interview Questions
### Q1) How to reduce Databricks cost?
Use job clusters + auto termination + optimize Spark.

### Q2) What is Photon benefit?
Faster queries and lower DBU usage.

---

## 7) Summary
Cost optimization is a mix of:
- compute management
- Spark optimization
- Delta optimization

---

✅ Next: `17_best_practices.md`
