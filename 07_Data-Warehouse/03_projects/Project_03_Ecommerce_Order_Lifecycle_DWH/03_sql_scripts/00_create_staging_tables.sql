-- Staging tables

CREATE TABLE stg_orders (
  order_id INT,
  customer_id INT,
  order_created_date DATE,
  order_status VARCHAR(30),
  total_amount DECIMAL(18,2),
  updated_ts TIMESTAMP
);

CREATE TABLE stg_order_items (
  order_id INT,
  product_id INT,
  quantity INT,
  unit_price DECIMAL(18,2),
  updated_ts TIMESTAMP
);

CREATE TABLE stg_payments (
  order_id INT,
  payment_date DATE,
  payment_status VARCHAR(20),
  updated_ts TIMESTAMP
);

CREATE TABLE stg_shipments (
  order_id INT,
  packed_date DATE,
  shipped_date DATE,
  delivered_date DATE,
  delivery_partner_id INT,
  updated_ts TIMESTAMP
);

CREATE TABLE stg_returns (
  order_id INT,
  returned_date DATE,
  return_reason VARCHAR(100),
  updated_ts TIMESTAMP
);

CREATE TABLE stg_customers (
  customer_id INT,
  full_name VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  updated_ts TIMESTAMP
);

CREATE TABLE stg_products (
  product_id INT,
  product_name VARCHAR(100),
  category VARCHAR(50),
  updated_ts TIMESTAMP
);

CREATE TABLE stg_delivery_partners (
  delivery_partner_id INT,
  partner_name VARCHAR(100),
  updated_ts TIMESTAMP
);
