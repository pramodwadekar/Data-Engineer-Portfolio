# 02_stream_silver.py
# Bronze -> Silver streaming + quarantine

from pyspark.sql.functions import col, current_timestamp, lit
from src.schemas import IOT_SCHEMA

bronze_path = "/tmp/delta/iot/bronze/events"
silver_path = "/tmp/delta/iot/silver/events"
quarantine_path = "/tmp/delta/iot/quarantine/bad_events"
checkpoint = "/tmp/delta/iot/checkpoints/silver"

bronze = spark.readStream.format("delta").load(bronze_path)

good = bronze.filter(col("reading").isNotNull())     .withColumn("created_at", current_timestamp())     .withColumn("batch_id", lit("iot_stream"))

bad = bronze.filter(col("reading").isNull())     .select(
        col("event_id"),
        col("device_id"),
        col("sensor_type"),
        col("event_time"),
        current_timestamp().alias("quarantine_time"),
        lit("null_reading").alias("error_type")
    )

q1 = good.writeStream.format("delta")     .outputMode("append")     .option("checkpointLocation", checkpoint)     .start(silver_path)

q2 = bad.writeStream.format("delta")     .outputMode("append")     .option("checkpointLocation", "/tmp/delta/iot/checkpoints/quarantine")     .start(quarantine_path)
