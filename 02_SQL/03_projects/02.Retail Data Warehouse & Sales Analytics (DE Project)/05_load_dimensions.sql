-- Load source data first

INSERT INTO src_customers VALUES
(1, 'Amit', 'amit@gmail.com', 'Pune'),
(2, 'Rohit', 'rohit@gmail.com', 'Mumbai'),
(3, 'Neha', 'neha@gmail.com', 'Nashik');

INSERT INTO src_categories VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books');

INSERT INTO src_products VALUES
(1, 'Laptop', 55000, 1),
(2, 'Mobile', 20000, 1),
(3, 'T-Shirt', 500, 2),
(4, 'SQL Book', 800, 3);

INSERT INTO src_orders VALUES
(1, 1, '2026-02-01'),
(2, 2, '2026-02-02'),
(3, 3, '2026-02-03');

INSERT INTO src_order_items VALUES
(1, 1, 1, 1),
(2, 1, 3, 2),
(3, 2, 2, 1),
(4, 3, 4, 2);

-- Load dimensions

INSERT INTO dim_customer (customer_id, customer_name, email, city)
SELECT customer_id, customer_name, email, city
FROM src_customers;

INSERT INTO dim_category (category_id, category_name)
SELECT category_id, category_name
FROM src_categories;

INSERT INTO dim_product (product_id, product_name, price, category_id)
SELECT product_id, product_name, price, category_id
FROM src_products;

-- Load date dimension from orders

INSERT INTO dim_date (full_date, year, month, day)
SELECT DISTINCT
    order_date,
    YEAR(order_date),
    MONTH(order_date),
    DAY(order_date)
FROM src_orders;
