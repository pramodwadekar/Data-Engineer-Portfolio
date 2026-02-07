# 25 - DLT Bronze → Silver Pipeline Practical (Databricks)

🎯 Goal: Build a managed pipeline using **Delta Live Tables (DLT)** for Bronze → Silver.

---

## ✅ What you will learn
- DLT pipeline creation
- dlt.table usage
- streaming ingestion with Auto Loader inside DLT
- bronze → silver pattern
- managed dependencies

---

## 0) Prerequisites
DLT requires:
- Databricks workspace with DLT enabled
- Permissions to create pipeline
- A raw folder (cloud or DBFS demo)

Demo raw path:
`dbfs:/tmp/dlt_raw_sales/`

---

## 1) Create Demo Raw Data
```python
dbutils.fs.mkdirs("dbfs:/tmp/dlt_raw_sales/")
dbutils.fs.put("dbfs:/tmp/dlt_raw_sales/sales1.csv", "id,amount,city
1,100,Pune
2,200,Mumbai
", True)
```

---

## 2) Create a DLT Notebook
Create notebook:
`25_dlt_bronze_silver_pipeline`

---

## 3) Write DLT Code

```python
import dlt
from pyspark.sql.functions import col

RAW_PATH = "dbfs:/tmp/dlt_raw_sales/"
SCHEMA_PATH = "dbfs:/tmp/dlt_schema/sales"

@dlt.table(
  name="bronze_sales",
  comment="Raw sales ingested using Auto Loader"
)
def bronze_sales():
    return (spark.readStream
            .format("cloudFiles")
            .option("cloudFiles.format", "csv")
            .option("header", "true")
            .option("inferSchema", "true")
            .option("cloudFiles.schemaLocation", SCHEMA_PATH)
            .load(RAW_PATH))

@dlt.table(
  name="silver_sales",
  comment="Cleaned sales data"
)
def silver_sales():
    df = dlt.read("bronze_sales")
    return (df.select(
                col("id").cast("int").alias("id"),
                col("amount").cast("double").alias("amount"),
                col("city").alias("city")
            )
            .filter(col("id").isNotNull()))
```

---

## 4) Create DLT Pipeline (UI)

Steps:
1. Workflows → Delta Live Tables
2. Create pipeline
3. Select notebook: `25_dlt_bronze_silver_pipeline`
4. Storage location:
   - `dbfs:/tmp/dlt_pipeline_storage/`
5. Pipeline mode:
   - Triggered (recommended)
6. Start pipeline

---

## 5) Validate Output Tables
Go to:
Data Explorer → schema

You will see:
- bronze_sales
- silver_sales

Query:
```sql
SELECT * FROM silver_sales;
```

---

## 6) Add New File and Re-run Pipeline
```python
dbutils.fs.put("dbfs:/tmp/dlt_raw_sales/sales2.csv", "id,amount,city
3,300,Nashik
4,400,Pune
", True)
```

Run pipeline again.
It will ingest incrementally.

---

## 7) Interview Talking Points
- DLT manages dependencies automatically
- DLT is declarative pipeline framework
- Auto Loader inside DLT is production standard

---

## 8) Output
After this practical:
✅ you created DLT pipeline  
✅ you built bronze → silver tables  
✅ you ran incremental ingestion  

---

✅ Next: `26_dlt_expectations_data_quality_practical.md`
