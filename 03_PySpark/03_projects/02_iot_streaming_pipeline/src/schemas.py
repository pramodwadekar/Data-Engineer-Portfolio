# schemas.py
from pyspark.sql.types import StructType, StructField, IntegerType, StringType, DoubleType, TimestampType

IOT_SCHEMA = StructType([
    StructField("event_id", IntegerType(), True),
    StructField("device_id", IntegerType(), True),
    StructField("sensor_type", StringType(), True),
    StructField("reading", DoubleType(), True),
    StructField("event_time", TimestampType(), True),
])
