# 11 - Unity Catalog (Basics) - Must for Databricks DE

Unity Catalog (UC) is Databricks governance layer for:
- access control
- data discovery
- lineage
- auditing

This is one of the most important Databricks interview topics.

---

## 1) What is Unity Catalog?
Unity Catalog is a centralized governance solution in Databricks that manages:
- catalogs
- schemas
- tables
- views
- volumes
- external locations
- permissions

---

## 2) Why Unity Catalog is needed?
Before UC, permissions were:
- workspace-based
- not centralized
- hard to manage

Unity Catalog provides:
- centralized governance across workspaces
- fine-grained permissions
- audit logs
- lineage

---

## 3) Unity Catalog Object Hierarchy

Databricks UC structure:

```
Catalog
  └── Schema (Database)
        └── Table / View
```

Example:
```
main.sales.orders
```

Where:
- `main` = catalog
- `sales` = schema
- `orders` = table

---

## 4) Managed vs External in Unity Catalog

### Managed Table
- Databricks manages storage location
- drop table deletes data

### External Table
- stored in external cloud storage
- drop table removes metadata only

---

## 5) Volumes in Unity Catalog
Volumes are a secure way to store files inside UC.

Types:
- managed volume
- external volume

Used for:
- landing zone
- file ingestion

---

## 6) External Locations (Intro)
External location connects UC to cloud storage.

Example:
- ADLS container path
- S3 bucket

---

## 7) Storage Credentials
Storage credentials are used to access cloud storage securely.

Examples:
- managed identity
- IAM role (AWS)

---

## 8) Data Lineage
UC provides lineage:
- which table created from which source
- what notebooks/jobs wrote the table

Very useful for production.

---

## 9) Unity Catalog Benefits (Interview Points)
- centralized governance
- access control
- secure data sharing
- auditing
- lineage

---

## 10) Common Interview Questions
### Q1) What is Unity Catalog?
Governance layer in Databricks for catalogs/schemas/tables.

### Q2) Difference between Hive metastore and UC?
UC is centralized, cross-workspace, supports lineage.

---

## 11) Summary
Unity Catalog is mandatory for modern Databricks projects.

---

✅ Next: `12_unity_catalog_permissions.md`
