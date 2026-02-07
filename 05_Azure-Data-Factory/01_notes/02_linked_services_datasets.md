# 02 - Linked Services & Datasets (Most Important)

## 1) What is a Linked Service?
Linked service = connection configuration to a system.

Example:
- ADLS Gen2
- Azure SQL
- SFTP
- Databricks
- REST API

It stores:
- endpoint/URL
- authentication method
- credentials (prefer Key Vault)

---

## 2) What is a Dataset?
Dataset = reference to the data structure inside a linked service.

Examples:
- a specific folder in ADLS
- a specific table in SQL
- a specific file pattern

---

## 3) Linked Service vs Dataset
- Linked service = connection
- Dataset = actual data reference

Example:
Linked service: ADLS account  
Dataset: `/raw/sales/2026/02/`

---

## 4) Parameterized Datasets (Real-world)
Datasets can be dynamic using parameters.

Example:
- file name changes daily
- folder path changes by date

---

## 5) Common Interview Questions
### Q1: Can we use one linked service for multiple datasets?
Yes. One linked service can have many datasets.

### Q2: What is the benefit of parameterized dataset?
Reusability, dynamic pipelines.

---

## 6) Best Practices
- keep linked services minimal and reusable
- use Key Vault for secrets
- use dataset parameters for dynamic paths
