# Practical 05 — Dedicated SQL Pool: Create Tables (Distribution + Columnstore)

## Dimension (small)
```sql
CREATE TABLE dwh.dim_customer (
  customer_sk INT IDENTITY(1,1),
  customer_id INT,
  full_name VARCHAR(100),
  city VARCHAR(50),
  start_date DATE,
  end_date DATE,
  is_current INT
)
WITH (
  DISTRIBUTION = REPLICATE,
  HEAP
);
```

## Fact (large)
```sql
CREATE TABLE dwh.fact_sales (
  sales_sk BIGINT IDENTITY(1,1),
  order_id INT,
  order_date DATE,
  customer_sk INT,
  amount DECIMAL(18,2)
)
WITH (
  DISTRIBUTION = HASH(order_id),
  CLUSTERED COLUMNSTORE INDEX
);
```

## Interview point
Facts = hash + columnstore, dims = replicated.
