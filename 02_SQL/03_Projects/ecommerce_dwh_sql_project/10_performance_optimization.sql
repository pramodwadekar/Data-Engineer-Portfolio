-- =========================================
-- Project: E-commerce DWH (PostgreSQL)
-- File: 10_performance_optimization.sql
-- Purpose: Indexing + Query Optimization
-- =========================================

-- Fact tables become huge in real systems.
-- Indexing helps improve query performance for:
-- 1) date based filtering (monthly revenue)
-- 2) customer based analysis (top customers)
-- 3) product based analysis (top products)

-- Index on fact_orders (order_date is used for reporting)
CREATE INDEX IF NOT EXISTS idx_fact_orders_order_date
ON ecommerce_dwh.fact_orders(order_date);

-- Index on fact_orders (order_status is used for cancellation rate)
CREATE INDEX IF NOT EXISTS idx_fact_orders_status
ON ecommerce_dwh.fact_orders(order_status);

-- Index on fact_sales (order_date for time-series queries)
CREATE INDEX IF NOT EXISTS idx_fact_sales_order_date
ON ecommerce_dwh.fact_sales(order_date);

-- Index on fact_sales (customer analysis)
CREATE INDEX IF NOT EXISTS idx_fact_sales_customer_id
ON ecommerce_dwh.fact_sales(customer_id);

-- Index on fact_sales (product analysis)
CREATE INDEX IF NOT EXISTS idx_fact_sales_product_id
ON ecommerce_dwh.fact_sales(product_id);

-- Optional composite index (useful for month + customer analysis)
CREATE INDEX IF NOT EXISTS idx_fact_sales_date_customer
ON ecommerce_dwh.fact_sales(order_date, customer_id);
