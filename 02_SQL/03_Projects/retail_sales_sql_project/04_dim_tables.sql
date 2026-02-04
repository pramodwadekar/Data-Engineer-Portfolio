CREATE TABLE dim_customer AS
SELECT DISTINCT
    customer_id,
    customer_name,
    city
FROM customers;

CREATE TABLE dim_product AS
SELECT DISTINCT
    product_id,
    product_name,
    category,
    price
FROM products;
