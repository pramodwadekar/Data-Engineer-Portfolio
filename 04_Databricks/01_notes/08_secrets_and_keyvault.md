# 08 - Databricks Secrets + Azure Key Vault (Must)

This note explains how to securely store and use secrets in Databricks.

---

## 1) What are Secrets?
Secrets are sensitive values like:
- storage account keys
- database passwords
- tokens
- client secrets

---

## 2) Why Secrets are mandatory in production?
Never hardcode credentials in:
- notebooks
- source code
- configs

Hardcoding is a security risk.

---

## 3) Databricks Secret Scope
Secrets are stored inside a **Secret Scope**.

Example scope:
- `kv_scope`
- `prod_scope`

---

## 4) How to Create Secret Scope?

### Option 1: Databricks-backed secret scope
- secrets stored in Databricks

### Option 2: Azure Key Vault-backed scope (Recommended)
- secrets stored in Azure Key Vault
- Databricks only accesses them

---

## 5) Accessing Secrets in Notebook
```python
storage_key = dbutils.secrets.get(scope="kv_scope", key="adls_key")
```

---

## 6) Using Secrets for ADLS Access (Example)

```python
spark.conf.set(
  "fs.azure.account.key.<storage>.dfs.core.windows.net",
  dbutils.secrets.get("kv_scope","adls_key")
)
```

---

## 7) Secrets Best Practices
- use Key Vault integration
- use different scopes for dev/qa/prod
- restrict access
- rotate secrets

---

## 8) Common Interview Questions

### Q1) How do you store secrets in Databricks?
Using Secret Scopes (preferably Key Vault-backed).

### Q2) Why Key Vault integration?
Because secrets remain in Key Vault and are managed securely.

---

## 9) Summary
Secrets + Key Vault = secure production pipelines.

---

✅ Next: `09_jobs_workflows_basics.md`
