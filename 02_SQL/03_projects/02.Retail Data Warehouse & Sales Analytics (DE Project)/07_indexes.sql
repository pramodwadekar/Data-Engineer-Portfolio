-- Indexes for performance

CREATE INDEX idx_fact_date ON fact_sales(date_key);
CREATE INDEX idx_fact_customer ON fact_sales(customer_key);
CREATE INDEX idx_fact_product ON fact_sales(product_key);

CREATE INDEX idx_dim_customer_city ON dim_customer(city);
CREATE INDEX idx_dim_product_name ON dim_product(product_name);
