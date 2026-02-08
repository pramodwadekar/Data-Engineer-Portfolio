# 02 — Intermediate ADLS Gen2 Interview Questions (With Answers)

## RBAC
### 1) What is RBAC?
**Answer:** Azure Role-Based Access Control. Permissions applied at storage account/container scope.

### 2) Common RBAC roles for ADLS?
**Answer:**
- Storage Blob Data Reader
- Storage Blob Data Contributor
- Storage Blob Data Owner

### 3) Difference between Reader and Contributor?
**Answer:**
- Reader: read/list
- Contributor: read/write/delete

---

## ACL
### 4) What is an ACL?
**Answer:** File/folder permission system in ADLS Gen2 using POSIX rwx.

### 5) What are access ACL and default ACL?
**Answer:**
- Access ACL: permissions on existing objects
- Default ACL: inherited by new objects

### 6) Why execute permission is required on folders?
**Answer:** Execute means traverse. Without x, you cannot access inside the folder even if read is present.

### 7) How does inheritance work?
**Answer:** Default ACL set on a folder is inherited by new child files/folders.

---

## Authentication
### 8) Managed Identity?
**Answer:** Azure identity for services (Synapse/ADF). Recommended because no secrets.

### 9) Service principal?
**Answer:** Entra ID application used for OAuth authentication.

### 10) SAS token?
**Answer:** Time-bound and permission-scoped token for temporary access.

### 11) Shared key?
**Answer:** Full storage account access. Not recommended for production.

---

## Integration
### 12) Synapse access to ADLS uses what?
**Answer:** Usually Managed Identity, plus RBAC + ACL.

### 13) Databricks access to ADLS uses what?
**Answer:** OAuth (SPN) or managed identity depending on setup.

---

## Cost and performance
### 14) Why Parquet preferred?
**Answer:** Columnar, compressed, faster reads, cheaper scans.

### 15) Why small files are bad?
**Answer:** High overhead, slow queries, high transaction cost.
