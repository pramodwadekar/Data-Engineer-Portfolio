# 02_silver_current_merge.py
# Maintain current snapshot table using MERGE (Type 1)

from pyspark.sql.functions import current_timestamp
from src.helpers import add_audit

bronze_path = "/tmp/delta/hr/bronze/employee_batches"
silver_current_path = "/tmp/delta/hr/silver/employee_current"

load_date = "2026-02-01"
batch_id = "hr_batch_02"

source = spark.read.format("delta").load(bronze_path)
source = add_audit(source, load_date, batch_id)
source.createOrReplaceTempView("source_emp")

# create table first time (if not exists)
try:
    spark.read.format("delta").load(silver_current_path)
except:
    source.write.format("delta").mode("overwrite").save(silver_current_path)

spark.sql(f"""
MERGE INTO delta.`{silver_current_path}` t
USING source_emp s
ON t.emp_id = s.emp_id
WHEN MATCHED THEN UPDATE SET
  t.name = s.name,
  t.dept = s.dept,
  t.city = s.city,
  t.salary = s.salary,
  t.updated_at = current_timestamp(),
  t.batch_id = s.batch_id,
  t.load_date = s.load_date
WHEN NOT MATCHED THEN INSERT *
""")
