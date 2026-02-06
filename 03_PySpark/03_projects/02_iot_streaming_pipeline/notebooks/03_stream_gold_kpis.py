# 03_stream_gold_kpis.py
# Silver streaming -> Gold KPIs using window + watermark

from pyspark.sql.functions import col, window, avg, count

silver_path = "/tmp/delta/iot/silver/events"
gold_path = "/tmp/delta/iot/gold/device_kpis"
checkpoint = "/tmp/delta/iot/checkpoints/gold"

silver = spark.readStream.format("delta").load(silver_path)

kpi = silver     .withWatermark("event_time", "10 minutes")     .groupBy(
        window(col("event_time"), "5 minutes"),
        col("device_id"),
        col("sensor_type")
    ).agg(
        avg("reading").alias("avg_reading"),
        count("*").alias("event_count")
    )

query = kpi.writeStream     .format("delta")     .outputMode("append")     .option("checkpointLocation", checkpoint)     .start(gold_path)
