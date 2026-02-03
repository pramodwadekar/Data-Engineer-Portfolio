-- 1. Daily sales
SELECT d.full_date, SUM(f.total_amount) AS daily_sales
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
GROUP BY d.full_date
ORDER BY d.full_date;

-- 2. Monthly sales
SELECT d.year, d.month, SUM(f.total_amount) AS monthly_sales
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

-- 3. Top products by revenue
SELECT p.product_name, SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_product p ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY revenue DESC;

-- 4. Top customers by spending
SELECT c.customer_name, SUM(f.total_amount) AS total_spent
FROM fact_sales f
JOIN dim_customer c ON f.customer_key = c.customer_key
GROUP BY c.customer_name
ORDER BY total_spent DESC;

-- 5. Revenue by category
SELECT cat.category_name, SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_product p ON f.product_key = p.product_key
JOIN dim_category cat ON p.category_id = cat.category_id
GROUP BY cat.category_name
ORDER BY revenue DESC;
