# 03 — Create Dimensions with Surrogate Keys (DimCustomer, DimProduct, DimStore)

## Goal
Create warehouse dimension tables using surrogate keys.

---

## Step 1: Create DimCustomer
```sql
CREATE TABLE dim_customer (
  customer_sk INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  customer_id INT,
  full_name VARCHAR(100),
  phone VARCHAR(20),
  city VARCHAR(50),
  state VARCHAR(50),
  start_date DATE,
  end_date DATE,
  is_current INT
);
```

---

## Step 2: Create DimProduct
```sql
CREATE TABLE dim_product (
  product_sk INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  product_id INT,
  product_name VARCHAR(100),
  category VARCHAR(50),
  brand VARCHAR(50),
  price DECIMAL(10,2),
  start_date DATE,
  end_date DATE,
  is_current INT
);
```

---

## Step 3: Create DimStore
```sql
CREATE TABLE dim_store (
  store_sk INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  store_id INT,
  store_name VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  start_date DATE,
  end_date DATE,
  is_current INT
);
```

---

## Step 4: Initial load (SCD Type 2 structure but first insert)
```sql
INSERT INTO dim_customer (customer_id, full_name, phone, city, state, start_date, end_date, is_current)
SELECT customer_id, full_name, phone, city, state, CURRENT_DATE, '9999-12-31', 1
FROM stg_customers;

INSERT INTO dim_product (product_id, product_name, category, brand, price, start_date, end_date, is_current)
SELECT product_id, product_name, category, brand, price, CURRENT_DATE, '9999-12-31', 1
FROM stg_products;

INSERT INTO dim_store (store_id, store_name, city, state, start_date, end_date, is_current)
SELECT store_id, store_name, city, state, CURRENT_DATE, '9999-12-31', 1
FROM stg_stores;
```

---

## Step 5: Validate
```sql
SELECT * FROM dim_customer;
SELECT * FROM dim_product;
SELECT * FROM dim_store;
```

---

## Output
You created dimensions with surrogate keys and SCD2-ready structure.
