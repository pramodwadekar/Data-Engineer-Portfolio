# 04 - DBFS, Volumes & Storage (Interview Questions)

## 1) What is DBFS?
Databricks File System = abstraction layer over cloud storage.

Example:
- `dbfs:/FileStore/`
- `dbfs:/mnt/`

---

## 2) DBFS vs ADLS/S3?
DBFS is not separate storage.
It points to underlying cloud storage.

---

## 3) What are Volumes?
Volumes are Unity Catalog governed storage locations.

They provide:
- access control
- governance
- audit logs

---

## 4) DBFS vs Volumes
- DBFS: legacy, less governed
- Volumes: recommended with Unity Catalog

---

## 5) What is External Location?
A UC object that maps to:
- ADLS container
- S3 bucket
- GCS bucket
with access control.

---

## 6) What is a managed table?
Databricks manages:
- metadata
- storage location

---

## 7) What is an external table?
Storage is outside Databricks managed storage.
Metadata points to external location.

---

## 8) When do you use external tables?
- shared storage
- cross-tool access
- enterprise lake design

---

## 9) Common path examples
- DBFS: `dbfs:/tmp/project/`
- Volume: `/Volumes/catalog/schema/volume_name/`

---

## 10) Interview scenario
**Q:** Where do you store raw files in Databricks?  
**A:** In cloud storage via external location/volume, then ingest via Auto Loader.

---

## 11) Best practices
- use UC + volumes
- avoid FileStore for production
- separate raw/bronze/silver/gold storage paths
