# 22 - Auto Loader Schema Evolution Practical (Databricks)

🎯 Goal: Handle schema changes safely using Auto Loader schema evolution.

---

## ✅ What you will learn
- schema evolution mode
- adding new columns
- rescuedDataColumn
- best practices

---

## 1) Prepare Raw Folder
Use same raw path from Practical 21.

```python
raw_path = "dbfs:/tmp/raw_sales/"
schema_path = "dbfs:/tmp/schema/raw_sales_evo"
checkpoint_path = "dbfs:/tmp/checkpoints/raw_sales_evo"
bronze_path = "dbfs:/tmp/delta/bronze_sales_evo"
```

---

## 2) Create Stream with Schema Evolution Enabled
```python
df = (spark.readStream
      .format("cloudFiles")
      .option("cloudFiles.format", "csv")
      .option("header", "true")
      .option("inferSchema", "true")
      .option("cloudFiles.schemaLocation", schema_path)
      .option("cloudFiles.schemaEvolutionMode", "addNewColumns")
      .option("rescuedDataColumn", "_rescued_data")
      .load(raw_path))
```

---

## 3) Write Stream to Delta
```python
query = (df.writeStream
         .format("delta")
         .option("checkpointLocation", checkpoint_path)
         .outputMode("append")
         .start(bronze_path))
```

Stop after ingestion:
```python
query.stop()
```

---

## 4) Add a New File with Extra Column
```python
dbutils.fs.put(
  "dbfs:/tmp/raw_sales/file_schema_change.csv",
  "id,amount,city,source_system
6,600,Pune,ERP
",
  True
)
```

Re-run stream again.

---

## 5) Validate Schema Changed
```python
bronze_df = spark.read.format("delta").load(bronze_path)
bronze_df.printSchema()
bronze_df.show()
```

You should see:
- new column `source_system`
- `_rescued_data` column for unexpected data

---

## 6) Best Practices
- allow addNewColumns only in bronze
- keep silver schema strict
- store rescued records for debugging

---

## 7) Interview Talking Points
- schema evolution helps handle new columns
- rescuedDataColumn captures corrupt/unexpected records
- schemaLocation is mandatory for Auto Loader

---

## 8) Output
After this practical:
✅ you handled schema changes safely  
✅ you used rescued data pattern  

---

✅ Next: `23_streaming_to_delta_checkpoint_practical.md`
