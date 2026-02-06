# 01_stream_bronze.py
# Streaming ingestion from CSV folder -> Delta bronze

from pyspark.sql.functions import col
from src.schemas import IOT_SCHEMA

input_path = "/mnt/raw/iot"  # update in Databricks
bronze_path = "/tmp/delta/iot/bronze/events"
checkpoint = "/tmp/delta/iot/checkpoints/bronze"

df = spark.readStream     .schema(IOT_SCHEMA)     .option("header", "true")     .csv(input_path)

query = df.writeStream     .format("delta")     .outputMode("append")     .option("checkpointLocation", checkpoint)     .start(bronze_path)
