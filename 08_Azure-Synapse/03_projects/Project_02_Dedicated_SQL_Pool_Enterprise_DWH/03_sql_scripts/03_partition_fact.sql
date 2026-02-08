-- Partition example
CREATE TABLE dwh.fact_sales_partitioned (
  order_id INT,
  order_date DATE,
  customer_sk INT,
  amount DECIMAL(18,2)
)
WITH (
  DISTRIBUTION = HASH(order_id),
  CLUSTERED COLUMNSTORE INDEX,
  PARTITION (order_date RANGE RIGHT FOR VALUES (
    '2024-01-01','2024-02-01','2024-03-01','2024-04-01'
  ))
);
