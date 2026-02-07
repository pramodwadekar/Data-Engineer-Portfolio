# 04 - DBFS and Storage in Databricks (Must)

This note explains DBFS, cloud storage integration, and best practices.

---

## 1) What is DBFS?
DBFS = Databricks File System.

It is a virtual file system layer that allows Databricks to access:
- cloud storage (ADLS/S3/GCS)
- local cluster storage

---

## 2) Common DBFS Paths

### 2.1 DBFS root
```
dbfs:/
```

### 2.2 FileStore
Used for:
- small file uploads
- demo datasets

Path:
```
dbfs:/FileStore/
```

---

## 3) dbutils.fs (File Operations)

List files:
```python
dbutils.fs.ls("dbfs:/FileStore/")
```

Copy:
```python
dbutils.fs.cp("dbfs:/FileStore/a.csv", "dbfs:/tmp/a.csv")
```

Remove:
```python
dbutils.fs.rm("dbfs:/tmp/", True)
```

---

## 4) DBFS vs Cloud Storage (Important)

### DBFS
- Databricks layer
- good for notebooks

### Cloud Storage (ADLS/S3)
- real storage for production
- scalable and durable

Best practice:
Store all raw data in cloud storage, not FileStore.

---

## 5) Mounts (Old Approach)
Databricks supports mounts:
```python
dbutils.fs.mount(...)
```

But many companies now prefer:
- Unity Catalog external locations
- direct ABFSS/S3 paths

---

## 6) Accessing ADLS (Azure) - Example

Path format:
```
abfss://container@storageaccount.dfs.core.windows.net/folder/
```

Read:
```python
df = spark.read.csv("abfss://raw@xxx.dfs.core.windows.net/sales/")
```

---

## 7) Storage Security (Must)

Never hardcode keys in notebook.

Use:
- secrets
- Key Vault
- managed identity

---

## 8) Best Practices
- Use cloud storage for production data
- Use DBFS for temp/debug only
- Avoid large datasets in FileStore
- Use Unity Catalog for secure access

---

## 9) Interview Questions

### Q1) What is DBFS?
**Answer:**
DBFS is a file system abstraction that connects Databricks to cloud storage.

### Q2) Why avoid FileStore in production?
**Answer:**
Because FileStore is not designed for enterprise data management.

---

## 10) Summary
- DBFS is a storage layer in Databricks
- Use cloud storage (ADLS/S3) for real pipelines
- Use secrets for authentication

---

✅ Next: `05_databricks_sql_basics.md`
