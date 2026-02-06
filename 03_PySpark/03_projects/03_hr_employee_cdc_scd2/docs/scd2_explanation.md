# SCD Type 2 Explanation

## Goal
Maintain employee history when any attribute changes.

## Columns
- start_date: when version became active
- end_date: when version ended
- is_current: true for latest version

## Steps
1) Expire old record (set is_current=false, end_date=current_date)
2) Insert new record as current

Delta MERGE helps implement this efficiently.
