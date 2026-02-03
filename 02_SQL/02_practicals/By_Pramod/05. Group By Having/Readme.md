# SQL GROUP BY & HAVING

📖 **Introduction**  
The `GROUP BY` clause in SQL is used to arrange rows into groups based on the values of one or more columns.  
It is commonly used with **aggregate functions** (like `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`) to perform calculations on each group.  

The `HAVING` clause is used to filter groups after aggregation, similar to how `WHERE` filters rows before grouping.

---

## 🔹 Why GROUP BY & HAVING?
- To summarize data by categories (e.g., total sales per region).  
- To apply aggregate functions on grouped data.  
- To filter groups based on aggregate results (e.g., departments with average salary > 50000).  

---

## 🔹 GROUP BY vs HAVING

| Clause    | Operates On | Returns        | Used With |
|-----------|-------------|----------------|-----------|
| GROUP BY  | Multiple rows grouped by column(s) | One row per group | SELECT |
| HAVING    | Groups (after aggregation) | Filtered groups | SELECT, GROUP BY |

---

## 🔹 Syntax
```sql
SELECT column1, aggregate_function(column2)
FROM table_name
WHERE condition
GROUP BY column1
HAVING aggregate_function(column2) condition;

##🔹 Example
-- Total salary per department
SELECT Dept, SUM(Salary) 
FROM Employee 
GROUP BY Dept;

-- Count employees per department
SELECT Dept, COUNT(*) 
FROM Employee 
GROUP BY Dept;

-- Average salary per department, only show departments with avg salary > 40000
SELECT Dept, AVG(Salary) 
FROM Employee 
GROUP BY Dept
HAVING AVG(Salary) > 40000;

-- Number of employees per designation, only show groups with more than 2 employees
SELECT Designation, COUNT(*) 
FROM Employee 
GROUP BY Designation
HAVING COUNT(*) > 2;
