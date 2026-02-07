# 16 - Trigger Databricks Notebook with Parameters (Practical)

## Goal
Trigger Databricks notebook from ADF and pass parameters.

---

## Steps
1. Create Databricks linked service
2. Add Databricks Notebook activity
3. Select notebook path

---

## Parameters
Example:
- run_date = pipeline parameter
- table_name = item().table_name
- batch_id = pipeline().RunId

---

## Interview Points
- ADF orchestrates Databricks
- parameters enable reusable notebooks
