# dq_checks.py
from pyspark.sql.functions import col, sum, when

def null_report(df):
    return df.select([
        sum(when(col(c).isNull(), 1).otherwise(0)).alias(f"{c}_nulls")
        for c in df.columns
    ])

def duplicate_count(df):
    return df.count() - df.dropDuplicates().count()
