# 13 - Security (Key Vault, Managed Identity)

## 1) Why security matters?
ADF connects to:
- databases
- storage
- Databricks
So credentials must be secure.

---

## 2) Managed Identity
ADF has a system-assigned identity.

Use it to:
- access ADLS
- access Key Vault
without storing secrets.

---

## 3) Key Vault Integration
Store:
- SQL passwords
- Databricks token
- API keys

ADF reads secrets dynamically.

---

## 4) Common Interview Questions
### Q1: How do you store credentials securely?
Key Vault.

### Q2: What is managed identity?
An Azure identity used for secure access without secrets.

---

## 5) Best Practices
- prefer managed identity
- use Key Vault-backed linked services
- never hardcode passwords
