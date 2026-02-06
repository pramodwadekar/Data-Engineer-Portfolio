# 01_bronze_ingestion.py
# Read raw CSV -> write Delta Bronze

from pyspark.sql.functions import col
from src.config import BRONZE_BASE

raw_base = "/dbfs/FileStore/retail/raw"  # update in Databricks

tables = ["customers","products","stores","orders","order_items"]

for t in tables:
    df = spark.read.option("header","true").option("inferSchema","true").csv(f"{raw_base}/{t}.csv")
    df.write.format("delta").mode("overwrite").save(f"{BRONZE_BASE}/{t}")
