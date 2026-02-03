# 🚀 SQL PERFORMANCE & INDEXING

📖 **Introduction**  
**Performance tuning** in SQL is about making queries run faster and more efficiently.  
**Indexes** are special data structures that help the database find rows quickly without scanning the entire table.

Using proper indexing and optimization techniques can drastically improve query speed, especially with large datasets.

---

## 🔹 Why Performance Tuning & Indexing?

- To reduce query execution time ⏱️  
- To avoid full table scans on large tables  
- To improve application responsiveness  
- To optimize CPU, memory, and disk usage  
- To scale databases for large data volumes  
- To make reports and dashboards faster  

---

## 🔹 What is an Index?

An **index** is like a book’s index 📚 — instead of scanning every page, the database jumps directly to the required data.

- Stored separately from table data  
- Speeds up `SELECT` queries  
- Can slow down `INSERT`, `UPDATE`, `DELETE` (because index also needs updating)  

---

## 🔹 Types of Indexes

| Index Type | Description | Usage |
|------------|-------------|--------|
| Single-Column Index | Index on one column | For frequent filters on one column |
| Composite Index | Index on multiple columns | For queries using multiple columns in `WHERE` |
| Unique Index | Ensures unique values | For columns like Email, Username |
| Clustered Index | Physically orders table data | Usually on Primary Key |
| Non-Clustered Index | Separate structure from table data | Most common index type |
| Full-Text Index | For searching text data | Used in text search |
| Bitmap Index | Efficient for low-cardinality columns | Used in data warehouses |

---

## 🔹 Basic Syntax

```sql
-- Create Index
CREATE INDEX index_name
ON table_name(column_name);

-- Create Composite Index
CREATE INDEX index_name
ON table_name(column1, column2);

-- Drop Index
DROP INDEX index_name;

##🔹 Examples
1️⃣ Create an Index on Employee Salary
CREATE INDEX idx_employee_salary
ON Employee(Salary);


**Query that benefits:**

SELECT * FROM Employee WHERE Salary > 50000;

2️⃣ Composite Index on DeptID and Salary
CREATE INDEX idx_emp_dept_salary
ON Employee(DeptID, Salary);


**Useful for:**

SELECT *
FROM Employee
WHERE DeptID = 10 AND Salary > 40000;

## 3️⃣ Unique Index on Email
CREATE UNIQUE INDEX idx_employee_email
ON Employee(Email);


Ensures no two employees have the same email.

## 4️⃣ Check Query Performance (EXPLAIN)
EXPLAIN
SELECT * FROM Employee WHERE Salary > 50000;


Shows how the database executes the query and whether it uses an index.

## 5️⃣ Avoid Breaking Index Usage
SELECT * FROM Employee WHERE UPPER(EmpName) = 'RAM';


❌ This may not use index on EmpName because of function usage.
✅ Better:

SELECT * FROM Employee WHERE EmpName = 'RAM';

##🔹 Performance Tuning Tips

✅ Use indexes on columns used in WHERE, JOIN, ORDER BY, GROUP BY

✅ Avoid SELECT * — select only required columns

✅ Use proper data types

✅ Avoid functions on indexed columns in WHERE clause

✅ Use EXPLAIN to analyze queries

❌ Don’t over-index (too many indexes slow down inserts/updates)

❌ Avoid unnecessary subqueries if joins are simpler

##🔹 When NOT to Use Indexes?

On very small tables

On columns with very frequent updates

On columns with very few unique values (e.g., Gender: M/F)

When table is mostly used for inserts

##🔹 Summary

Indexes make read operations faster 🚀

They consume extra space and slow down write operations

Proper indexing gives a huge performance boost

Always analyze queries before and after adding indexes

