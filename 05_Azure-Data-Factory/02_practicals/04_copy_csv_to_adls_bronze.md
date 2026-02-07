# 04 - Copy CSV to ADLS (Bronze) (Practical)

## Goal
Copy a CSV file from source storage to ADLS bronze layer.

---

## Scenario
- Source: Blob container `landing/`
- Target: ADLS `bronze/sales/`

---

## Steps

### 1) Create pipeline
Author → Pipelines → New pipeline  
Name: `pl_copy_csv_to_bronze`

---

### 2) Add Copy activity
- Source dataset: landing CSV
- Sink dataset: bronze folder

---

### 3) Sink settings
- Write behavior: **Overwrite** (for learning)
- File format: CSV
- Output path: `bronze/sales/run_date=YYYY-MM-DD/`

---

### 4) Add run_date parameter
Pipeline parameter:
- `run_date`

Dynamic sink folder:
```text
@concat('bronze/sales/run_date=', pipeline().parameters.run_date, '/')
```

---

## Interview Points
- Bronze is raw but structured
- Partition folders by date
- ADF handles ingestion
