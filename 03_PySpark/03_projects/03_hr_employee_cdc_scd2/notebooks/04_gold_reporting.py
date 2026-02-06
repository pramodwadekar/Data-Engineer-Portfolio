# 04_gold_reporting.py
# Gold reporting tables from SCD2 + current

from pyspark.sql.functions import col, avg, count, sum

scd2_path = "/tmp/delta/hr/silver/employee_history_scd2"
gold_path = "/tmp/delta/hr/gold/dept_summary"

hist = spark.read.format("delta").load(scd2_path)

active = hist.filter(col("is_current") == True)

dept_summary = active.groupBy("dept").agg(
    count("*").alias("active_employees"),
    avg("salary").alias("avg_salary"),
    sum("salary").alias("total_salary")
)

dept_summary.write.format("delta").mode("overwrite").save(gold_path)
