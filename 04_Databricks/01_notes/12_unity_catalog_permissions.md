# 12 - Unity Catalog Permissions (Must for Interviews)

This note explains how permissions work in Unity Catalog.

---

## 1) Why permissions are critical?
In production, data must be secured:
- PII access control
- role-based access
- audit

---

## 2) Unity Catalog Permission Model

Unity Catalog uses:
- Users
- Groups
- Service principals

Permissions are granted at:
- catalog level
- schema level
- table/view level
- volume/external location level

---

## 3) Common Privileges

### Catalog privileges
- USE CATALOG
- CREATE SCHEMA

### Schema privileges
- USE SCHEMA
- CREATE TABLE
- CREATE VIEW

### Table privileges
- SELECT
- MODIFY
- READ_METADATA

---

## 4) Example Permission Grant

```sql
GRANT USE CATALOG ON CATALOG main TO `data_engineers`;
GRANT USE SCHEMA ON SCHEMA main.sales TO `data_engineers`;
GRANT SELECT ON TABLE main.sales.orders TO `analysts`;
```

---

## 5) Row/Column Level Security (RLS/CLS)
Unity Catalog supports:
- row filters
- column masking

Example use:
- hide salary column for analysts

---

## 6) Ownership Concept
Each object has an owner.
Owner can grant permissions.

---

## 7) Best Practices
- use groups, not individual users
- follow least privilege
- separate dev/qa/prod catalogs
- audit permissions regularly

---

## 8) Interview Questions
### Q1) How do you give access to analysts for gold tables only?
Grant SELECT on gold schema tables.

### Q2) How to secure PII columns?
Use column masking.

---

## 9) Summary
Unity Catalog permissions are role-based and hierarchical.

---

✅ Next: `13_autoloader_cloudfiles.md`
