# 02 - Databricks Clusters (Basics → Advanced)

Clusters are one of the most important Databricks topics for interviews and real work.

---

## 1) What is a Databricks Cluster?

A Databricks cluster is a group of machines (nodes) used to run Spark jobs.

It has:
- **Driver node** (runs your main program)
- **Worker nodes** (executors run tasks)

---

## 2) Types of Compute in Databricks

### 2.1 All-Purpose Cluster
Used for:
- interactive development
- notebook testing

### 2.2 Job Cluster
Used for:
- production jobs
- scheduled workflows

Best practice:
Use Job clusters for production because they:
- start when job runs
- terminate after completion
- save cost

### 2.3 SQL Warehouse
Used for:
- Databricks SQL queries
- dashboards
- BI tools

---

## 3) Cluster Modes

### 3.1 Single Node Cluster
- Driver = Worker (same machine)
- cheapest for learning
- good for small workloads

### 3.2 Multi Node Cluster
- Driver + multiple workers
- used for big datasets

---

## 4) Cluster Configuration (Must Know)

### 4.1 Databricks Runtime (DBR)
Databricks runtime includes:
- Spark version
- Delta version
- optimizations

Example:
DBR 14.x, 15.x etc.

---

### 4.2 Node Type
Node type defines:
- CPU
- RAM
- disk

Example:
Standard_D4_v2 (Azure)

---

### 4.3 Autoscaling
Autoscaling automatically increases/decreases worker nodes based on load.

Best for:
- unpredictable workloads
- streaming

---

### 4.4 Auto Termination
Automatically terminates cluster after idle time.

Must for cost saving.

---

## 5) Cluster Policies (Enterprise)
Cluster policies restrict:
- node types
- max workers
- runtime versions
Used in companies for cost control.

---

## 6) Spark Configs in Databricks

You can set configs:
- in notebook
- in cluster config

Common:
```python
spark.conf.set("spark.sql.shuffle.partitions", "50")
spark.conf.set("spark.sql.adaptive.enabled", "true")
```

---

## 7) Libraries on Clusters

You can install:
- PyPI libraries
- Maven libraries
- Wheel (.whl)

---

## 8) Photon (Databricks Performance Engine)
Photon is Databricks native execution engine.

Benefits:
- faster SQL queries
- faster Delta operations
- lower cost

---

## 9) Best Practices (Important)
- Use Job clusters for production
- Enable auto termination
- Use autoscaling carefully
- Keep DBR version stable
- Monitor cost and cluster utilization

---

## 10) Interview Questions (Must)

### Q1) Job cluster vs all-purpose cluster?
**Answer:**
- All-purpose: interactive
- Job cluster: production + cheaper

### Q2) Why auto termination?
**Answer:**
To avoid paying for idle clusters.

### Q3) What is Photon?
**Answer:**
Databricks engine for faster SQL/Delta.

---

## 11) Summary
Clusters run Spark in Databricks.
Understand compute types, DBR, autoscaling, and best practices.

---

✅ Next: `03_notebooks_basics.md`
