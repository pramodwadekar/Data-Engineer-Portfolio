# 01 — Data Warehouse Fundamentals (Basic → Advanced)

## 1) What is a Data Warehouse?
A **Data Warehouse (DWH)** is a centralized system designed for:
- Reporting
- Analytics
- Business Intelligence (BI)
- Historical analysis
- Decision making

A warehouse stores **integrated, cleaned, historical data** coming from multiple systems:
- Web apps
- Mobile apps
- ERP (SAP)
- CRM (Salesforce)
- Databases (MySQL, SQL Server, Postgres)
- Logs (JSON)
- APIs

---

## 2) Why do we need a Data Warehouse?
Because OLTP systems are not built for analytics.

### OLTP systems are optimized for:
- Fast inserts/updates
- Transaction consistency (ACID)
- Concurrency (many users)
- Normalized schema

### Analytics requires:
- Heavy scans of large datasets
- Complex joins
- Aggregations
- Historical trends
- Stable schemas for reporting

So we separate:
- OLTP (run business)
- OLAP (analyze business)

---

## 3) OLTP vs OLAP (Most asked interview topic)
| Feature | OLTP | OLAP |
|---|---|---|
| Purpose | Run operations | Analyze |
| Queries | Short & frequent | Long & complex |
| Updates | Continuous | Batch or micro-batch |
| Data | Current | Historical |
| Schema | Normalized | Dimensional |
| Example | Place order | Sales trend |

---

## 4) Classic characteristics of a DWH
A Data Warehouse is:
1. **Subject-oriented** → organized by subject like Sales/Finance
2. **Integrated** → multiple sources merged
3. **Time-variant** → historical storage (years)
4. **Non-volatile** → mostly append; limited updates

---

## 5) DWH vs Data Lake vs Lakehouse
### Data Lake
- Raw data (structured + semi + unstructured)
- Cheap storage (ADLS/S3/GCS)
- Schema-on-read
- Used for ML, exploration

### Data Warehouse
- Curated structured data
- Schema-on-write
- Strong performance for BI queries

### Lakehouse (Modern)
- Data lake + warehouse together
- Uses open formats like Delta/Parquet/Iceberg
- Supports BI + ML on same storage

---

## 6) Where DWH fits in a modern DE pipeline
Typical flow:
1. Sources (OLTP, APIs)
2. Landing/Raw (Data Lake)
3. Cleaned (Silver)
4. Modeled (Gold)
5. Data Warehouse / Data Marts
6. BI tools (Power BI, Tableau)

---

## 7) DWH in real companies
A warehouse is used for:
- KPI dashboards
- Revenue analysis
- Customer segmentation
- Marketing funnel
- Inventory forecasting
- Finance reconciliation
- Audit reports

---

## 8) Core DWH layers
Most warehouses follow these logical layers:

### a) Staging Layer
- Raw extracted data
- Minimal transformations
- Used for traceability and reload

### b) Integration / Core Layer
- Clean + standardized data
- Business rules applied
- Slowly changing dimensions handled

### c) Data Mart Layer
- Department-level (Sales Mart, Finance Mart)
- Aggregated tables
- Star schema optimized for BI

---

## 9) Key terms you must know
- Fact table
- Dimension table
- Grain
- Surrogate key
- Conformed dimension
- SCD
- Star schema
- Snowflake schema
- ETL vs ELT
- Data Mart
- CDC

---

## 10) Most common interview questions from this topic
- What is Data Warehouse?
- OLTP vs OLAP?
- DWH vs Data Lake?
- What are DWH layers?
- Why use Star schema?
