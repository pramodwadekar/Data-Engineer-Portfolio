# 01 - Data Warehouse Introduction (Core Concepts)

## What is a Data Warehouse?
A **Data Warehouse (DW)** is a centralized system designed for:
- reporting
- analytics
- business intelligence (BI)
- historical analysis

### Key property
A DW stores **historical, integrated, cleaned data** from multiple sources.

---

## Why Data Warehouse exists?
Operational systems (OLTP) are not designed for analytics.

Problems with OLTP for analytics:
- tables are normalized → too many joins
- queries are slow
- reporting impacts production performance
- no history (often only current state)

---

## Data Warehouse goals
- Single source of truth
- Consistent metrics
- Fast analytics queries
- Historical trends
- Business KPIs

---

## DW vs Data Lake vs Lakehouse
### Data Lake
- raw + semi-structured + structured
- cheap storage
- schema-on-read

### Data Warehouse
- curated structured data
- schema-on-write
- strong governance

### Lakehouse
- data lake storage + warehouse features (Delta/Iceberg/Hudi)

---

## DW core layers
- Staging (raw ingestion)
- Integration layer (cleaned)
- Presentation layer (facts/dims, marts)

---

## Key DW terms
- Fact table
- Dimension table
- Grain
- Surrogate key
- SCD
- Conformed dimension
- Data mart

---
