-- Marts
CREATE SCHEMA mart;
GO

CREATE TABLE mart.monthly_sales AS
SELECT
  YEAR(order_date) AS sales_year,
  MONTH(order_date) AS sales_month,
  SUM(amount) AS total_sales
FROM dwh.fact_sales
GROUP BY YEAR(order_date), MONTH(order_date);
