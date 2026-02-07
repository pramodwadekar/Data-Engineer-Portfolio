# 01 - ADF Core Components (Pipeline, Activity, Trigger)

## 1) What is a Pipeline?
A pipeline is a **logical container** of activities that run together.

Example:
- Copy raw data
- Execute stored procedure
- Run Databricks notebook

---

## 2) What is an Activity?
An activity is a single step inside pipeline.

Types:
### A) Data movement
- Copy activity

### B) Data transformation
- Databricks notebook activity
- Stored procedure activity
- Data flow activity

### C) Control flow
- If condition
- ForEach
- Until
- Switch
- Execute pipeline

---

## 3) What is a Trigger?
A trigger starts a pipeline.

Types:
- Schedule trigger (daily, hourly)
- Tumbling window trigger (fixed time windows)
- Event trigger (file arrival)
- Manual trigger (debug/run now)

---

## 4) Pipeline Run vs Activity Run
- Pipeline run = full execution
- Activity run = execution of a single activity

---

## 5) What is a Factory?
ADF instance is called a factory.

---

## 6) Common Interview Questions
### Q1: What is ADF used for?
Orchestration + movement + scheduling.

### Q2: Can ADF transform big data?
ADF itself cannot process big data.
It triggers Databricks/Synapse for transformations.

### Q3: What is difference between trigger and pipeline?
Trigger starts pipeline; pipeline contains activities.

---

## 7) Best Practices
- keep pipelines modular
- use parameters for reusability
- separate ingestion vs transformation pipelines
