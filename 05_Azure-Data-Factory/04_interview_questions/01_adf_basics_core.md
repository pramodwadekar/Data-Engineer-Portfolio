# 01 - ADF Basics (Core) - Interview Questions

## 1) What is Azure Data Factory?
ADF is a **cloud ETL/ELT orchestration service** used for:
- data movement (Copy Activity)
- scheduling pipelines
- orchestrating compute (Databricks/Synapse/SQL)

---

## 2) Is ADF a transformation engine?
No.
ADF is primarily an orchestrator.
Heavy transformations should be done in Spark/Databricks.

---

## 3) What is an ADF Factory?
A factory is the ADF instance in Azure.

---

## 4) What is a Pipeline?
A pipeline is a logical container of activities.

---

## 5) What is an Activity?
A single step inside a pipeline.

---

## 6) Types of activities?
- Data movement: Copy
- Data transformation: Databricks, Data Flow, Stored Proc
- Control flow: If, ForEach, Until, Switch, Execute Pipeline

---

## 7) What is a Trigger?
A trigger starts a pipeline.

---

## 8) Pipeline run vs Activity run?
- Pipeline run = whole pipeline execution
- Activity run = single activity execution

---

## 9) What is Debug mode?
ADF debug mode runs pipelines without publishing.

---

## 10) What is Publish?
Publish generates deployment artifacts for CI/CD.

---

## 11) ADF vs SSIS?
ADF is cloud-native; SSIS is traditional/on-prem.

---

## 12) ADF vs Databricks?
ADF orchestrates; Databricks transforms.

---

## 13) What is ELT vs ETL?
- ETL: transform before loading
- ELT: load then transform (common with Databricks)

---

## 14) What is a common ADF pipeline pattern?
Bronze ingestion + Databricks transformation + Gold load.

---

## 15) Top interview statement
“ADF is used for orchestration, scheduling, and copy. For transformations we use Databricks.”
