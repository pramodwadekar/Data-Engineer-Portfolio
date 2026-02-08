# 01 — Azure Synapse Overview & Components

## What is Azure Synapse Analytics?
Azure Synapse Analytics is Microsoft’s unified analytics service that combines:
- Data integration (pipelines)
- Data warehousing (SQL pools)
- Big data analytics (Spark)
- Data exploration (serverless SQL)
- Studio UI for everything

Think of Synapse as:
**ADF + SQL DW + Spark + Studio** in one workspace.

---

## Why companies use Synapse
- End-to-end analytics platform in Azure
- Tight integration with ADLS, Power BI, ADF, Purview
- Supports both traditional DWH and lake-based analytics

---

## Synapse Workspace Components
### 1) Synapse Studio
Web UI where you manage:
- SQL scripts
- Notebooks
- Pipelines
- Linked services
- Datasets
- Monitoring

### 2) SQL Pools
Two types:
- Dedicated SQL pool (provisioned, MPP)
- Serverless SQL pool (pay per TB scanned)

### 3) Spark Pools
Managed Spark clusters for:
- ETL
- Delta Lake
- ML
- notebooks

### 4) Synapse Pipelines
ADF-like orchestration inside Synapse.

### 5) Integration Runtime
Used for:
- data movement
- connecting to sources

---

## Key Interview Statement
Synapse is not just a warehouse.
It is a unified analytics workspace.

---

## When NOT to use Synapse
- If you only need storage → ADLS
- If you only need orchestration → ADF
- If you need heavy Spark at scale → Databricks is often better
