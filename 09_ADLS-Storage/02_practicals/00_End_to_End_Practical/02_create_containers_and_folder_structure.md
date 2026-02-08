# Practical 02 — Create Containers + Folder Structure (Raw/Curated/Gold)

## Goal
Create enterprise standard lake layout.

## Steps
1. Storage account → Containers → Create:
   - raw
   - curated
   - gold
   - logs (optional)

2. Inside raw create folders:
   - raw/orders/
   - raw/customers/
   - raw/products/

3. Partition folder style (recommended)
Example:
- raw/orders/year=2025/month=08/day=05/

## Interview point
Partition folders improve serverless SQL and Spark performance.
