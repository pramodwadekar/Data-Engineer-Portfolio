-- Source (raw) tables simulating transactional systems

CREATE TABLE src_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(150),
    email VARCHAR(150),
    city VARCHAR(100)
);

CREATE TABLE src_categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE src_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150),
    price DECIMAL(10,2),
    category_id INT
);

CREATE TABLE src_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

CREATE TABLE src_order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
);
