-- Create transaction fact table

CREATE TABLE fact_sales (
  sales_sk INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  order_id INT,
  order_date_sk INT,
  customer_sk INT,
  product_sk INT,
  store_sk INT,
  quantity INT,
  unit_price DECIMAL(10,2),
  discount DECIMAL(10,2),
  gross_amount DECIMAL(10,2),
  net_amount DECIMAL(10,2),
  order_status VARCHAR(20)
);
