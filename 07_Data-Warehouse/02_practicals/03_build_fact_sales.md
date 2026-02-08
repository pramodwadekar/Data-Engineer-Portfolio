# 03 - Build FactSales (Practical)

## Goal
Create a transaction fact table.

### Grain
**One row per order_line**.

---

## 1) Fact table design
```sql
CREATE TABLE fact_sales (
  order_id INT NOT NULL,
  order_line_id INT NOT NULL,
  date_key INT NOT NULL,
  customer_sk BIGINT NOT NULL,
  product_sk BIGINT NOT NULL,
  store_id INT NOT NULL,
  quantity INT NOT NULL,
  sales_amount DECIMAL(18,2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## 2) Date key logic
A common pattern:
- date_key = YYYYMMDD integer

Example:
2026-01-08 → 20260108

---

## 3) Load fact from staging + lookup dimensions

Assume:
- `stg_orders` has natural keys
- dimensions already loaded

```sql
INSERT INTO fact_sales
SELECT
  o.order_id,
  o.order_line_id,
  CAST(REPLACE(o.order_date, '-', '') AS INT) AS date_key,
  COALESCE(c.customer_sk, -1) AS customer_sk,
  COALESCE(p.product_sk, -1) AS product_sk,
  o.store_id,
  o.quantity,
  o.sales_amount
FROM stg_orders o
LEFT JOIN dim_customer c ON o.customer_id = c.customer_id
LEFT JOIN dim_product  p ON o.product_id  = p.product_id;
```

---

## 4) Validate
```sql
SELECT COUNT(*) FROM fact_sales;
SELECT * FROM fact_sales LIMIT 20;
```

---

## Interview Explanation
- Fact stores measures + foreign keys only
- Avoid text attributes in fact
- Use unknown dimension row to avoid breaking loads

---
