# 04 - Copy Activity (Most Important for ADF)

Copy activity is the most used activity in ADF.

---

## 1) What does Copy Activity do?
It moves data from:
- source → sink

Examples:
- SQL → ADLS
- SFTP → ADLS
- ADLS → SQL
- REST API → ADLS

---

## 2) Copy Activity Components
- Source
- Sink
- Mapping
- Settings

---

## 3) Source settings (common)
- query (SQL)
- file path
- wildcard file name
- partition option

---

## 4) Sink settings (common)
- write behavior (overwrite/append)
- file format
- partition folder

---

## 5) Performance settings
- DIU (Data Integration Units)
- parallel copy
- staging
- compression

---

## 6) Copy behavior examples
### A) Full load
Copy all data daily.

### B) Incremental load
Copy only new/changed data using watermark.

---

## 7) Common Interview Questions
### Q1: What is DIU?
ADF copy compute units.

### Q2: How to improve copy performance?
- increase DIU
- enable parallel copy
- use staging
- use partitioned copy

### Q3: Copy activity vs Data flow?
Copy = movement  
Data flow = transformations

---

## 8) Best Practices
- avoid huge single file copies
- use partitioned copy for large tables
- always log row counts
