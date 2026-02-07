# 10 - Security (Key Vault, Managed Identity) (Interview Questions)

## 1) How do you store credentials securely?
Use Azure Key Vault linked service.

---

## 2) Why not store secrets in pipeline?
Insecure, visible, not rotatable.

---

## 3) What is Managed Identity?
An Azure identity for ADF used to access resources without passwords.

---

## 4) How to access ADLS securely?
Grant ADF managed identity access to ADLS container.

---

## 5) Key Vault vs Managed Identity?
- MI = identity
- KV = secret storage

---

## 6) Interview scenario
**Q:** How do you store Databricks token?
A: Key Vault secret.

---

## 7) Best practices
- least privilege
- rotate secrets
- use MI whenever possible
