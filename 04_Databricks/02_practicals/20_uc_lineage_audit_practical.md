# 20 - Unity Catalog Lineage + Audit Practical

🎯 Goal: Learn lineage tracking in Unity Catalog.

---

## ✅ What you will learn
- Create tables with dependency
- Check lineage in Data Explorer
- Understand audit logs concept
- Why lineage matters in production

---

## 1) Create Source Table
```sql
USE CATALOG main;
USE SCHEMA de_training;

CREATE TABLE IF NOT EXISTS sales_source (
  id INT,
  amount DOUBLE,
  city STRING
) USING DELTA;

INSERT INTO sales_source VALUES
(1,100,'Pune'),
(2,200,'Mumbai'),
(3,300,'Nashik');
```

---

## 2) Create Derived Table
```sql
CREATE TABLE IF NOT EXISTS sales_gold AS
SELECT city, SUM(amount) AS total_amount
FROM sales_source
GROUP BY city;
```

---

## 3) Check Lineage in UI
Steps:
1) Go to Data Explorer
2) Open table: `sales_gold`
3) Click **Lineage**
4) You should see:
   sales_source → sales_gold

---

## 4) Why Lineage is Important?
- debugging data issues
- compliance
- impact analysis
- governance

---

## 5) Audit Logs (Concept)
Audit logs track:
- who accessed data
- who modified permissions
- who ran jobs

(Usually configured by admins)

---

## 6) Interview Talking Points
- UC provides lineage automatically
- lineage helps impact analysis
- audit logs are critical for compliance

---

## 7) Output
After this practical:
✅ you created lineage between tables  
✅ you verified lineage in UI  
✅ you understand audit concept  

---

✅ Next: `21_autoloader_ingestion_practical.md`
