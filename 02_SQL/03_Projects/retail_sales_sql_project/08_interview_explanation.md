# Interview Explanation (How to Present This Project)

## What is this project?
This is a SQL Data Engineering project where I converted raw retail transactional data into a star schema and built analytics queries.

## Why did you choose this project?
Because in real companies data comes in OLTP format but reporting needs OLAP format. I wanted hands-on experience in that transformation.

## What did you build?
- Raw tables (customers, orders, products, order_items)
- Data cleaning logic
- Dimension tables (customer, product)
- Fact table (sales)
- KPI queries (monthly revenue, top customers, top products)

## What SQL concepts did you use?
Joins, Aggregations, CTEs, Date functions, Indexing, Star schema modeling.

## How will you scale it in real world?
Next step is to implement the same pipeline in PySpark + Databricks and store data in Delta tables.
