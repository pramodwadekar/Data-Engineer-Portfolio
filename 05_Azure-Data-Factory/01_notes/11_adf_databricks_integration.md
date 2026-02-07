# 11 - ADF + Databricks Integration (Must for DE)

## 1) Why integrate ADF with Databricks?
ADF orchestrates, Databricks transforms.

ADF triggers:
- notebooks
- jobs
- clusters

---

## 2) How ADF triggers Databricks?
Options:
- Databricks Notebook Activity
- Databricks Jar Activity
- Databricks Python Activity

---

## 3) Linked Service for Databricks
Authentication:
- PAT token (simple, not best)
- Service principal (enterprise)

---

## 4) Passing parameters
ADF passes notebook parameters:
- run_date
- table_name
- batch_id

---

## 5) Common Interview Questions
### Q1: How to orchestrate Databricks from ADF?
Use Databricks notebook activity.

### Q2: How to secure Databricks token?
Use Key Vault.

---

## 6) Best Practices
- ADF handles scheduling
- Databricks handles transformations
- store tokens in Key Vault
- use job clusters
