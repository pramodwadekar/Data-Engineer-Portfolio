-- Load dimensions

INSERT INTO dim_customer (customer_id, full_name, city, state, start_date, end_date, is_current)
SELECT customer_id, full_name, city, state, CURRENT_DATE, '9999-12-31', 1
FROM stg_customers;

INSERT INTO dim_product (product_id, product_name, category)
SELECT product_id, product_name, category
FROM stg_products;

INSERT INTO dim_delivery_partner (delivery_partner_id, partner_name)
SELECT delivery_partner_id, partner_name
FROM stg_delivery_partners;
