# 05 - Databricks Access ADLS (Practical)

## Goal
Access ADLS from Databricks.

### Recommended
Use ABFSS paths.

### Example
```python
df = spark.read.csv("abfss://raw@acc.dfs.core.windows.net/sales/", header=True)
display(df)
```

---
