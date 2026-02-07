# 10 - Execute Pipeline (Parent → Child) (Practical)

## Goal
Create modular pipelines.

---

## Scenario
Parent pipeline orchestrates:
- ingestion
- databricks transform
- gold load

---

## Steps
1. Create child pipeline: `pl_ingest_orders`
2. Parent pipeline: `pl_daily_master`

3. Use Execute Pipeline activity

---

## Interview Points
- modular design
- reusability
- easier maintenance
