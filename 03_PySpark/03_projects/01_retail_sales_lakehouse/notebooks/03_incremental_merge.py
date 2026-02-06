# 03_incremental_merge.py
# Incremental MERGE example for orders (Delta)

from src.config import SILVER_BASE
from pyspark.sql.functions import current_timestamp

silver_orders_path = f"{SILVER_BASE}/orders"

# Example: new batch
new_data = [
    (10001, 1, 1, "2025-06-01", "UPI", "DELIVERED"),  # update
    (99999, 2, 2, "2025-12-01", "CARD", "PLACED")     # new
]

source = spark.createDataFrame(new_data, ["order_id","customer_id","store_id","order_date","payment_mode","order_status"])
source.createOrReplaceTempView("source_orders")

spark.sql(f"""
MERGE INTO delta.`{silver_orders_path}` t
USING source_orders s
ON t.order_id = s.order_id
WHEN MATCHED THEN UPDATE SET
  t.payment_mode = s.payment_mode,
  t.order_status = s.order_status,
  t.updated_at = current_timestamp()
WHEN NOT MATCHED THEN INSERT *
""")
