# 👁️ SQL VIEWS

📖 **Introduction**  
A **View** in SQL is a **virtual table** based on the result of a `SELECT` query.  
It does not store data physically (in most databases); it stores only the query definition and shows data from underlying tables.

Views help in **simplifying complex queries**, **improving security**, and **making SQL code reusable and readable**.

---

## 🔹 Why Use Views?

- To simplify complex queries  
- To reuse SQL logic again and again  
- To improve security by exposing only required columns  
- To hide complex joins and calculations  
- To provide a consistent interface to data  
- To make reports and queries cleaner and easier  

---

## 🔹 What is a View?

A **View** is like a **saved SELECT query** that you can use like a table.

- It is created using a `SELECT` statement  
- It does not store data separately (usually)  
- Data is fetched from base tables when you query the view  
- You can use `SELECT`, `INSERT`, `UPDATE`, `DELETE` on some views (with conditions)  

---

## 🔹 Types of Views

| View Type | Description | Usage |
|-----------|-------------|--------|
| Simple View | Based on a single table | For basic filtering and column selection |
| Complex View | Based on multiple tables | Uses joins, group by, functions |
| Read-Only View | Does not allow DML operations | For reporting and security |
| Updatable View | Allows INSERT/UPDATE/DELETE | When certain conditions are met |
| Materialized View | Stores result physically (DB dependent) | For performance optimization |

---

## 🔹 Basic Syntax

```sql
-- Create View
CREATE VIEW view_name AS
SELECT column1, column2
FROM table_name
WHERE condition;

-- Use View
SELECT * FROM view_name;

-- Drop View
DROP VIEW view_name;



🔹 Examples
1️⃣ Create a Simple View
CREATE VIEW vw_EmployeeBasic AS
SELECT EmpID, EmpName, Salary
FROM Employee;


Use the view:

SELECT * FROM vw_EmployeeBasic;

2️⃣ Create a View with Condition
CREATE VIEW vw_HighSalaryEmployees AS
SELECT EmpID, EmpName, Salary
FROM Employee
WHERE Salary > 50000;


Use it like a table:

SELECT * FROM vw_HighSalaryEmployees;

3️⃣ Create a View with JOIN (Complex View)
CREATE VIEW vw_EmployeeDepartment AS
SELECT E.EmpID, E.EmpName, D.DeptName
FROM Employee E
JOIN Department D
ON E.DeptID = D.DeptID;


Query the view:

SELECT * FROM vw_EmployeeDepartment;

4️⃣ Update Data Using a View
UPDATE vw_HighSalaryEmployees
SET Salary = Salary + 5000
WHERE EmpID = 101;


⚠️ This works only if the view is updatable (no joins, group by, etc.).

5️⃣ Drop a View
DROP VIEW vw_EmployeeBasic;

🔹 Advantages of Views

✅ Improves query readability

✅ Hides complex SQL logic

✅ Provides security (restrict columns/rows)

✅ Reusable and maintainable

✅ Acts like a virtual table

🔹 Limitations of Views

❌ Does not store data (except materialized views)

❌ Performance can be slower for complex views

❌ Not all views are updatable

❌ Cannot use indexes directly on normal views (DB dependent)

🔹 When to Use Views?

When you use the same complex query many times

When you want to hide sensitive columns (e.g., Salary)

When you want to simplify reporting queries

When you want to provide a clean interface to data

🔹 Summary

A View is a virtual table based on a SELECT query 👁️

It simplifies complex SQL and improves security

You can query a view just like a table

Great for readability, reuse, and maintenance
