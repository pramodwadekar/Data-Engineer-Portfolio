# 01 - Databricks Workspace Overview

This note explains the Databricks Workspace and the main UI components a Data Engineer uses daily.

---

## 1) What is Databricks Workspace?

Workspace is the main UI where you manage:
- Notebooks
- Repos
- SQL queries
- Dashboards
- Jobs & Workflows
- Data Explorer (catalogs/tables)
- Compute (clusters/warehouses)

---

## 2) Important Workspace Sections (Must Know)

### 2.1 Home
- Quick access
- Recently used notebooks/jobs

### 2.2 Workspace
Where you create folders for:
- notebooks
- SQL files
- shared team code

### 2.3 Repos
Git integration.
You can link:
- GitHub
- Azure DevOps
- GitLab
- Bitbucket

### 2.4 Data (Data Explorer)
Where you can browse:
- catalogs
- schemas
- tables
- volumes (Unity Catalog)
- lineage

### 2.5 SQL
Databricks SQL editor for:
- queries
- dashboards
- warehouses

### 2.6 Workflows
Used to create:
- Jobs
- Job tasks
- scheduling

### 2.7 Compute
Used to create:
- clusters
- SQL warehouses

---

## 3) Workspace Folder Best Practices

Recommended structure for Data Engineering:
```
/Workspace/
  /Users/<your_email>/
    /01_learning/
    /02_practicals/
    /03_projects/
    /04_jobs/
```

---

## 4) Notebooks in Workspace

Databricks notebooks support:
- Python
- SQL
- Scala
- R

Notebook types:
- Interactive notebooks (development)
- Job notebooks (production tasks)

---

## 5) Data Explorer (Important for Unity Catalog)

You can check:
- who owns the table
- table schema
- sample data
- permissions
- lineage
- table history (Delta)

---

## 6) SQL Editor in Workspace

Used for:
- writing SQL queries
- creating dashboards
- running queries on SQL Warehouse

---

## 7) Workflows UI

Workflows allow:
- multiple tasks in one pipeline
- dependencies
- retry policies
- alerts

---

## 8) Common Interview Questions

### Q1) What is the difference between Workspace and DBFS?
**Answer:**
- Workspace = notebooks/code UI
- DBFS = file storage layer

### Q2) Where do you store raw data?
**Answer:**
Not inside workspace.
Raw data should be stored in cloud storage (ADLS/S3) and accessed by Databricks.

---

## 9) Summary
- Workspace is the UI environment
- Key areas: Repos, Data, SQL, Workflows, Compute
- Use clean folder structure for projects

---

✅ Next: `02_clusters_basics.md`
