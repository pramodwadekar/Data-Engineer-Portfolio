-- Dedicated serving table

CREATE SCHEMA serving;
GO

CREATE TABLE serving.monthly_sales (
  sales_year INT,
  sales_month INT,
  total_sales DECIMAL(18,2)
)
WITH (
  DISTRIBUTION = ROUND_ROBIN,
  HEAP
);
