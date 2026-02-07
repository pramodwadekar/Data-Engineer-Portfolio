# 06 - Triggers & Scheduling (Interview Must)

## 1) Types of triggers
### A) Schedule Trigger
Runs on time schedule.

### B) Tumbling Window Trigger
Runs in fixed windows.
Used for:
- strict incremental processing
- event-time pipelines

### C) Event Trigger
Runs when file arrives in storage.

---

## 2) Schedule Trigger
Example:
- daily 1 AM
- hourly

---

## 3) Tumbling Window Trigger
Key features:
- ensures no missing windows
- supports retry
- supports dependency between windows

---

## 4) Event Trigger
Triggered by:
- blob created
- blob deleted

Used for:
- file arrival ingestion

---

## 5) Common Interview Questions
### Q1: Tumbling window vs schedule?
Tumbling window is strict window-based and guarantees completeness.

### Q2: Which trigger for file arrival?
Event trigger.

---

## 6) Best Practices
- use schedule triggers for batch pipelines
- use tumbling for strict incremental loads
- avoid too many triggers (cost + complexity)
