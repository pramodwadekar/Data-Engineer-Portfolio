SELECT customer_id, COUNT(*)
FROM ecommerce_stg.customers_stg
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT oi.*
FROM ecommerce_stg.order_items_stg oi
LEFT JOIN ecommerce_stg.orders_stg o ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

SELECT oi.*
FROM ecommerce_stg.order_items_stg oi
LEFT JOIN ecommerce_stg.products_stg p ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;
