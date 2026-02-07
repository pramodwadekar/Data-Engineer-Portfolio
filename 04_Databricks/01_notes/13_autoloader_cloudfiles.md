# 13 - Auto Loader (cloudFiles) - Must for Databricks DE

Auto Loader is one of the most asked Databricks topics.

---

## 1) What is Auto Loader?
Auto Loader is Databricks feature for incremental ingestion of files from cloud storage.

It is designed for:
- streaming file ingestion
- large number of files
- schema evolution
- production reliability

---

## 2) Why Auto Loader is needed?
Normal Spark read has issues:
- expensive listing for millions of files
- slow incremental ingestion
- hard to track progress

Auto Loader solves:
- incremental processing
- scalability
- checkpointing

---

## 3) Auto Loader Formats
Auto Loader supports:
- CSV
- JSON
- Parquet
- Avro
- ORC
- text

---

## 4) Basic Example (cloudFiles)

```python
df = (spark.readStream
      .format("cloudFiles")
      .option("cloudFiles.format", "csv")
      .option("header", "true")
      .option("cloudFiles.schemaLocation", "/mnt/schema/sales")
      .load("abfss://raw@storage.dfs.core.windows.net/sales/"))
```

---

## 5) Writing Auto Loader Stream to Delta

```python
(df.writeStream
   .format("delta")
   .option("checkpointLocation", "/mnt/checkpoints/sales")
   .outputMode("append")
   .start("/mnt/delta/bronze_sales"))
```

---

## 6) Schema Evolution in Auto Loader

```python
.option("cloudFiles.schemaEvolutionMode", "addNewColumns")
```

---

## 7) Bad Records Handling
You can store bad records in a rescue column.

```python
.option("rescuedDataColumn", "_rescued_data")
```

---

## 8) Trigger Modes
Common:
- processingTime
- availableNow (Databricks)

---

## 9) Auto Loader Best Practices
- always use schemaLocation
- always use checkpointLocation
- separate checkpoint per stream
- store bronze in Delta

---

## 10) Interview Questions
### Q1) Why Auto Loader is better than normal streaming read?
It avoids expensive file listing and scales for huge file counts.

### Q2) What is schemaLocation?
Location where Auto Loader stores inferred schema and evolution metadata.

---

## 11) Summary
Auto Loader is the best ingestion method for cloud file pipelines.

---

✅ Next: `14_dlt_delta_live_tables.md`
