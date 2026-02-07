# 05 - DBFS FileStore Upload Practical (Databricks)

🎯 Goal: Learn how to upload a file into Databricks FileStore and read it.

---

## ✅ What you will learn
- FileStore usage
- uploading CSV
- reading CSV using Spark
- best practices

---

## 1) Upload File to FileStore

Steps:
1. Go to left menu → **Data**
2. Click **Add Data**
3. Choose **Upload File**
4. Upload a small CSV (example: sales.csv)

Databricks stores it in:
```
dbfs:/FileStore/
```

---

## 2) Verify Uploaded File
Run:

```python
dbutils.fs.ls("dbfs:/FileStore/")
```

---

## 3) Read Uploaded CSV
Example:

```python
df = (spark.read
      .option("header", "true")
      .option("inferSchema", "true")
      .csv("dbfs:/FileStore/sales.csv"))

df.show()
df.printSchema()
```

---

## 4) Write as Delta (Bronze)
```python
(df.write
 .format("delta")
 .mode("overwrite")
 .save("dbfs:/tmp/bronze_sales"))
```

---

## 5) Read Delta Back
```python
bronze_df = spark.read.format("delta").load("dbfs:/tmp/bronze_sales")
bronze_df.show()
```

---

## 6) Best Practices
- FileStore is only for demo/testing
- Production should use ADLS/S3 paths
- Always store bronze in Delta format

---

## 7) Output
After this practical, you can:
✅ upload CSV  
✅ read it using Spark  
✅ write to Delta format  

---

✅ Next: `06_create_repo_github_practical.md`
