-- Load fact_sales using joins between source and dimensions

INSERT INTO fact_sales (date_key, customer_key, product_key, quantity, total_amount)
SELECT
    d.date_key,
    c.customer_key,
    p.product_key,
    oi.quantity,
    oi.quantity * p.price AS total_amount
FROM src_orders o
JOIN src_order_items oi ON o.order_id = oi.order_id
JOIN dim_date d ON d.full_date = o.order_date
JOIN dim_customer c ON c.customer_id = o.customer_id
JOIN dim_product p ON p.product_id = oi.product_id;
