# Notebook: Bronze -> Silver (PySpark)

from pyspark.sql.functions import col

raw_path = "abfss://raw@<storage>.dfs.core.windows.net/orders/"
silver_path = "abfss://curated@<storage>.dfs.core.windows.net/silver/orders_delta/"

df = spark.read.parquet(raw_path)

# basic cleaning
df2 = df.filter(col("amount").isNotNull()).filter(col("amount") > 0)

df2.write.format("delta").mode("overwrite").save(silver_path)
