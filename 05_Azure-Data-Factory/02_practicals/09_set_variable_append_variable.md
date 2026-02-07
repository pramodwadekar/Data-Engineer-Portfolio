# 09 - Set Variable + Append Variable (Practical)

## Goal
Store dynamic values and build arrays.

---

## Scenario
Build list of failed tables in ForEach.

---

## Steps
1. Create variable:
- failed_tables (Array)

2. In ForEach failure path:
Append Variable:
```text
@item().table_name
```

3. After ForEach:
If array length > 0 → send alert

---

## Interview Points
- Used for failure collection
- Useful in enterprise pipelines
