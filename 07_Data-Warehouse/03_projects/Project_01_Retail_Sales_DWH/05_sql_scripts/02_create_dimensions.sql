-- Create dimensions (SCD2 ready)

CREATE TABLE dim_date (
  date_sk INT PRIMARY KEY,
  full_date DATE,
  day INT,
  month INT,
  month_name VARCHAR(20),
  quarter INT,
  year INT,
  week_of_year INT,
  is_weekend INT
);

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
