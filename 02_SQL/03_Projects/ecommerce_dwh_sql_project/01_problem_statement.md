# Problem Statement

An e-commerce company wants to build a reporting layer for sales analytics.

Raw data is stored in transactional format:
- customers
- products
- orders
- order_items

Goal:
1. Clean the raw data
2. Build a Star Schema (fact + dimension tables)
3. Create KPI queries
4. Add incremental load logic for new orders
5. Implement data quality checks
