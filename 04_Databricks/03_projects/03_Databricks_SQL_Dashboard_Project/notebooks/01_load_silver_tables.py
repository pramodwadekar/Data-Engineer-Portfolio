# Databricks notebook source
# Project 03 - Load Silver Tables

from pyspark.sql.functions import to_date, col

raw_base = "dbfs:/FileStore/sql_dashboard/raw/"  # upload here

spark.sql("USE CATALOG main")
spark.sql("CREATE SCHEMA IF NOT EXISTS sql_dashboard")
spark.sql("USE SCHEMA sql_dashboard")

campaigns = (spark.read.option("header","true").option("inferSchema","true")
             .csv(raw_base + "campaigns.csv")
             .withColumn("start_date", to_date(col("start_date"))))

events = (spark.read.option("header","true").option("inferSchema","true")
          .csv(raw_base + "marketing_events.csv")
          .withColumn("event_date", to_date(col("event_date"))))

campaigns.write.format("delta").mode("overwrite").saveAsTable("silver_campaigns")
events.write.format("delta").mode("overwrite").saveAsTable("silver_marketing_events")

print("Silver tables created.")
