# 11 - ADF + Databricks Integration (Interview Questions)

## 1) How does ADF trigger Databricks?
- Databricks notebook activity
- Databricks jar activity
- Databricks python activity

---

## 2) What auth methods?
- PAT token (simple)
- Service principal (enterprise)

---

## 3) How do you pass parameters?
Use base parameters.

---

## 4) How to return output from Databricks?
Use:
```python
dbutils.notebook.exit("SUCCESS")
```

ADF reads runOutput.

---

## 5) Why use job clusters?
Cheaper + isolated + reproducible.

---

## 6) Interview scenario
**Q:** How do you orchestrate bronze-silver-gold?
A: ADF triggers Databricks notebooks/jobs sequentially.

---

## 7) Best practices
- secrets in Key Vault
- job clusters for prod
- audit logging
