# 21 - Databricks REST API Basics (Bonus)

Databricks provides REST APIs to automate:
- job creation
- job runs
- cluster management
- workspace file operations
- secret scopes
- Unity Catalog operations

---

## 1) Why REST API is useful?
In real companies, automation is needed for:
- DevOps
- CI/CD
- job monitoring
- platform management

---

## 2) What can be automated using REST API?
- Jobs create/update/run
- Cluster create/terminate
- Workspace import/export
- Secret scopes
- Permissions (UC)

---

## 3) Databricks Authentication
Common auth methods:
- Personal Access Token (PAT)
- Service Principal (recommended in enterprises)

---

## 4) Most Useful APIs for Data Engineers

### 4.1 Jobs API
- create job
- run job
- get run status

### 4.2 Clusters API
- list clusters
- create cluster
- terminate cluster

### 4.3 Workspace API
- import notebook
- export notebook

### 4.4 Unity Catalog API
- manage catalogs/schemas/tables (admin level)

---

## 5) Example Use Case
You want to trigger a workflow from ADF or Airflow.
You can call Databricks Jobs API to run a job.

---

## 6) Interview Questions
### Q1) How do you trigger Databricks job externally?
Using Jobs REST API.

### Q2) Why service principal?
More secure than PAT and supports automation.

---

## 7) Summary
REST API knowledge is a bonus skill for automation and DevOps integration.

---

✅ Next: `22_databricks_sql_warehouses_deep.md`
