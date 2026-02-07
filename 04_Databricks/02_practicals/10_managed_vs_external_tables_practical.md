# 10 - Managed vs External Delta Tables Practical (Databricks)

🎯 Goal: Understand managed vs external tables (very important in interviews).

---

## ✅ What you will learn
- Create managed Delta table
- Create external Delta table
- Understand drop behavior
- Best practices for production

---

## 1) Managed Table Example
Managed table means Databricks manages data location.

```sql
%sql
CREATE TABLE IF NOT EXISTS managed_sales (
  id INT,
  amount DOUBLE
) USING DELTA;
```

Insert:
```sql
%sql
INSERT INTO managed_sales VALUES (1,100.5),(2,200.0);
```

---

## 2) Check Table Location
```sql
%sql
DESCRIBE DETAIL managed_sales;
```

You will see:
- location is managed by Databricks

---

## 3) External Table Example
External table stores data in a user-defined path.

```sql
%sql
CREATE TABLE IF NOT EXISTS external_sales
USING DELTA
LOCATION 'dbfs:/tmp/delta/external_sales';
```

Insert:
```sql
%sql
INSERT INTO external_sales VALUES (10,999.9);
```

---

## 4) Drop Behavior (Important)

### Drop managed table
```sql
%sql
DROP TABLE managed_sales;
```

Result:
- data files deleted

### Drop external table
```sql
%sql
DROP TABLE external_sales;
```

Result:
- metadata deleted
- data files remain at location

---

## 5) Verify External Data Still Exists
```python
dbutils.fs.ls("dbfs:/tmp/delta/external_sales")
```

---

## 6) Best Practices
- production tables should usually be external
- managed tables are okay for demos
- Unity Catalog + external locations is best

---

## 7) Interview Questions
### Q1) Which one used in production?
External tables.

### Q2) Why?
Dropping table should not delete data.

---

## 8) Output
After this practical:
✅ you understand managed vs external  
✅ you can explain drop behavior  
✅ you can create both types  

---

✅ Next: `11_optimize_zorder_practical.md`
