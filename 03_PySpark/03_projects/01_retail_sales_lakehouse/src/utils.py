# utils.py
from pyspark.sql.functions import current_timestamp, lit, to_date

def add_audit_columns(df, load_date, batch_id):
    return df         .withColumn("created_at", current_timestamp())         .withColumn("updated_at", current_timestamp())         .withColumn("load_date", to_date(lit(load_date)))         .withColumn("batch_id", lit(batch_id))
