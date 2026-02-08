# 02 - Build Dimensions (DimCustomer, DimProduct) (Practical)

## Goal
Create 2 dimensions with:
- surrogate keys
- natural keys
- standard attributes
- "Unknown" row (-1)

This practical is **SQL-engine agnostic** (works in Postgres/SQL Server/Databricks SQL).

---

## 1) Create DimCustomer

### Table design
- `customer_sk` = surrogate key (DW generated)
- `customer_id` = natural key (from source)
- attributes: name, city, segment
- SCD2 columns are optional here (we implement later)

```sql
CREATE TABLE dim_customer (
  customer_sk BIGINT GENERATED ALWAYS AS IDENTITY,
  customer_id INT NOT NULL,
  customer_name STRING,
  city STRING,
  segment STRING,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Insert Unknown row
```sql
INSERT INTO dim_customer (customer_id, customer_name, city, segment)
VALUES (-1, 'Unknown', 'Unknown', 'Unknown');
```

---

## 2) Create DimProduct

```sql
CREATE TABLE dim_product (
  product_sk BIGINT GENERATED ALWAYS AS IDENTITY,
  product_id INT NOT NULL,
  product_name STRING,
  category STRING,
  brand STRING,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

Unknown row:
```sql
INSERT INTO dim_product (product_id, product_name, category, brand)
VALUES (-1, 'Unknown', 'Unknown', 'Unknown');
```

---

## 3) Load dimensions from source (example)

Assume staging tables:
- `stg_customers`
- `stg_products`

### Load customers
```sql
INSERT INTO dim_customer (customer_id, customer_name, city, segment)
SELECT DISTINCT
  customer_id,
  customer_name,
  city,
  segment
FROM stg_customers
WHERE customer_id IS NOT NULL;
```

### Load products
```sql
INSERT INTO dim_product (product_id, product_name, category, brand)
SELECT DISTINCT
  product_id,
  product_name,
  category,
  brand
FROM stg_products
WHERE product_id IS NOT NULL;
```

---

## 4) Validation queries
```sql
SELECT COUNT(*) FROM dim_customer;
SELECT COUNT(*) FROM dim_product;

SELECT * FROM dim_customer LIMIT 10;
SELECT * FROM dim_product LIMIT 10;
```

---

## Interview Explanation (30 sec)
- Dimensions store descriptive attributes
- Use surrogate keys for stability + SCD support
- Always keep an Unknown member row for late arriving facts

---
