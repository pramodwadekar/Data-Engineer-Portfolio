# 01 — Setup Sample Schema + Sample Data (Staging)

## Goal
Create sample tables and insert data so you can practice all DWH concepts.

---

## Step 1: Create Staging tables
> These represent raw extracts from OLTP systems.

```sql
CREATE TABLE stg_customers (
  customer_id INT,
  full_name   VARCHAR(100),
  phone       VARCHAR(20),
  city        VARCHAR(50),
  state       VARCHAR(50),
  created_ts  TIMESTAMP,
  updated_ts  TIMESTAMP
);

CREATE TABLE stg_products (
  product_id INT,
  product_name VARCHAR(100),
  category     VARCHAR(50),
  brand        VARCHAR(50),
  price        DECIMAL(10,2),
  updated_ts   TIMESTAMP
);

CREATE TABLE stg_stores (
  store_id INT,
  store_name VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  updated_ts TIMESTAMP
);

CREATE TABLE stg_orders (
  order_id INT,
  customer_id INT,
  store_id INT,
  order_date DATE,
  order_status VARCHAR(20),
  updated_ts TIMESTAMP
);

CREATE TABLE stg_order_items (
  order_id INT,
  product_id INT,
  quantity INT,
  unit_price DECIMAL(10,2),
  discount DECIMAL(10,2),
  updated_ts TIMESTAMP
);
```

---

## Step 2: Insert sample data (small but meaningful)
```sql
INSERT INTO stg_customers VALUES
(101,'Amit Patil','9999000011','Pune','MH','2024-01-01 10:00:00','2024-01-01 10:00:00'),
(102,'Sneha Joshi','9999000022','Mumbai','MH','2024-01-02 11:00:00','2024-01-02 11:00:00'),
(103,'Rahul Shah','9999000033','Delhi','DL','2024-01-03 09:00:00','2024-01-03 09:00:00');

INSERT INTO stg_products VALUES
(201,'iPhone 15','Mobile','Apple',79999.00,'2024-01-01 00:00:00'),
(202,'Galaxy S24','Mobile','Samsung',69999.00,'2024-01-01 00:00:00'),
(203,'ThinkPad E14','Laptop','Lenovo',54999.00,'2024-01-01 00:00:00');

INSERT INTO stg_stores VALUES
(301,'Pune Store','Pune','MH','2024-01-01 00:00:00'),
(302,'Mumbai Store','Mumbai','MH','2024-01-01 00:00:00');

INSERT INTO stg_orders VALUES
(401,101,301,'2024-01-10','DELIVERED','2024-01-10 18:00:00'),
(402,102,302,'2024-01-12','DELIVERED','2024-01-12 20:00:00'),
(403,101,301,'2024-02-05','CANCELLED','2024-02-05 09:00:00');

INSERT INTO stg_order_items VALUES
(401,201,1,79999.00,0.00,'2024-01-10 18:00:00'),
(402,202,1,69999.00,2000.00,'2024-01-12 20:00:00'),
(403,203,1,54999.00,0.00,'2024-02-05 09:00:00');
```

---

## Step 3: Validate
```sql
SELECT COUNT(*) FROM stg_customers;
SELECT COUNT(*) FROM stg_orders;
SELECT COUNT(*) FROM stg_order_items;
```

Expected:
- customers = 3
- orders = 3
- order_items = 3

---

## Output of this practical
You now have raw staging data to build warehouse tables.
