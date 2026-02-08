-- Project 01: Create staging tables

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
