# SQL SUBQUERIES

📖 **Introduction**  
A **subquery** is a query nested inside another SQL query.  
It allows you to use the result of one query as input for another, enabling complex data retrieval and manipulation.

---

## 🔹 Why Subqueries?
- To break down complex queries into manageable parts.  
- To use results of one query in another (e.g., filtering, calculations).  
- To perform operations that cannot be done with simple joins.  
- To improve readability and modularity of SQL queries.  

---

## 🔹 Types of Subqueries

| Subquery Type       | Description | Usage |
|---------------------|-------------|-------|
| Single-row Subquery | Returns only one row | Used with operators like `=`, `<`, `>` |
| Multi-row Subquery  | Returns multiple rows | Used with operators like `IN`, `ANY`, `ALL` |
| Correlated Subquery | Executes once for each row in the outer query | Used for row-by-row comparisons |
| Nested Subquery     | Subquery inside another subquery | Used for multi-level filtering |
| Scalar Subquery     | Returns a single value | Used in `SELECT` or `WHERE` clauses |

---

## 🔹 Syntax
```sql
SELECT columns
FROM table
WHERE column operator (SELECT column FROM table WHERE condition);


## 🔹 Examples
-- Single-row Subquery: Employee with highest salary
SELECT EmpName, Salary
FROM Employee
WHERE Salary = (SELECT MAX(Salary) FROM Employee);


-- Multi-row Subquery: Employees in departments with more than 5 employees
SELECT EmpName
FROM Employee
WHERE DeptID IN (SELECT DeptID FROM Employee GROUP BY DeptID HAVING COUNT(*) > 5);


-- Correlated Subquery: Employees earning above department average
SELECT EmpName, Salary
FROM Employee E
WHERE Salary > (SELECT AVG(Salary) FROM Employee WHERE DeptID = E.DeptID);


-- Nested Subquery: Employees in departments located in 'New York'
SELECT EmpName
FROM Employee
WHERE DeptID IN (
    SELECT DeptID
    FROM Department
    WHERE Location = 'New York'
);


-- Scalar Subquery: Show employee name with department count
SELECT EmpName, 
       (SELECT COUNT(*) FROM Department) AS DeptCount
FROM Employee;




