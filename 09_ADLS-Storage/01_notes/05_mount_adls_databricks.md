# 05 - Mount ADLS in Databricks

## Why mount?
To access ADLS paths easily as `/mnt/...`

## Recommended
Use ABFSS paths directly (modern approach):
```python
path = "abfss://raw@account.dfs.core.windows.net/sales/"
df = spark.read.parquet(path)
```

Mounting is still used sometimes, but ABFSS is cleaner.

---
