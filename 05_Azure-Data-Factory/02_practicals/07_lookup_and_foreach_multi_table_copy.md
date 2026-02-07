# 07 - Lookup + ForEach: Multi Table Copy (Practical)

## Goal
Copy multiple SQL tables dynamically using Lookup + ForEach.

---

## Scenario
Config table: `dbo.table_config`

Columns:
- table_name
- is_active

---

## Steps
1. Lookup activity:
```sql
SELECT table_name FROM dbo.table_config WHERE is_active=1;
```

2. ForEach items:
```text
@activity('Lookup1').output.value
```

3. Inside ForEach:
- Copy activity
- Source query:
```text
@concat('SELECT * FROM dbo.', item().table_name)
```

---

## Interview Points
- This is metadata-driven pipeline base
- avoids creating many pipelines
