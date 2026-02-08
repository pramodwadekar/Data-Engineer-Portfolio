# 01 — Business Problem

A retail company has data in multiple systems:
- Customers (CRM)
- Products (Product catalog)
- Stores (Master data)
- Orders + Order Items (OLTP)

Business wants:
1. Monthly revenue trend
2. Top products by sales
3. City-wise sales
4. Customer repeat purchase
5. Store performance

The OLTP database is not suitable for these queries.

So we build a Data Warehouse.
