# Notebook: Silver -> Gold (PySpark)

from pyspark.sql.functions import year, month, sum as _sum

silver_path = "abfss://curated@<storage>.dfs.core.windows.net/silver/orders_delta/"
gold_path = "abfss://gold@<storage>.dfs.core.windows.net/gold/monthly_sales_delta/"

df = spark.read.format("delta").load(silver_path)

gold = df.groupBy(year("order_date").alias("sales_year"),
                  month("order_date").alias("sales_month"))          .agg(_sum("amount").alias("total_sales"))

gold.write.format("delta").mode("overwrite").save(gold_path)
