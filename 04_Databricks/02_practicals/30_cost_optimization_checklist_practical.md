# 30 - Cost Optimization Checklist Practical (Databricks)

🎯 Goal: Apply Databricks cost optimization in a real checklist style.

---

## ✅ What you will learn
- cluster sizing
- auto termination
- job cluster usage
- cost impact of bad Spark code
- SQL warehouse cost controls

---

## 1) Cluster Cost Checklist (Must)

### ✅ Auto Termination
Set to:
- 15 min / 30 min

### ✅ Use Job Clusters
For scheduled workflows.

### ✅ Right-size node type
- avoid huge nodes for small jobs

### ✅ Autoscaling (Use carefully)
- min 1
- max 4 (example)

---

## 2) Job Cost Checklist

### Reduce number of runs
- avoid running job every 5 minutes unless needed

### Use availableNow
For incremental ingestion.

### Avoid long-running streaming clusters
Prefer triggered pipelines.

---

## 3) Spark Code Cost Checklist

### Avoid unnecessary shuffles
- reduce groupBy on huge datasets
- broadcast small tables

### Reduce small files
- OPTIMIZE
- coalesce before writing

### Use AQE
```python
spark.conf.set("spark.sql.adaptive.enabled", "true")
```

---

## 4) Delta Cost Checklist
- OPTIMIZE on large tables
- VACUUM with safe retention
- ZORDER for filter columns

---

## 5) SQL Warehouse Cost Checklist
- enable auto stop
- right size
- avoid keeping warehouse running idle

---

## 6) Photon (If available)
Enable Photon for better cost/performance.

---

## 7) Practical Task
Go to your cluster and ensure:
- auto termination enabled
- correct runtime
- minimal workers for practice

---

## 8) Interview Talking Points
- cost optimization is not only compute, it is also Spark code quality
- job clusters + auto termination save most cost
- OPTIMIZE reduces metadata overhead

---

## 9) Output
After this practical:
✅ you can explain Databricks cost saving  
✅ you can apply real cost checklist  
✅ you understand cost + performance relation  

---

✅ Next: Bonus practicals 31-33
