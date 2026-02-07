# 24 - Trigger: availableNow Practical (Databricks)

🎯 Goal: Run streaming pipeline like batch using `availableNow` trigger.

This is one of the best production patterns.

---

## ✅ What you will learn
- availableNow trigger
- micro-batch streaming
- incremental ingestion like batch
- use cases in production

---

## 1) Prepare Source Folder
```python
source_path = "dbfs:/tmp/available_now_source/"
dbutils.fs.mkdirs(source_path)

dbutils.fs.put(source_path + "data1.csv", "id,amount
1,100
", True)
dbutils.fs.put(source_path + "data2.csv", "id,amount
2,200
", True)
```

---

## 2) Read Stream
```python
df = (spark.readStream
      .option("header", "true")
      .schema("id INT, amount INT")
      .csv(source_path))
```

---

## 3) Write Stream with availableNow
```python
sink_path = "dbfs:/tmp/delta/available_now_sales"
checkpoint_path = "dbfs:/tmp/checkpoints/available_now_sales"

query = (df.writeStream
         .format("delta")
         .option("checkpointLocation", checkpoint_path)
         .trigger(availableNow=True)
         .outputMode("append")
         .start(sink_path))

query.awaitTermination()
```

---

## 4) Validate Output
```python
spark.read.format("delta").load(sink_path).show()
```

---

## 5) Add New Files and Re-run
```python
dbutils.fs.put(source_path + "data3.csv", "id,amount
3,300
", True)
```

Re-run the notebook.
It will process only new files and stop automatically.

---

## 6) Why availableNow is Powerful?
Because:
- streaming reliability (checkpoint)
- batch-like execution
- perfect for daily ingestion

---

## 7) Interview Talking Points
- availableNow is best for incremental ingestion
- avoids long-running streaming clusters
- saves cost

---

## 8) Output
After this practical:
✅ you can run streaming as batch  
✅ you understand production ingestion patterns  

---

✅ Next: `25_dlt_bronze_silver_pipeline_practical.md`
