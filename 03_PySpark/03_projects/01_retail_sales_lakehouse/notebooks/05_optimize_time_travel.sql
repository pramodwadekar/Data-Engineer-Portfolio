-- 05_optimize_time_travel.sql
-- Databricks SQL

OPTIMIZE delta.`/tmp/delta/retail/silver/orders` ZORDER BY (customer_id, store_id);
VACUUM delta.`/tmp/delta/retail/silver/orders`;
