# 01 - Data Warehouse Basics (Interview Q&A)

## 1) What is a Data Warehouse?
A DW is a centralized system for **analytics + reporting**, storing **historical integrated data**.

## 2) Why not use OLTP DB for analytics?
Because OLTP is optimized for:
- inserts/updates
- normalized schema
Analytics needs:
- large scans
- aggregations
- history

## 3) What is OLAP?
Online Analytical Processing: complex read-heavy queries for analytics.

## 4) DW vs Data Lake
- DW: curated structured, schema-on-write
- Lake: raw + semi-structured, schema-on-read

## 5) What is a Data Mart?
A subset of DW focused on a department (sales, finance).

---
