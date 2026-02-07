# 17 - Unity Catalog: Create Catalog + Schema Practical

🎯 Goal: Understand UC hierarchy and create catalog/schema (admin or permitted user).

---

## ✅ What you will learn
- UC hierarchy (catalog → schema → table)
- Creating schema
- Switching catalogs/schemas
- Naming best practices

---

## 1) Open SQL Editor
Go to:
SQL → Query editor

---

## 2) List Catalogs
```sql
SHOW CATALOGS;
```

---

## 3) Use a Catalog
Example:
```sql
USE CATALOG main;
```

---

## 4) Create a Schema (Database)
```sql
CREATE SCHEMA IF NOT EXISTS de_training;
```

---

## 5) Use Schema
```sql
USE SCHEMA de_training;
```

---

## 6) Create a Delta Table in UC
```sql
CREATE TABLE IF NOT EXISTS employees_uc (
  id INT,
  name STRING,
  salary DOUBLE
) USING DELTA;
```

Insert:
```sql
INSERT INTO employees_uc VALUES
(1,'Pramod',5000),
(2,'Rahul',7000);
```

Query:
```sql
SELECT * FROM employees_uc;
```

---

## 7) Fully Qualified Name
```sql
SELECT * FROM main.de_training.employees_uc;
```

---

## 8) Best Practices
- Use separate schemas for bronze/silver/gold
- Use naming standards

---

## 9) Output
After this practical:
✅ you understand UC hierarchy  
✅ you created schema and UC table  
✅ you used fully qualified naming  

---

✅ Next: `18_uc_permissions_grants_practical.md`
