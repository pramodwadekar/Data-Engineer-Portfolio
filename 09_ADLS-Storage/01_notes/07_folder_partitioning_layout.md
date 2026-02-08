# 07 - Folder Layout & Partitioning (Bronze/Silver/Gold)

## Common layouts

### Option A (Containers)
- raw container
- bronze container
- silver container
- gold container

### Option B (Folders)
- /raw/
- /bronze/
- /silver/
- /gold/

## Partition folder style
- hive style:
  - `run_date=2026-02-08/`
  - `country=IN/`

## Best practice
Partition on:
- date
- region
Avoid partition on high-cardinality columns.

---
