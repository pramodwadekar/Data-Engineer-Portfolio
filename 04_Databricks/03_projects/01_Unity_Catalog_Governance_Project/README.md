# Project 01: Unity Catalog Governance (Enterprise)

## 📌 Overview
This project is designed for Databricks interviews where they ask:
- How Unity Catalog works
- How permissions are managed
- Catalog → Schema → Table hierarchy
- Data lineage
- Governance best practices

This project creates a **mini enterprise governance environment** inside Databricks.

---

## 🎯 Why this project is interview-strong
Most candidates show only Spark transformations.

But Databricks roles often require:
- Unity Catalog
- GRANT / REVOKE
- Fully qualified tables
- External location + volumes concepts
- Lineage and audit mindset

This project demonstrates that.

---

## 🧱 Dataset
- `data_assets.csv` : metadata of datasets
- `access_events.csv` : simulated audit events

---

## 🧪 What you will build
### UC objects
- Catalog: `main` (or any)
- Schema: `uc_governance`
- Tables:
  - `data_assets`
  - `access_events`
  - `gold_access_summary`

### Governance
- Example GRANT statements
- Group-based access design
- Lineage demo (silver → gold)

---

## 🗂 Folder Structure
```
01_Unity_Catalog_Governance_Project/
  data/raw/
  notebooks/
  sql/
  README.md
```

---

## ▶️ Run Order
1. `01_uc_setup_and_load_tables`
2. `02_uc_permissions_grants_demo`
3. `03_uc_lineage_gold_summary`
4. `04_uc_audit_usecase_queries`

---

## 💬 Interview Explanation (Perfect)
“I implemented a Unity Catalog governance demo with catalogs/schemas/tables, group-based permissions using GRANT/REVOKE, and created lineage from raw audit events to a gold access summary.”

