# 02 — Create DimDate (Mandatory Dimension)

## Goal
Create a Date dimension for reporting.

---

## Step 1: Create DimDate
```sql
CREATE TABLE dim_date (
  date_sk INT PRIMARY KEY,
  full_date DATE,
  day INT,
  month INT,
  month_name VARCHAR(20),
  quarter INT,
  year INT,
  week_of_year INT,
  is_weekend INT
);
```

---

## Step 2: Insert dates (example for Jan-Feb 2024)
> In real projects, you generate for 10–20 years.

```sql
INSERT INTO dim_date VALUES
(20240110,'2024-01-10',10,1,'Jan',1,2024,2,0),
(20240112,'2024-01-12',12,1,'Jan',1,2024,2,0),
(20240205,'2024-02-05',5,2,'Feb',1,2024,6,0);
```

---

## Step 3: Validate
```sql
SELECT * FROM dim_date ORDER BY full_date;
```

---

## Notes
- date_sk is usually YYYYMMDD
- This dimension enables time-based slicing.
