# 06 - Unity Catalog (Governance) (Interview Questions)

## 1) What is Unity Catalog (UC)?
UC is Databricks governance layer for:
- data
- AI assets
- permissions
- lineage
- audit logs

---

## 2) UC hierarchy
`Catalog → Schema → Table/View/Volume`

---

## 3) What is a catalog?
Top-level container for data assets.
Often mapped to environment:
- dev
- qa
- prod

---

## 4) What is a schema?
Database-like grouping inside a catalog.

---

## 5) What is a volume?
Governed storage location under UC.

---

## 6) UC vs Hive Metastore
- Hive metastore: older, workspace-scoped
- UC: account-level, multi-workspace governance

---

## 7) What is a metastore?
Central metadata store.
UC metastore is shared across workspaces.

---

## 8) How permissions work in UC?
GRANT / REVOKE on:
- catalog
- schema
- table
- view
- volume

---

## 9) Common privileges
- USE CATALOG
- USE SCHEMA
- SELECT
- MODIFY
- CREATE TABLE
- CREATE VOLUME

---

## 10) What is data lineage?
Tracking data flow:
source → transformation → target

UC provides automatic lineage for:
- tables
- notebooks
- jobs (in many cases)

---

## 11) External locations
UC external location maps to cloud storage with access controls.

---

## 12) Interview scenario
**Q:** How do you secure tables for different teams?  
**A:** Create schemas per domain, grant access to groups, least privilege.

---

## 13) Best practices
- environment-based catalogs (dev/prod)
- group-based grants
- avoid personal ownership for prod tables
