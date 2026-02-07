# 19 - Unity Catalog External Location + Volume Practical (Enterprise)

🎯 Goal: Understand how Databricks securely accesses cloud storage using Unity Catalog.

---

## ✅ What you will learn
- Storage credential concept
- External location concept
- Volumes concept
- Why mounts are outdated

---

## 1) Key Concepts (Must)
In UC, secure storage access is done using:
- Storage Credential
- External Location
- External Volume

---

## 2) Create External Location (Concept Example)

```sql
-- Example only (requires admin)
CREATE EXTERNAL LOCATION raw_location
URL 'abfss://raw@storageaccount.dfs.core.windows.net/'
WITH (STORAGE CREDENTIAL `my_credential`);
```

---

## 3) Grant Access
```sql
-- Example only
GRANT READ FILES ON EXTERNAL LOCATION raw_location TO `data_engineers`;
```

---

## 4) Create Volume
```sql
-- Example only
CREATE VOLUME main.de_training.raw_volume
LOCATION 'abfss://raw@storageaccount.dfs.core.windows.net/';
```

---

## 5) Use Volume for File Ingestion
Example path:
```
/Volumes/main/de_training/raw_volume/
```

Read:
```python
df = spark.read.csv("/Volumes/main/de_training/raw_volume/sales/")
```

---

## 6) Why Volumes are Important?
Because:
- access is controlled by UC
- secure governance
- avoids DBFS mounts

---

## 7) Interview Talking Points
- mounts are older approach
- UC external locations are enterprise standard
- volumes are best for file landing zones

---

## 8) Output
After this practical:
✅ you understand external locations + volumes  
✅ you can explain secure access pattern  

---

✅ Next: `20_uc_lineage_audit_practical.md`
