-- Accumulating snapshot fact table

CREATE TABLE fact_order_lifecycle (
  lifecycle_sk INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  order_id INT,
  customer_sk INT,
  order_created_date_sk INT,
  payment_date_sk INT,
  packed_date_sk INT,
  shipped_date_sk INT,
  delivered_date_sk INT,
  returned_date_sk INT,
  order_status VARCHAR(30),
  total_amount DECIMAL(18,2)
);
