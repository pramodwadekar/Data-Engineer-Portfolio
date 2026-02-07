# 00 - Databricks Introduction (Must)

This note explains **what Databricks is**, why it is used in Data Engineering, and how it fits with Spark + Delta Lake.

---

## 1) What is Databricks?

Databricks is a **cloud-based data platform** built on top of Apache Spark.

It provides an end-to-end environment for:
- Data Engineering (ETL, pipelines)
- Data Analytics (SQL, dashboards)
- Machine Learning (MLflow, training)
- Governance (Unity Catalog)
- Orchestration (Jobs & Workflows)

---

## 2) Why Databricks is popular for Data Engineers?

Because it solves the biggest problems in real projects:

### ✅ 1) Distributed processing (Spark)
- Can process TBs of data
- Works on clusters automatically

### ✅ 2) Reliable storage layer (Delta Lake)
- ACID transactions
- MERGE (upsert)
- time travel
- schema enforcement

### ✅ 3) Simple development
- Notebooks
- SQL editor
- Collaborative environment

### ✅ 4) Production features
- job scheduling
- monitoring
- access control
- cost optimization

---

## 3) Databricks vs Apache Spark (Important)

### Apache Spark
- Open-source compute engine
- You install it and manage everything yourself

### Databricks
- Managed Spark platform
- Provides:
  - cluster management
  - notebooks
  - Delta Lake
  - workflows
  - governance
  - integrations

---

## 4) Databricks Lakehouse Concept

### Data Warehouse problems
- expensive
- rigid
- hard to scale

### Data Lake problems
- no transactions
- no schema enforcement
- difficult for BI

### Lakehouse = Best of both
Databricks lakehouse gives:
- Data lake storage (cheap)
- Data warehouse performance (fast)
- Governance (Unity Catalog)
- ACID (Delta)

---

## 5) Databricks Core Components (Must Know)

### 1) Workspace
Where you create:
- notebooks
- SQL queries
- dashboards
- jobs

### 2) Clusters / Compute
Where Spark actually runs.

### 3) Storage
Data is stored in:
- ADLS (Azure)
- S3 (AWS)
- GCS (Google)

### 4) Delta Lake
Storage format for reliable pipelines.

### 5) Databricks SQL
For analytics + reporting.

### 6) Unity Catalog
For:
- governance
- permissions
- lineage
- audit

### 7) Jobs / Workflows
For orchestration.

---

## 6) Databricks for Data Engineering (Real Use)

Typical DE pipeline:

1) Source data arrives (CSV/JSON/Parquet/Kafka)
2) Databricks ingests using:
   - Auto Loader
   - batch read
   - streaming
3) Store in Delta (Bronze)
4) Clean + standardize (Silver)
5) Business aggregations (Gold)
6) Run using Jobs / Workflows
7) Govern using Unity Catalog
8) Optimize using:
   - OPTIMIZE
   - ZORDER
   - caching
   - AQE

---

## 7) What you must learn in Databricks (Interview)

### Core
- clusters
- notebooks
- DBFS
- repos
- jobs
- widgets
- Delta

### Must for Databricks DE role
- Unity Catalog
- Auto Loader
- Delta Live Tables (DLT)
- monitoring + cost

---

## 8) Summary

- Databricks is a managed Spark + Delta platform
- It is used for production-grade Data Engineering
- Lakehouse architecture is the key concept
- Databricks adds governance + orchestration + monitoring

---

✅ Next: `01_workspace_overview.md`
