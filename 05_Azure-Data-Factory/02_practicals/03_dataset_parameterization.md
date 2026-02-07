# 03 - Dataset Parameterization (Practical)

## Goal
Create parameterized datasets for dynamic file paths.

---

## Scenario
Daily files land like:
`/raw/sales/2026/02/08/sales.csv`

---

## Steps

### 1) Create ADLS Dataset (DelimitedText)
1. Author → Datasets → New dataset
2. Choose ADLS Gen2 → DelimitedText
3. Select linked service

---

### 2) Add parameters
Dataset → Parameters:
- `folderPath`
- `fileName`

---

### 3) Use dynamic content
In dataset connection:
- Directory: `@dataset().folderPath`
- File: `@dataset().fileName`

---

## Example values in pipeline
- folderPath = `raw/sales/2026/02/08/`
- fileName = `sales.csv`

---

## Interview Points
- Parameterized datasets make pipelines reusable
- Avoid hardcoding paths
