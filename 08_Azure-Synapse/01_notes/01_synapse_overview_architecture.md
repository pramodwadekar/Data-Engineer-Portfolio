# 01 - Synapse Overview & Architecture

## What is Azure Synapse Analytics?
Azure Synapse is an analytics service that combines:
- Data integration (Synapse Pipelines)
- Enterprise Data Warehouse (Dedicated SQL pool)
- Big data processing (Spark pools)
- Serverless SQL analytics (Serverless SQL pool)

## Synapse Workspace components
- Synapse Studio
- SQL Pools:
  - Serverless SQL pool (built-in)
  - Dedicated SQL pool (provisioned)
- Spark Pools
- Pipelines
- Linked services
- Integration runtime (managed)
- Monitoring hub

## Typical DE architecture
ADLS Gen2 → Synapse (serverless exploration) → Dedicated DW / Delta curated → Power BI

---
