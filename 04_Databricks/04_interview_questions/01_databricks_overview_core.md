# 01 - Databricks Overview + Core Concepts (Interview Questions)

## 1) What is Databricks?
Databricks is a cloud-based data platform built on Apache Spark that provides:
- scalable compute (clusters)
- notebooks for development
- Delta Lake for reliable storage
- jobs/workflows for orchestration
- Unity Catalog for governance

---

## 2) Why companies use Databricks?
- Handles big data + ETL at scale
- Lakehouse architecture (Data Lake + Warehouse)
- Faster Spark execution + managed platform
- Built-in collaboration + scheduling

---

## 3) What is Lakehouse?
Lakehouse = Data Lake + Data Warehouse features together:
- cheap storage (data lake)
- ACID + performance (warehouse-like)

Delta Lake is the key technology.

---

## 4) Databricks vs Hadoop?
- Hadoop: disk-based MapReduce, slower
- Databricks/Spark: in-memory processing, faster, interactive

---

## 5) Databricks vs Snowflake?
- Snowflake: pure warehouse
- Databricks: lakehouse + ML + streaming + Spark workloads

---

## 6) Databricks Architecture (high level)
- Workspace (UI)
- Cluster (compute)
- Storage (ADLS/S3/GCS)
- Delta tables
- UC governance layer

---

## 7) What is a Databricks workspace?
A workspace is a logical environment where you manage:
- notebooks
- clusters
- jobs
- tables
- permissions

---

## 8) What is Databricks Runtime (DBR)?
DBR is Databricks’ Spark distribution including:
- Spark version
- Delta Lake
- optimizations
- libraries

---

## 9) What is Photon?
Photon is a vectorized query engine that speeds up SQL workloads.
It improves performance for:
- Databricks SQL
- Delta queries
- large joins/aggregations

---

## 10) What is a cluster?
A cluster is a set of compute machines (nodes) used to run Spark jobs.

---

## 11) What are the two main cluster types?
- All-purpose cluster (interactive)
- Job cluster (ephemeral, recommended for production jobs)

---

## 12) Databricks key services for DE
- Delta Lake
- Unity Catalog
- Workflows (Jobs)
- Auto Loader
- Structured Streaming
- DLT
- Databricks SQL

---

## 13) Common interview follow-up
**Q:** Do you need Spark knowledge for Databricks?  
**A:** Yes, Databricks is Spark-based, so Spark fundamentals are mandatory.

---

## 14) Real-world usage example
Typical pipeline:
- ingest raw → bronze delta
- clean → silver delta
- aggregate → gold delta
- serve → SQL warehouse dashboard

---

## 15) What makes Databricks “enterprise ready”?
- governance (Unity Catalog)
- security (secrets, SP)
- monitoring (job runs, logs)
- performance (Photon, AQE, OPTIMIZE)
