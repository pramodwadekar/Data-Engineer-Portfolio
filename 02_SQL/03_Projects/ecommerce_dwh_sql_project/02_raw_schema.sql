DROP SCHEMA IF EXISTS ecommerce_raw CASCADE;
CREATE SCHEMA ecommerce_raw;

CREATE TABLE ecommerce_raw.customers_raw (
    customer_id      INT,
    customer_name    VARCHAR(100),
    city             VARCHAR(50),
    signup_date      DATE,
    email            VARCHAR(120)
);

CREATE TABLE ecommerce_raw.products_raw (
    product_id       INT,
    product_name     VARCHAR(120),
    category         VARCHAR(50),
    price            NUMERIC(10,2)
);

CREATE TABLE ecommerce_raw.orders_raw (
    order_id         INT,
    customer_id      INT,
    order_date       DATE,
    order_status     VARCHAR(20),
    payment_method   VARCHAR(20)
);

CREATE TABLE ecommerce_raw.order_items_raw (
    order_id         INT,
    product_id       INT,
    quantity         INT
);
