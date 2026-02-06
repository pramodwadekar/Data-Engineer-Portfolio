# 03_scd2_history_pipeline.py
# Build SCD Type 2 history table

from pyspark.sql.functions import current_date, lit, to_date, col

silver_current_path = "/tmp/delta/hr/silver/employee_current"
scd2_path = "/tmp/delta/hr/silver/employee_history_scd2"

current_df = spark.read.format("delta").load(silver_current_path)

# First time create history
try:
    spark.read.format("delta").load(scd2_path)
except:
    init = current_df         .withColumn("start_date", current_date())         .withColumn("end_date", lit(None).cast("date"))         .withColumn("is_current", lit(True))
    init.write.format("delta").mode("overwrite").save(scd2_path)

current_df.createOrReplaceTempView("source_t2")

# Expire old rows if change detected
spark.sql(f"""
MERGE INTO delta.`{scd2_path}` t
USING source_t2 s
ON t.emp_id = s.emp_id AND t.is_current = true
WHEN MATCHED AND (
  t.dept <> s.dept OR
  t.city <> s.city OR
  t.salary <> s.salary
) THEN UPDATE SET
  t.end_date = current_date(),
  t.is_current = false
""")

# Insert new current versions
new_versions = current_df     .withColumn("start_date", current_date())     .withColumn("end_date", lit(None).cast("date"))     .withColumn("is_current", lit(True))

new_versions.write.format("delta").mode("append").save(scd2_path)
