# 04 — Create Transaction Fact Table (FactSales)

## Goal
Create a transaction fact table at grain:
**1 row per order_id + product_id**.

---

## Step 1: Create FactSales
```sql
CREATE TABLE fact_sales (
  sales_sk INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  order_id INT,
  order_date_sk INT,
  customer_sk INT,
  product_sk INT,
  store_sk INT,
  quantity INT,
  unit_price DECIMAL(10,2),
  discount DECIMAL(10,2),
  gross_amount DECIMAL(10,2),
  net_amount DECIMAL(10,2),
  order_status VARCHAR(20)
);
```

---

## Step 2: Load FactSales (join with current dimension rows)
```sql
INSERT INTO fact_sales (
  order_id, order_date_sk, customer_sk, product_sk, store_sk,
  quantity, unit_price, discount, gross_amount, net_amount, order_status
)
SELECT
  oi.order_id,
  CAST(REPLACE(CAST(o.order_date AS VARCHAR),'-','') AS INT) AS order_date_sk,
  dc.customer_sk,
  dp.product_sk,
  ds.store_sk,
  oi.quantity,
  oi.unit_price,
  oi.discount,
  (oi.quantity * oi.unit_price) AS gross_amount,
  (oi.quantity * oi.unit_price) - oi.discount AS net_amount,
  o.order_status
FROM stg_order_items oi
JOIN stg_orders o ON oi.order_id = o.order_id
JOIN dim_customer dc ON o.customer_id = dc.customer_id AND dc.is_current = 1
JOIN dim_product dp ON oi.product_id = dp.product_id AND dp.is_current = 1
JOIN dim_store ds ON o.store_id = ds.store_id AND ds.is_current = 1;
```

---

## Step 3: Validate
```sql
SELECT * FROM fact_sales ORDER BY order_id;
```

---

## Key learning
- Fact table stores only surrogate keys
- Measures are numeric and additive
