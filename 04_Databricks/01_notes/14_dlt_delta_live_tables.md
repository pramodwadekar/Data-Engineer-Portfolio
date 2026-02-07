# 14 - Delta Live Tables (DLT) - Advanced Databricks

DLT is a managed framework for building reliable ETL pipelines.

---

## 1) What is Delta Live Tables?
DLT is a Databricks feature that allows you to define pipelines as:
- tables
- views
- streaming tables

Databricks manages:
- dependencies
- execution
- retries
- monitoring
- quality checks

---

## 2) Why DLT is used?
Because traditional notebook pipelines are:
- hard to manage
- hard to monitor
- hard to enforce quality

DLT provides:
- declarative pipelines
- built-in monitoring
- data quality expectations

---

## 3) DLT Pipeline Example (Python)

```python
import dlt
from pyspark.sql.functions import col

@dlt.table(
  name="bronze_sales"
)
def bronze_sales():
    return (spark.readStream.format("cloudFiles")
            .option("cloudFiles.format", "csv")
            .load("/mnt/raw/sales/"))
```

---

## 4) Expectations (Data Quality Rules)

```python
@dlt.expect("valid_amount", "amount > 0")
@dlt.table(name="silver_sales")
def silver_sales():
    return dlt.read("bronze_sales")
```

---

## 5) Bronze-Silver-Gold with DLT
DLT supports lakehouse architecture easily.

---

## 6) DLT Types
- Standard DLT pipeline
- Continuous pipeline (streaming)

---

## 7) DLT Best Practices
- use expectations for DQ
- keep bronze raw
- separate pipelines for domains
- monitor pipeline UI

---

## 8) Interview Questions
### Q1) What is DLT?
Managed ETL framework in Databricks.

### Q2) Why DLT?
Because it provides monitoring, dependencies, and quality enforcement.

---

## 9) Summary
DLT is optional but powerful in enterprise Databricks.

---

✅ Next: `15_monitoring_logging_alerting.md`
