# 01 — Basic Synapse Interview Questions (With Answers)

## 1) What is Azure Synapse Analytics?
**Answer:** A unified analytics service in Azure that combines:
- Data integration (pipelines)
- SQL data warehousing (dedicated SQL pool)
- Lake query (serverless SQL)
- Big data processing (Spark)
in one workspace.

---

## 2) What are the main components of Synapse?
**Answer:**
- Synapse Studio
- Dedicated SQL pool
- Serverless SQL pool
- Spark pools
- Synapse pipelines
- Linked services + Integration runtime

---

## 3) What is a Synapse Workspace?
**Answer:** A container that holds all Synapse artifacts like SQL scripts, notebooks, pipelines, datasets, and connections.

---

## 4) Dedicated SQL Pool vs Serverless SQL Pool?
**Answer:**
- Dedicated: provisioned MPP warehouse (pay for DWU)
- Serverless: query ADLS files (pay per TB scanned)

---

## 5) When do you use Serverless SQL pool?
**Answer:**
- Data exploration
- Ad-hoc reporting on ADLS
- External tables + CETAS curated layer
- Low-cost analytics

---

## 6) When do you use Dedicated SQL pool?
**Answer:**
- Enterprise BI dashboards
- High concurrency reporting
- Large structured star schemas
- Need consistent performance

---

## 7) What is ADLS Gen2 and why used with Synapse?
**Answer:** Azure Data Lake Storage Gen2 is the standard storage for Synapse.
It supports hierarchical namespace, ACLs, and is optimized for analytics.

---

## 8) What is OPENROWSET?
**Answer:** A serverless SQL function to read files (Parquet/CSV/JSON) directly from ADLS without loading.

---

## 9) What is an external table in Synapse?
**Answer:** Metadata defined in SQL that points to files in ADLS. It allows querying files like a table.

---

## 10) What is CETAS?
**Answer:** Create External Table As Select.
It creates a new external table and writes query results as parquet files in ADLS.

---

## 11) What is COPY INTO?
**Answer:** A bulk loading command used mainly in Dedicated SQL pool to load data from ADLS into internal tables.

---

## 12) What is PolyBase?
**Answer:** A feature to load data into Dedicated SQL pool using external tables and external data sources.

---

## 13) What is a Spark pool in Synapse?
**Answer:** Managed Spark cluster inside Synapse for ETL, Delta Lake, notebooks, ML.

---

## 14) Synapse pipelines vs ADF?
**Answer:** Synapse pipelines are essentially ADF capabilities embedded inside Synapse workspace.

---

## 15) What is Managed Identity?
**Answer:** An Azure identity automatically created for the Synapse workspace that can be used to access other services securely without storing passwords.

---

## 16) RBAC vs ACL in ADLS?
**Answer:**
- RBAC: Azure role-based access at storage account level
- ACL: filesystem permissions at folder/file level
Both are needed.

---

## 17) What is a linked service?
**Answer:** A connection definition to external services (ADLS, SQL DB, Key Vault, etc).

---

## 18) What is the most common Synapse production issue?
**Answer:** Permissions (RBAC + ACL mismatch) and networking restrictions.

---

## 19) How does serverless SQL pricing work?
**Answer:** It charges based on data scanned (per TB scanned).

---

## 20) How does dedicated SQL pool pricing work?
**Answer:** It charges based on provisioned compute (DWU) while running.
