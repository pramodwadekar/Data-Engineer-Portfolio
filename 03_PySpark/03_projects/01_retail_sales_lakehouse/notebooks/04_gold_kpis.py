# 04_gold_kpis.py
# Silver -> Gold KPI tables

from pyspark.sql.functions import col, sum, count, avg, desc, row_number, to_date
from pyspark.sql.window import Window
from src.config import SILVER_BASE, GOLD_BASE

orders = spark.read.format("delta").load(f"{SILVER_BASE}/orders")
items  = spark.read.format("delta").load(f"{SILVER_BASE}/order_items")
prod   = spark.read.format("delta").load(f"{SILVER_BASE}/products")
cust   = spark.read.format("delta").load(f"{SILVER_BASE}/customers")
store  = spark.read.format("delta").load(f"{SILVER_BASE}/stores")

# daily sales
fact = items.join(orders, "order_id", "inner")     .join(prod, "product_id", "inner")     .withColumn("revenue", col("quantity") * col("unit_price"))

daily = fact.groupBy("order_date").agg(
    sum("revenue").alias("total_revenue"),
    countDistinct("order_id").alias("total_orders")
)

daily.write.format("delta").mode("overwrite").save(f"{GOLD_BASE}/daily_sales_kpi")

# top customers
cust_rev = fact.join(cust, "customer_id")     .groupBy("customer_id","full_name")     .agg(sum("revenue").alias("total_revenue"))

w = Window.orderBy(desc("total_revenue"))
top10 = cust_rev.withColumn("rank", row_number().over(w)).filter(col("rank") <= 10)

top10.write.format("delta").mode("overwrite").save(f"{GOLD_BASE}/top_customers_kpi")
