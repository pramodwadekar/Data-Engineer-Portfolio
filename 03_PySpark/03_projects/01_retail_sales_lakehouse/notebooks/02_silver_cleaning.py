# 02_silver_cleaning.py
# Bronze -> Silver (clean + schema + audit)

from pyspark.sql.functions import col, trim, upper, coalesce, lit, to_date
from src.config import BRONZE_BASE, SILVER_BASE, QUARANTINE_BASE
from src.utils import add_audit_columns

load_date = "2026-02-07"
batch_id = "retail_batch_01"

def read_bronze(t):
    return spark.read.format("delta").load(f"{BRONZE_BASE}/{t}")

# customers
cust = read_bronze("customers")     .withColumn("full_name", upper(trim(coalesce(col("full_name"), lit("UNKNOWN")))))     .withColumn("signup_date", to_date(col("signup_date")))

cust = add_audit_columns(cust, load_date, batch_id)
cust.write.format("delta").mode("overwrite").save(f"{SILVER_BASE}/customers")

# orders (quarantine null payment_mode)
orders = read_bronze("orders").withColumn("order_date", to_date(col("order_date")))

bad_orders = orders.filter(col("payment_mode").isNull())
good_orders = orders.filter(col("payment_mode").isNotNull())

bad_orders.write.format("delta").mode("overwrite").save(f"{QUARANTINE_BASE}/orders_bad_payment")

good_orders = add_audit_columns(good_orders, load_date, batch_id)
good_orders.write.format("delta").mode("overwrite").save(f"{SILVER_BASE}/orders")
