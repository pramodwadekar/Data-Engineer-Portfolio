SELECT SUM(sales_amount) AS total_revenue
FROM ecommerce_dwh.fact_sales;

SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales_amount) AS revenue
FROM ecommerce_dwh.fact_sales
GROUP BY month
ORDER BY month;

SELECT
    customer_id,
    SUM(sales_amount) AS total_spent
FROM ecommerce_dwh.fact_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;
