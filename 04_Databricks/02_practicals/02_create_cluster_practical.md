# 02 - Create Cluster Practical (Databricks)

🎯 Goal: Create and configure a Databricks cluster properly (learning + production knowledge).

---

## ✅ What you will learn
- Create a cluster
- Choose runtime version
- Understand node types
- Enable autoscaling
- Enable auto termination
- Cluster mode (single node vs multi node)

---

## 1) Go to Compute
Left menu → **Compute**

Click:
**Create compute**

---

## 2) Cluster Type Selection

### Option A (Learning - Recommended)
Create a **Single Node Cluster**.

Why?
- cheapest
- fast
- perfect for practicals

---

## 3) Set Cluster Name
Example:
`learning-cluster`

---

## 4) Select Databricks Runtime (DBR)

Choose:
- latest stable runtime

Example:
- DBR 14.x / 15.x

---

## 5) Select Cluster Mode

### Single Node Mode
Enable:
- Single node
- Local mode

Used for:
- practice
- small ETL

---

## 6) Enable Auto Termination (Must)
Set:
- 15 minutes / 30 minutes

This avoids cost.

---

## 7) Enable Autoscaling (Optional)
Autoscaling is not needed for single node.

For multi-node:
- min workers: 1
- max workers: 4

---

## 8) Cluster Config (Optional)
Add these Spark configs (learning friendly):

```text
spark.sql.shuffle.partitions 8
spark.sql.adaptive.enabled true
```

---

## 9) Start Cluster
Click **Create cluster**

Wait until status becomes:
✅ Running

---

## 10) Validate Cluster from Notebook
Open notebook and run:

```python
spark.range(10).show()
```

---

## 11) Interview Talking Points
- Job clusters are best for production
- All-purpose clusters are for development
- Auto termination reduces cost
- DBR includes Spark + Delta + optimizations
- Photon improves SQL/Delta performance

---

## 12) Output
After this practical, you should be able to:
✅ create cluster  
✅ configure runtime + termination  
✅ attach notebook to cluster  

---

✅ Next: `03_notebook_basics_practical.md`
