-- External table
CREATE EXTERNAL TABLE dbo.ext_orders (
  order_id INT,
  customer_id INT,
  order_date DATE,
  amount DECIMAL(18,2)
)
WITH (
  LOCATION = 'raw/orders/',
  DATA_SOURCE = adls_src,
  FILE_FORMAT = parquet_format
);
