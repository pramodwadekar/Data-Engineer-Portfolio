# 21 - Auto Loader Ingestion Practical (Databricks)

🎯 Goal: Ingest files incrementally using Databricks Auto Loader (cloudFiles).

---

## ✅ What you will learn
- What Auto Loader does
- readStream with cloudFiles
- schemaLocation
- checkpointing
- bronze ingestion pattern

---

## 0) Prerequisites
You need a raw landing folder.

Use one of:
- `/Volumes/<catalog>/<schema>/<volume>/raw_sales/`
- `abfss://raw@.../sales/`
- For demo: `dbfs:/tmp/raw_sales/`

---

## 1) Create Sample Raw CSV Files (Demo Option)
If you don't have cloud storage, create sample files in DBFS.

```python
dbutils.fs.mkdirs("dbfs:/tmp/raw_sales/")

dbutils.fs.put("dbfs:/tmp/raw_sales/file1.csv", "id,amount,city
1,100,Pune
2,200,Mumbai
", True)
dbutils.fs.put("dbfs:/tmp/raw_sales/file2.csv", "id,amount,city
3,300,Nashik
4,400,Pune
", True)
```

---

## 2) Create Auto Loader Stream
```python
raw_path = "dbfs:/tmp/raw_sales/"
schema_path = "dbfs:/tmp/schema/raw_sales"
checkpoint_path = "dbfs:/tmp/checkpoints/raw_sales"
bronze_path = "dbfs:/tmp/delta/bronze_sales"

df = (spark.readStream
      .format("cloudFiles")
      .option("cloudFiles.format", "csv")
      .option("header", "true")
      .option("inferSchema", "true")
      .option("cloudFiles.schemaLocation", schema_path)
      .load(raw_path))
```

---

## 3) Write to Delta Bronze Table
```python
query = (df.writeStream
         .format("delta")
         .option("checkpointLocation", checkpoint_path)
         .outputMode("append")
         .start(bronze_path))
```

Wait for a few seconds then stop:

```python
query.stop()
```

---

## 4) Read Bronze Delta Table
```python
bronze_df = spark.read.format("delta").load(bronze_path)
bronze_df.show()
```

---

## 5) Register Bronze Table
```sql
%sql
CREATE TABLE IF NOT EXISTS bronze_sales
USING DELTA
LOCATION 'dbfs:/tmp/delta/bronze_sales';
```

---

## 6) Add New File and Re-run
Add new file:

```python
dbutils.fs.put("dbfs:/tmp/raw_sales/file3.csv", "id,amount,city
5,500,Mumbai
", True)
```

Re-run the streaming query.
You will see only new file is ingested.

---

## 7) Interview Talking Points
- Auto Loader avoids expensive file listing
- schemaLocation stores schema metadata
- checkpoint ensures exactly-once processing

---

## 8) Output
After this practical:
✅ you ingested files incrementally  
✅ you used schemaLocation + checkpoint  
✅ you wrote bronze Delta table  

---

✅ Next: `22_autoloader_schema_evolution_practical.md`
