-- Dimension tables

CREATE TABLE dim_customer (
    customer_key INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(150),
    email VARCHAR(150),
    city VARCHAR(100)
);

CREATE TABLE dim_category (
    category_key INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    category_name VARCHAR(100)
);

CREATE TABLE dim_product (
    product_key INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    product_name VARCHAR(150),
    price DECIMAL(10,2),
    category_id INT
);

CREATE TABLE dim_date (
    date_key INT AUTO_INCREMENT PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    day INT
);
