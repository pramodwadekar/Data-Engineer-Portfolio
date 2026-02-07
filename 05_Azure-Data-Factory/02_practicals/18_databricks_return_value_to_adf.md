# 18 - Return Value from Databricks to ADF (Practical)

## Goal
Return status/row count from Databricks notebook back to ADF.

---

## Pattern
1. Databricks notebook calculates metrics
2. Notebook exits with JSON output
3. ADF reads output

---

## Example in Databricks
```python
dbutils.notebook.exit('{"rows_processed": 1200, "status": "SUCCESS"}')
```

---

## In ADF
Read activity output:
```text
@activity('DatabricksNotebook1').output.runOutput
```

---

## Interview Points
- helps audit logging
- helps validation
