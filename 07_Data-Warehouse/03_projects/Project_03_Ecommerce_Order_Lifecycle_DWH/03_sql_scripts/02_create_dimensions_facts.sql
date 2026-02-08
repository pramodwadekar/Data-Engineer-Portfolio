-- Dimensions + Facts

CREATE TABLE dim_customer (
  customer_sk INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  customer_id INT,
  full_name VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  start_date DATE,
  end_date DATE,
  is_current INT
);

CREATE TABLE dim_product (
  product_sk INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  product_id INT,
  product_name VARCHAR(100),
  category VARCHAR(50)
);

CREATE TABLE dim_delivery_partner (
  partner_sk INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  delivery_partner_id INT,
  partner_name VARCHAR(100)
);

CREATE TABLE dim_date (
  date_sk INT PRIMARY KEY,
  full_date DATE,
  year INT,
  month INT,
  day INT
);

-- Transaction fact
CREATE TABLE fact_order_items (
  order_item_sk INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  order_id INT,
  product_sk INT,
  customer_sk INT,
  order_created_date_sk INT,
  quantity INT,
  unit_price DECIMAL(18,2),
  gross_amount DECIMAL(18,2)
);

-- Accumulating snapshot
CREATE TABLE fact_order_lifecycle (
  lifecycle_sk INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  order_id INT,
  customer_sk INT,
  partner_sk INT,
  order_created_date_sk INT,
  payment_date_sk INT,
  packed_date_sk INT,
  shipped_date_sk INT,
  delivered_date_sk INT,
  returned_date_sk INT,
  order_status VARCHAR(30),
  total_amount DECIMAL(18,2)
);
