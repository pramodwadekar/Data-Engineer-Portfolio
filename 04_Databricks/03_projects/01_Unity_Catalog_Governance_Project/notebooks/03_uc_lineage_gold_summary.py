# Databricks notebook source
# Project 01 - Lineage: Build Gold Access Summary

from pyspark.sql.functions import col, count, to_date, to_timestamp

spark.sql("USE CATALOG main")
spark.sql("USE SCHEMA uc_governance")

events = spark.table("access_events")

gold = (events
        .withColumn("event_ts", to_timestamp(col("event_ts")))
        .withColumn("event_date", to_date(col("event_ts")))
        .groupBy("event_date", "principal", "action")
        .agg(count("*").alias("events_count"))
        .orderBy(col("event_date").desc()))

gold.write.format("delta").mode("overwrite").saveAsTable("gold_access_summary")

print("Gold table created: gold_access_summary")
