# 36 - End-to-End Pipeline: Auto Loader + DLT + Bronze-Silver-Gold (Enterprise)

🎯 Goal: Build a real end-to-end pipeline using:
- Auto Loader
- DLT
- Bronze → Silver → Gold
- Data quality expectations

This is one of the best Databricks portfolio practicals.

---

## ✅ What you will learn
- DLT pipeline with multiple layers
- Auto Loader ingestion inside DLT
- DQ expectations
- Gold aggregation

---

## 1) Prepare Raw Data
```python
dbutils.fs.mkdirs("dbfs:/tmp/e2e_raw_sales/")

dbutils.fs.put("dbfs:/tmp/e2e_raw_sales/sales1.csv", "id,amount,city
1,100,Pune
2,200,Mumbai
", True)
dbutils.fs.put("dbfs:/tmp/e2e_raw_sales/sales2.csv", "id,amount,city
3,300,Nashik
4,-50,Pune
", True)
```

---

## 2) Create DLT Notebook
Notebook:
`36_dlt_autoloader_e2e`

---

## 3) DLT Code (Bronze-Silver-Gold)

```python
import dlt
from pyspark.sql.functions import col, sum as _sum

RAW_PATH = "dbfs:/tmp/e2e_raw_sales/"
SCHEMA_PATH = "dbfs:/tmp/e2e_schema/sales"

@dlt.table(name="bronze_sales_e2e")
def bronze_sales_e2e():
    return (spark.readStream
            .format("cloudFiles")
            .option("cloudFiles.format", "csv")
            .option("header", "true")
            .option("inferSchema", "true")
            .option("cloudFiles.schemaLocation", SCHEMA_PATH)
            .load(RAW_PATH))

@dlt.table(name="silver_sales_e2e")
@dlt.expect_or_drop("valid_id", "id IS NOT NULL")
@dlt.expect_or_drop("positive_amount", "amount > 0")
def silver_sales_e2e():
    df = dlt.read("bronze_sales_e2e")
    return (df.select(
                col("id").cast("int").alias("id"),
                col("amount").cast("double").alias("amount"),
                col("city").alias("city")
            ))

@dlt.table(name="gold_city_sales_e2e")
def gold_city_sales_e2e():
    df = dlt.read("silver_sales_e2e")
    return df.groupBy("city").agg(_sum("amount").alias("total_amount"))
```

---

## 4) Create DLT Pipeline
Workflows → Delta Live Tables
- select notebook
- triggered mode
- start pipeline

---

## 5) Validate Results
```sql
SELECT * FROM gold_city_sales_e2e ORDER BY total_amount DESC;
```

---

## 6) Interview Talking Points
- bronze raw ingestion with Auto Loader
- silver applies data quality expectations
- gold creates business aggregates
- DLT provides monitoring + lineage

---

## 7) Output
After this practical:
✅ you built full lakehouse pipeline  
✅ you applied DQ rules  
✅ you produced gold KPIs  

---

✅ Next: `37_cluster_policy_enterprise_practical.md`
