# 13 - Security, Secrets, Service Principal (Interview Questions)

## 1) How do you store secrets in Databricks?
Use:
- Databricks Secret Scopes
- Azure Key Vault backed scopes (preferred)

---

## 2) Why not store secrets in notebooks?
Because notebooks are:
- visible
- versioned
- insecure

---

## 3) What is a Secret Scope?
A logical container for secrets.

---

## 4) How do you access secrets?
```python
dbutils.secrets.get(scope="my_scope", key="sp_client_secret")
```

---

## 5) What is a Service Principal?
A non-human identity used for:
- production jobs
- CI/CD
- automation

---

## 6) PAT vs Service Principal
- PAT: personal token (not best for prod)
- SP: enterprise identity (best)

---

## 7) Unity Catalog security model
- grants to groups
- least privilege
- audit logs

---

## 8) Common interview scenario
**Q:** How do you connect to ADLS securely?  
**A:** Use service principal + secret scope + external location.

---

## 9) Best practices
- rotate secrets
- use group-based grants
- avoid personal tokens for production
