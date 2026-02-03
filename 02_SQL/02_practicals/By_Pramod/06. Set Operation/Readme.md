# SQL Set Operations

📖 **Introduction**  
SQL provides **set operations** to combine the results of two or more queries.  
These operations treat query results as mathematical sets and allow us to perform union, intersection, and difference operations on them.  

Set operations are useful when we need to merge, compare, or filter data across multiple tables or queries.

---

## 🔹 Common Set Operations

| Operation      | Description | Rules | Default Behavior |
|----------------|-------------|-------|------------------|
| UNION          | Combines results of two queries, removes duplicates | Queries must have same number of columns and compatible data types | Returns distinct rows |
| UNION ALL      | Combines results of two queries, keeps duplicates | Same rules as UNION | Returns all rows including duplicates |
| INTERSECT      | Returns rows common to both queries | Same rules as UNION | Returns distinct rows |
| EXCEPT / MINUS | Returns rows from first query not present in second | Same rules as UNION | Returns distinct rows |

---

## 🔹 Syntax
```sql
SELECT column1, column2, ...
FROM table1
<SET OPERATION>
SELECT column1, column2, ...
FROM table2;
