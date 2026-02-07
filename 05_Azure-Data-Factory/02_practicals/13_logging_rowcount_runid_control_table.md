# 13 - Logging: Row Count + RunId (Practical)

## Goal
Log every pipeline execution into a control table.

---

## Control table example
`dbo.pipeline_audit`
- run_id
- pipeline_name
- table_name
- start_time
- end_time
- rows_copied
- status

---

## Steps
1. Use Stored Procedure activity (or Web/Function)
2. Insert start log
3. After copy, insert success log
4. On failure, insert failure log

---

## Interview Points
- production pipelines always log
- helps debugging and reporting
