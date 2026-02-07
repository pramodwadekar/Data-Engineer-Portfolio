# 33 - SQL Warehouse + Dashboard Practical (Bonus)

🎯 Goal: Create Databricks SQL query + dashboard using SQL Warehouse.

---

## ✅ What you will learn
- Create SQL warehouse
- Run SQL query
- Create visualization
- Create dashboard
- Configure refresh + alerts

---

## 1) Create SQL Warehouse
Compute → SQL Warehouses → Create

Recommended:
- small size
- auto stop enabled (5-10 min)

---

## 2) Create a Sample Table
Use any Delta table created earlier.

Example:
- `sales_small_files`
- `bronze_sales`
- `employees_uc`

---

## 3) Run SQL Query
Go to:
SQL → Query editor

Example query:
```sql
SELECT city, SUM(amount) AS total_amount
FROM sales_gold
GROUP BY city
ORDER BY total_amount DESC;
```

---

## 4) Create Visualization
Click:
- + Add visualization
Choose:
- bar chart / table

---

## 5) Create Dashboard
Click:
- Add to dashboard
Create dashboard:
`Sales Summary Dashboard`

---

## 6) Configure Refresh
Set:
- refresh schedule (daily)

---

## 7) Create SQL Alert
Example:
If total_amount > 1000000 then alert.

---

## 8) Best Practices
- use gold tables for dashboards
- optimize tables (OPTIMIZE + ZORDER)
- use warehouse auto stop

---

## 9) Interview Talking Points
- SQL warehouses are for BI workloads
- dashboards connect to gold tables
- auto stop reduces cost

---

## 10) Output
After this practical:
✅ you created warehouse + dashboard  
✅ you understand BI integration  

---

✅ Next: Enterprise practicals 34-37
