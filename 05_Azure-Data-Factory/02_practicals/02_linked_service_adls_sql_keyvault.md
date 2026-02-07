# 02 - Linked Services: ADLS + SQL + Key Vault (Practical)

## Goal
Create linked services for:
- ADLS Gen2
- Azure SQL Database
- Azure Key Vault

---

## Steps

### 1) Create Key Vault Linked Service
1. Manage → Linked services → New
2. Select **Azure Key Vault**
3. Provide:
   - subscription
   - key vault name
4. Test connection → Create

---

### 2) Create ADLS Linked Service
1. Linked services → New
2. Select **Azure Data Lake Storage Gen2**
3. Authentication:
   - Managed Identity (best) OR
   - Service Principal (store secret in Key Vault)

4. Test → Create

---

### 3) Create Azure SQL Linked Service
1. Linked services → New
2. Select **Azure SQL Database**
3. Auth:
   - SQL auth OR managed identity
4. If SQL auth:
   - store password in Key Vault

---

## Interview Points
- Key Vault for secrets
- Managed identity preferred
- Linked service is connection config
