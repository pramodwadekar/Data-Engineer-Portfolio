# 02 - Clusters & Compute (Interview Questions)

## 1) What is a cluster in Databricks?
A Spark compute environment with:
- driver node
- worker nodes

---

## 2) Driver vs Worker
- Driver: runs your main program, schedules tasks
- Worker: executes tasks on partitions

---

## 3) All-purpose cluster vs Job cluster
**All-purpose:**
- interactive notebooks
- shared by users

**Job cluster:**
- created for a job run
- terminated after completion
- best for production (cost + isolation)

---

## 4) What is autoscaling?
Databricks can automatically add/remove worker nodes based on load.

---

## 5) What is auto-termination?
Automatically shuts down idle clusters to save cost.

---

## 6) What is cluster policy?
A governance feature that restricts:
- node types
- max workers
- DBR versions
- security settings

---

## 7) What is a node type?
The VM instance type (CPU/RAM).

---

## 8) How do you choose cluster size?
Based on:
- data size
- transformations (shuffle heavy?)
- join type
- SLA requirement

---

## 9) What is DBU?
Databricks Unit = billing metric for compute usage.

---

## 10) Spot vs On-demand nodes?
- Spot: cheaper, can be interrupted
- On-demand: stable, expensive

---

## 11) What is a pool?
Instance pools reduce cluster start time by keeping pre-warmed VMs.

---

## 12) Cluster modes
- Standard
- High Concurrency (for SQL/BI)
- Single Node (learning)

---

## 13) What is Photon runtime?
DBR option that accelerates SQL and Delta workloads.

---

## 14) Production best practices
- use job clusters
- enable auto-termination
- use cluster policies
- use pools if needed

---

## 15) Common scenario
**Q:** Job is slow, what do you check first?  
**A:** Spark UI → stages → shuffle → skew → partitions → join strategy.
