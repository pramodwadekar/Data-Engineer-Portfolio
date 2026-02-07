# Databricks notebook source
# Project 01 - UC Setup + Load Tables

raw_base = "dbfs:/FileStore/uc_project/raw/"  # upload CSVs here
schema_name = "uc_governance"

# 1) Create schema
spark.sql("USE CATALOG main")
spark.sql(f"CREATE SCHEMA IF NOT EXISTS {schema_name}")
spark.sql(f"USE SCHEMA {schema_name}")

# 2) Load CSVs
assets = (spark.read.option("header","true").option("inferSchema","true")
          .csv(raw_base + "data_assets.csv"))

events = (spark.read.option("header","true").option("inferSchema","true")
          .csv(raw_base + "access_events.csv"))

# 3) Write as UC managed tables
assets.write.format("delta").mode("overwrite").saveAsTable("data_assets")
events.write.format("delta").mode("overwrite").saveAsTable("access_events")

print("UC tables created: data_assets, access_events")
