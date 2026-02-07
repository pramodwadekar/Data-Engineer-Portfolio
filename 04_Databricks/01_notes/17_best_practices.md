# 17 - Databricks Best Practices (Production Ready)

This note contains best practices that make you look strong in interviews and help in real production work.

---

## 1) Workspace & Repo Best Practices

### ✅ Use Repos for code
- Always keep production notebooks inside Git repos
- Avoid keeping important code only in Workspace folders

### ✅ Clean folder structure
Recommended:
```
/notebooks/bronze
/notebooks/silver
/notebooks/gold
/src
/docs
/tests
```

---

## 2) Cluster Best Practices

### ✅ Use Job Clusters for production
- cheaper
- auto terminate
- isolated

### ✅ Enable auto termination
Never leave clusters running idle.

### ✅ Use stable DBR
Avoid frequent runtime upgrades without testing.

---

## 3) Data Storage Best Practices

### ✅ Use Delta format
For all pipeline tables.

### ✅ Avoid too many partitions
Partition only when needed.

### ✅ Solve small files problem
- OPTIMIZE
- coalesce before write
- avoid writing tiny batches frequently

---

## 4) Lakehouse Architecture Best Practices

### Bronze
- raw data
- minimal changes
- store bad records in rescue column/quarantine

### Silver
- cleaned + standardized
- deduplicated
- correct datatypes

### Gold
- business KPIs
- aggregates
- reporting-ready tables

---

## 5) Orchestration Best Practices

### Jobs & Workflows
- one task = one responsibility
- use task dependencies
- retries + alerts
- parameterize with widgets

---

## 6) Security Best Practices

### Secrets
- never hardcode credentials
- use Key Vault backed scopes

### Unity Catalog
- use groups, not individuals
- least privilege
- separate catalogs for environments

---

## 7) Monitoring Best Practices

### Audit Tables
Always store:
- row counts
- bad record counts
- pipeline run status
- batch_id

### Logging
Use structured logging in notebooks.

---

## 8) Performance Best Practices

- broadcast small tables
- avoid unnecessary shuffles
- use AQE
- use ZORDER for filter columns
- check execution plan

---

## 9) Cost Best Practices

- job clusters + auto termination
- correct node type
- Photon for SQL/Delta workloads
- schedule jobs efficiently

---

## 10) Summary
Databricks best practices = clean code + secure data + optimized compute + governed access.

---

✅ Next: `18_common_errors_debugging.md`
