# 00 - Introduction to Azure Data Factory (ADF)

## What is Azure Data Factory?
Azure Data Factory (ADF) is a **cloud ETL/ELT orchestration service** used to:
- ingest data from multiple sources
- move data between systems
- schedule and orchestrate pipelines
- trigger Databricks / Synapse / SQL workloads

ADF is NOT a data processing engine like Spark.
ADF is mainly an **orchestrator + data movement tool**.

---

## Why ADF is important for Data Engineers?
Because in real companies:
- you don’t run notebooks manually
- pipelines must run daily/hourly
- failures must be handled
- monitoring is mandatory

ADF is used for:
- Batch ingestion pipelines
- Incremental load pipelines
- Orchestrating Databricks jobs
- Data warehouse loading

---

## ADF vs Databricks
### Databricks
- processes large data
- Spark engine
- transformations + ETL logic

### ADF
- orchestration
- scheduling
- copy activity (movement)
- triggers Databricks / SQL scripts

**Best practice:**  
ADF orchestrates, Databricks transforms.

---

## ADF vs SSIS
- SSIS = on-prem ETL tool
- ADF = cloud-native ETL/orchestration

ADF is more scalable and integrates with Azure services.

---

## Key ADF Concepts (must know words)
- Pipeline
- Activity
- Trigger
- Linked Service
- Dataset
- Integration Runtime
- Parameters & Variables
- Expressions
- Copy Activity
- Mapping Data Flow
- Monitor

---

## Real-world example
Daily pipeline:
1. Copy raw files from SFTP → ADLS (Bronze)
2. Trigger Databricks notebook (Silver/Gold)
3. Load Gold into SQL Warehouse
4. Send failure alert to teams

---

## Interview Tip
If you say this line confidently, interviewer is impressed:
> “ADF is mainly an orchestrator. For heavy transformations we use Databricks/Spark.
> ADF is used for scheduling, movement, monitoring, and integration.”
