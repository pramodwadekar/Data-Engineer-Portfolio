# 06 - Read/Write ADLS using PySpark

## Read CSV
```python
df = spark.read.option("header", True).csv("abfss://raw@acc.dfs.core.windows.net/sales/")
```

## Write Parquet
```python
df.write.mode("overwrite").parquet("abfss://bronze@acc.dfs.core.windows.net/sales/")
```

## Write Delta (Databricks)
```python
df.write.format("delta").mode("append").save("abfss://silver@acc.dfs.core.windows.net/sales_delta/")
```

---
