# 05 - Incremental Fact Load (Practical)

## Goal
Load only new orders daily using a **watermark**.

---

## 1) Create watermark table
```sql
CREATE TABLE etl_watermark (
  pipeline_name STRING PRIMARY KEY,
  last_loaded_date DATE
);
```

Initialize:
```sql
INSERT INTO etl_watermark VALUES ('fact_sales_load', DATE '2026-01-01');
```

---

## 2) Read watermark
```sql
SELECT last_loaded_date
FROM etl_watermark
WHERE pipeline_name = 'fact_sales_load';
```

---

## 3) Load only new records
```sql
INSERT INTO fact_sales
SELECT ...
FROM stg_orders o
WHERE o.order_date > (SELECT last_loaded_date FROM etl_watermark WHERE pipeline_name='fact_sales_load');
```

---

## 4) Update watermark after success
```sql
UPDATE etl_watermark
SET last_loaded_date = (SELECT MAX(order_date) FROM stg_orders)
WHERE pipeline_name = 'fact_sales_load';
```

---

## Interview Notes
- Watermark ensures incremental load
- Idempotency can be added using merge / delete+insert by date partition

---
