# Practical 11 — Synapse Spark: Parquet + Delta

```python
df = spark.read.parquet("abfss://raw@<storage>.dfs.core.windows.net/orders/")
df2 = df.filter(df.amount > 0)

df2.write.mode("overwrite").parquet("abfss://curated@<storage>.dfs.core.windows.net/orders/")
df2.write.format("delta").mode("overwrite").save("abfss://curated@<storage>.dfs.core.windows.net/orders_delta/")
```

## Interview point
Spark for transformations, SQL pool for BI serving.
