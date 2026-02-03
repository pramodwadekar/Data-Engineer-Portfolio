
# SQL JOINS

📖 **Introduction**  
The `JOIN` clause in SQL is used to combine rows from two or more tables based on a related column between them.  
It helps retrieve data spread across multiple tables by establishing relationships.

---

## 🔹 Why JOINS?
- To query data from multiple tables simultaneously.  
- To combine related information (e.g., employees with their departments).  
- To avoid data redundancy by normalizing tables and linking them when needed.  

---

## 🔹 Types of JOINS

| Join Type       | Description | Returns |
|-----------------|-------------|---------|
| INNER JOIN      | Matches rows from both tables where the condition is true | Only matching rows |
| LEFT JOIN       | Returns all rows from the left table and matched rows from the right | All left + matched right |
| RIGHT JOIN      | Returns all rows from the right table and matched rows from the left | All right + matched left |
| FULL OUTER JOIN | Returns rows when there is a match in one of the tables | All rows from both tables |
| CROSS JOIN      | Returns Cartesian product of both tables | All combinations |

---

## 🔹 Syntax
```sql
SELECT columns
FROM table1
JOIN table2
ON table1.column = table2.column;

---

## 🔹 Examples

-- INNER JOIN: Employees with their department names
SELECT E.EmpName, D.DeptName
FROM Employee E
INNER JOIN Department D
ON E.DeptID = D.DeptID;

-- LEFT JOIN: All employees, even if they don’t belong to a department
SELECT E.EmpName, D.DeptName
FROM Employee E
LEFT JOIN Department D
ON E.DeptID = D.DeptID;

-- RIGHT JOIN: All departments, even if they don’t have employees
SELECT E.EmpName, D.DeptName
FROM Employee E
RIGHT JOIN Department D
ON E.DeptID = D.DeptID;

-- FULL OUTER JOIN: All employees and departments, matched or not
SELECT E.EmpName, D.DeptName
FROM Employee E
FULL OUTER JOIN Department D
ON E.DeptID = D.DeptID;

-- CROSS JOIN: Every employee with every department
SELECT E.EmpName, D.DeptName
FROM Employee E
CROSS JOIN Department D;
