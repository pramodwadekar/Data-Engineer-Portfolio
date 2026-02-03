# SQL Sorting (ORDER BY)

📖 **Introduction**  
The `ORDER BY` clause in SQL is used to arrange query results in a specific sequence.  
It can sort data in **ascending (ASC)** or **descending (DESC)** order.  
By default, sorting is ascending if no order is specified.

---

## 🔹 Why Sorting?
Sorting helps present data meaningfully, such as:
- Listing employees by salary
- Ranking students by marks
- Displaying records by date

---

## 🔹 ORDER BY Types

| Sorting Type   | Operates On     | Returns      | Used In Clauses |
|----------------|-----------------|--------------|-----------------|
| Single-column  | One column      | Sorted rows  | SELECT          |
| Multi-column   | Multiple columns| Sorted rows  | SELECT          |
| Positional     | Column index    | Sorted rows  | SELECT          |
| Hidden column  | Column not in SELECT | Sorted rows | SELECT      |

---

## 🔹 Syntax
```sql
SELECT column1, column2, ...
FROM table_name
ORDER BY column1 [ASC|DESC], column2 [ASC|DESC];
