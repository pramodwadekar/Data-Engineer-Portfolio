-- Create reporting view

CREATE VIEW vw_sales_summary AS
SELECT
    d.full_date,
    c.customer_name,
    p.product_name,
    f.quantity,
    f.total_amount
FROM fact_sales f
JOIN dim_date d ON f.date_key = d.date_key
JOIN dim_customer c ON f.customer_key = c.customer_key
JOIN dim_product p ON f.product_key = p.product_key;

-- Test view
SELECT * FROM vw_sales_summary;
