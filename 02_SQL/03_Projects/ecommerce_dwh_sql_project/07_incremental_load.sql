INSERT INTO ecommerce_dwh.fact_orders(order_id, order_date, customer_id, order_status, payment_method)
SELECT
    o.order_id, o.order_date, o.customer_id, o.order_status, o.payment_method
FROM ecommerce_stg.orders_stg o
LEFT JOIN ecommerce_dwh.fact_orders f ON o.order_id = f.order_id
WHERE f.order_id IS NULL;

INSERT INTO ecommerce_dwh.fact_sales(order_id, order_date, customer_id, product_id, quantity, sales_amount)
SELECT
    o.order_id,
    o.order_date,
    o.customer_id,
    oi.product_id,
    oi.quantity,
    (oi.quantity * p.price) AS sales_amount
FROM ecommerce_stg.orders_stg o
JOIN ecommerce_stg.order_items_stg oi ON o.order_id = oi.order_id
JOIN ecommerce_stg.products_stg p ON oi.product_id = p.product_id
LEFT JOIN ecommerce_dwh.fact_sales fs ON o.order_id = fs.order_id AND oi.product_id = fs.product_id
WHERE fs.order_id IS NULL;
