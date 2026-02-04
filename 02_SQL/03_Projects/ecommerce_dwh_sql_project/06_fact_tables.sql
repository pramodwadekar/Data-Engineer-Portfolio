CREATE TABLE ecommerce_dwh.fact_orders AS
SELECT
    order_id,
    order_date,
    customer_id,
    order_status,
    payment_method
FROM ecommerce_stg.orders_stg;
ALTER TABLE ecommerce_dwh.fact_orders ADD PRIMARY KEY (order_id);

CREATE TABLE ecommerce_dwh.fact_sales AS
SELECT
    o.order_id,
    o.order_date,
    o.customer_id,
    oi.product_id,
    oi.quantity,
    (oi.quantity * p.price) AS sales_amount
FROM ecommerce_stg.orders_stg o
JOIN ecommerce_stg.order_items_stg oi ON o.order_id = oi.order_id
JOIN ecommerce_stg.products_stg p ON oi.product_id = p.product_id;

CREATE INDEX idx_fact_sales_date ON ecommerce_dwh.fact_sales(order_date);
CREATE INDEX idx_fact_sales_customer ON ecommerce_dwh.fact_sales(customer_id);
CREATE INDEX idx_fact_sales_product ON ecommerce_dwh.fact_sales(product_id);
