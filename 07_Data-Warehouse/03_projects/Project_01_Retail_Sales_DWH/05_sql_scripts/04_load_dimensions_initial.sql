-- Initial load of dimensions

INSERT INTO dim_customer (customer_id, full_name, phone, city, state, start_date, end_date, is_current)
SELECT customer_id, full_name, phone, city, state, CURRENT_DATE, '9999-12-31', 1
FROM stg_customers;

INSERT INTO dim_product (product_id, product_name, category, brand, price, start_date, end_date, is_current)
SELECT product_id, product_name, category, brand, price, CURRENT_DATE, '9999-12-31', 1
FROM stg_products;

INSERT INTO dim_store (store_id, store_name, city, state, start_date, end_date, is_current)
SELECT store_id, store_name, city, state, CURRENT_DATE, '9999-12-31', 1
FROM stg_stores;
