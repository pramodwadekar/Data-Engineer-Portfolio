# 00 - Azure Data Factory (ADF) Resources (Basic → Advanced)

This resource list is curated for **Data Engineering roles** and covers Azure Data Factory from **Basic → Advanced**.

✅ Best for:
- ADF Developer
- Data Engineer (Azure)
- ADF + Databricks Orchestration roles

---

## ⭐ 1) Official Microsoft Documentation (Must)

### ADF Main Docs
- Azure Data Factory Documentation  
  https://learn.microsoft.com/en-us/azure/data-factory/

### Core Concepts
- Pipelines and activities  
  https://learn.microsoft.com/en-us/azure/data-factory/concepts-pipelines-activities
- Linked services  
  https://learn.microsoft.com/en-us/azure/data-factory/concepts-linked-services
- Datasets  
  https://learn.microsoft.com/en-us/azure/data-factory/concepts-datasets-linked-services
- Integration Runtime (very important)  
  https://learn.microsoft.com/en-us/azure/data-factory/concepts-integration-runtime

### Copy Activity (Most Important)
- Copy activity overview  
  https://learn.microsoft.com/en-us/azure/data-factory/copy-activity-overview

### Triggers
- Triggers and scheduling  
  https://learn.microsoft.com/en-us/azure/data-factory/concepts-pipeline-execution-triggers

### Monitoring
- Monitor pipeline runs  
  https://learn.microsoft.com/en-us/azure/data-factory/monitor-visually

---

## 📘 2) Microsoft Learn (Free + Best Structured)

### Beginner
- Introduction to Azure Data Factory  
  https://learn.microsoft.com/en-us/training/modules/introduction-to-azure-data-factory/

### Intermediate
- Ingest and load data using Azure Data Factory  
  https://learn.microsoft.com/en-us/training/modules/ingest-data-with-azure-data-factory/

### Advanced Path
- Build data integration solutions with Azure Data Factory  
  https://learn.microsoft.com/en-us/training/paths/build-data-integration-solutions-azure-data-factory/

---

## 🎥 3) Best YouTube Playlists (Free)

> Note: YouTube content changes often, so I am sharing stable, high-quality channels/playlists.

### Full ADF Course (Beginner → Advanced)
- Azure Data Factory Full Course By (ansh lamba)
  https://www.youtube.com/watch?v=8zIVOdKyoDA

- Azure Data Factory Full Course By (learn by doing it)
  https://www.youtube.com/watch?v=DnsGmAJBuZM
  
- Azure Data Factory Full Course (Search)  
  https://www.youtube.com/results?search_query=azure+data+factory+full+course

### Incremental Load (Watermark Pattern)
- ADF incremental load watermark (Search)  
  https://www.youtube.com/results?search_query=adf+incremental+load+watermark

### ADF Expressions + Dynamic Content
- ADF expressions tutorial (Search)  
  https://www.youtube.com/results?search_query=adf+dynamic+content+expressions

### ADF + Databricks Integration
- ADF Databricks notebook activity (Search)  
  https://www.youtube.com/results?search_query=adf+databricks+notebook+activity

### ADF Interview Questions
- ADF interview questions (Search)  
  https://www.youtube.com/results?search_query=azure+data+factory+interview+questions

---

## 🧾 4) ADF Expressions (Most Important Topic)

### Official Expression Language
- Expressions and functions  
  https://learn.microsoft.com/en-us/azure/data-factory/control-flow-expression-language-functions

### Variables & Parameters
- Variables  
  https://learn.microsoft.com/en-us/azure/data-factory/control-flow-variables
- Parameters  
  https://learn.microsoft.com/en-us/azure/data-factory/parameters

---

## 🔥 5) Incremental Load & Real Patterns (Must)

### Watermark Pattern (Official)
- Incremental copy using watermark  
  https://learn.microsoft.com/en-us/azure/data-factory/tutorial-incremental-copy-overview

### Change Data Capture (CDC) Concepts
- CDC overview (SQL Server)  
  https://learn.microsoft.com/en-us/sql/relational-databases/track-changes/about-change-data-capture-sql-server

---

## 🧠 6) ADF + Databricks Orchestration (Must for DE)

### Databricks Activity in ADF
- Transform data by running a Databricks notebook  
  https://learn.microsoft.com/en-us/azure/data-factory/transform-data-using-databricks-notebook

### Azure Databricks Linked Service
- Compute linked services  
  https://learn.microsoft.com/en-us/azure/data-factory/compute-linked-services

---

## 🧪 7) Mapping Data Flows (Optional but Interviewable)

### Official Docs
- Mapping data flows overview  
  https://learn.microsoft.com/en-us/azure/data-factory/concepts-data-flow-overview

### When to use Data Flow?
Use Data Flow when:
- you need GUI-based transformations
- you don’t want to write Spark code

Avoid Data Flow when:
- transformations are complex
- you already have Databricks / PySpark pipelines

---

## 🧰 8) Integration Runtime (IR) Deep Dive (Very Important)

### Official Docs
- Integration runtime  
  https://learn.microsoft.com/en-us/azure/data-factory/concepts-integration-runtime
- Self-hosted IR  
  https://learn.microsoft.com/en-us/azure/data-factory/create-self-hosted-integration-runtime

---

## 🛡️ 9) Security + Secrets (Must)

### Managed Identity
- Managed identity in ADF  
  https://learn.microsoft.com/en-us/azure/data-factory/data-factory-service-identity

### Azure Key Vault integration
- Store credentials in Key Vault  
  https://learn.microsoft.com/en-us/azure/data-factory/store-credentials-in-key-vault

---

## 🚀 10) CI/CD for ADF (Advanced + Real Company Work)

### Official CI/CD Docs
- CI/CD overview  
  https://learn.microsoft.com/en-us/azure/data-factory/continuous-integration-delivery

### ARM Templates
- ARM template deployment  
  https://learn.microsoft.com/en-us/azure/data-factory/continuous-integration-delivery-improvements

---

## 📊 11) Monitoring + Debugging (Production)

### Monitoring
- Monitor pipeline runs  
  https://learn.microsoft.com/en-us/azure/data-factory/monitor-visually

### Troubleshooting
- Troubleshoot ADF  
  https://learn.microsoft.com/en-us/azure/data-factory/data-factory-troubleshoot-guide

---

## 🧩 12) Project Templates (GitHub)

> Useful to see real pipelines.

- Search: ADF pipeline templates  
  https://github.com/search?q=azure+data+factory+pipeline+template&type=repositories

- Search: ADF incremental load  
  https://github.com/search?q=azure+data+factory+incremental+load&type=repositories

---

## 🎯 13) What You MUST Master (Interview Checklist)

### ADF Core
- Pipeline, Activity, Trigger
- Linked service, Dataset
- Integration Runtime
- Copy activity

### Real Data Engineering
- Parameterization
- Dynamic pipelines
- Incremental load (watermark)
- Error handling + retries
- Monitoring + alerts
- ADF → Databricks orchestration

### Advanced
- Metadata-driven pipelines
- CI/CD deployment
- Self-hosted IR

---

## ✅ Suggested Learning Order (Best Path)

1. ADF UI basics + first pipeline  
2. Copy Activity (CSV → ADLS → SQL)  
3. Parameters + Variables + Expressions  
4. Triggers + Scheduling  
5. Incremental load (watermark)  
6. ADF + Databricks notebook activity  
7. Metadata-driven pipeline  
8. Error handling + monitoring  
9. CI/CD deployment  
10. Interview revision

---

## 🔥 Final Interview Tip
If you can explain these 3 confidently, you will crack most ADF interviews:
1) **Watermark incremental pipeline**  
2) **Metadata-driven pipeline**  
3) **ADF + Databricks orchestration**

---
