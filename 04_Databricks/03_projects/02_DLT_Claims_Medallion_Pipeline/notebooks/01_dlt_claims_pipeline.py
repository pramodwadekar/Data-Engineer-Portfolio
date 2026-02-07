# Databricks notebook source
# Project 02 - DLT Claims Pipeline

import dlt
from pyspark.sql.functions import col, to_date

RAW_BASE = "dbfs:/FileStore/dlt_claims/raw/"  # upload here
SCHEMA_BASE = "dbfs:/tmp/dlt_claims/schema"

@dlt.table(name="bronze_claims", comment="Raw claims ingested via Auto Loader")
def bronze_claims():
    return (spark.readStream
            .format("cloudFiles")
            .option("cloudFiles.format", "csv")
            .option("header", "true")
            .option("inferSchema", "true")
            .option("cloudFiles.schemaLocation", SCHEMA_BASE + "/claims")
            .load(RAW_BASE + "claims.csv"))

@dlt.table(name="bronze_providers", comment="Raw providers ingested via Auto Loader")
def bronze_providers():
    return (spark.readStream
            .format("cloudFiles")
            .option("cloudFiles.format", "csv")
            .option("header", "true")
            .option("inferSchema", "true")
            .option("cloudFiles.schemaLocation", SCHEMA_BASE + "/providers")
            .load(RAW_BASE + "providers.csv"))

@dlt.table(name="silver_claims_clean", comment="Clean claims with DQ expectations")
@dlt.expect_or_drop("valid_claim_id", "claim_id IS NOT NULL")
@dlt.expect_or_drop("positive_amount", "claim_amount > 0")
@dlt.expect("valid_status", "status IN ('APPROVED','REJECTED','PENDING')")
def silver_claims_clean():
    df = dlt.read("bronze_claims")
    return (df.select(
        col("claim_id").cast("int").alias("claim_id"),
        col("patient_id").cast("int").alias("patient_id"),
        col("city").alias("city"),
        col("claim_type").alias("claim_type"),
        col("claim_amount").cast("double").alias("claim_amount"),
        col("status").alias("status"),
        to_date(col("claim_date")).alias("claim_date")
    ))

@dlt.table(name="silver_providers_clean")
@dlt.expect_or_drop("valid_provider_id", "provider_id IS NOT NULL")
def silver_providers_clean():
    df = dlt.read("bronze_providers")
    return (df.select(
        col("provider_id").cast("int").alias("provider_id"),
        col("provider_name").alias("provider_name"),
        col("provider_type").alias("provider_type"),
        col("city").alias("city")
    ).dropDuplicates(["provider_id"]))

@dlt.table(name="gold_city_claims_kpi", comment="City-level KPI")
def gold_city_claims_kpi():
    df = dlt.read("silver_claims_clean")
    return (df.groupBy("claim_date", "city")
            .agg({"claim_amount":"sum", "claim_id":"count"})
            .withColumnRenamed("sum(claim_amount)", "total_claim_amount")
            .withColumnRenamed("count(claim_id)", "claims_count"))

@dlt.table(name="gold_provider_kpi", comment="Provider KPI (demo join)")
def gold_provider_kpi():
    claims = dlt.read("silver_claims_clean")
    providers = dlt.read("silver_providers_clean")

    # Demo join by city (not perfect but shows join in DLT)
    joined = claims.join(providers, "city", "left")

    return (joined.groupBy("provider_type", "city")
            .agg({"claim_amount":"avg"})
            .withColumnRenamed("avg(claim_amount)", "avg_claim_amount"))
