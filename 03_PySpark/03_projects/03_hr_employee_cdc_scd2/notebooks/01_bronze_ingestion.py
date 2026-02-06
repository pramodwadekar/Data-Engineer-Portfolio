# 01_bronze_ingestion.py
# Read raw batch CSV -> write bronze delta

bronze_path = "/tmp/delta/hr/bronze/employee_batches"

raw_path = "/dbfs/FileStore/hr/raw_batches"  # update in Databricks

df = spark.read.option("header","true").option("inferSchema","true").csv(f"{raw_path}/*.csv")

df.write.format("delta").mode("overwrite").save(bronze_path)
