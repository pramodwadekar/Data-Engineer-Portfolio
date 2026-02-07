# 26 - DLT Expectations (Data Quality) Practical (Databricks)

🎯 Goal: Add data quality rules in DLT using Expectations.

---

## ✅ What you will learn
- dlt.expect
- dlt.expect_or_drop
- dlt.expect_or_fail
- quarantine/bad record pattern

---

## 1) Create a DLT Notebook
Notebook:
`26_dlt_expectations`

---

## 2) Add Raw Data with Bad Records
```python
dbutils.fs.put(
  "dbfs:/tmp/dlt_raw_sales/sales_bad.csv",
  "id,amount,city
5,-100,Pune
6,600,
,700,Mumbai
",
  True
)
```

---

## 3) DLT Code with Expectations
```python
import dlt
from pyspark.sql.functions import col

RAW_PATH = "dbfs:/tmp/dlt_raw_sales/"
SCHEMA_PATH = "dbfs:/tmp/dlt_schema/sales_expect"

@dlt.table(name="bronze_sales_dq")
def bronze_sales_dq():
    return (spark.readStream
            .format("cloudFiles")
            .option("cloudFiles.format", "csv")
            .option("header", "true")
            .option("inferSchema", "true")
            .option("cloudFiles.schemaLocation", SCHEMA_PATH)
            .load(RAW_PATH))

@dlt.table(name="silver_sales_dq")
@dlt.expect_or_drop("valid_id", "id IS NOT NULL")
@dlt.expect("positive_amount", "amount > 0")
@dlt.expect("city_present", "city IS NOT NULL")
def silver_sales_dq():
    df = dlt.read("bronze_sales_dq")
    return (df.select(
                col("id").cast("int").alias("id"),
                col("amount").cast("double").alias("amount"),
                col("city").alias("city")
            ))
```

---

## 4) Run DLT Pipeline
Create pipeline from this notebook and run.

---

## 5) Check Expectation Metrics
DLT UI shows:
- how many records passed/failed each expectation

---

## 6) Expectation Types (Must Know)

### expect
- keeps records
- only logs metrics

### expect_or_drop
- removes failed records

### expect_or_fail
- fails pipeline if rule breaks

---

## 7) Interview Talking Points
- DLT expectations are built-in data quality rules
- DLT provides DQ metrics automatically
- expect_or_drop is used for silver cleansing

---

## 8) Output
After this practical:
✅ you implemented DQ rules  
✅ you used expectation types  
✅ you viewed DQ metrics in DLT UI  

---

✅ Next: `27_dlt_monitoring_practical.md`
