# 05 - Triggers & Scheduling (Interview Questions)

## 1) Trigger types?
- Schedule trigger
- Tumbling window trigger
- Event trigger

---

## 2) Schedule trigger used for?
Daily/hourly pipelines.

---

## 3) Tumbling window trigger used for?
Strict time window processing.
Ensures no missing windows.

---

## 4) Event trigger used for?
File arrival ingestion.

---

## 5) Tumbling window key features?
- retries per window
- dependency between windows
- windowStart and windowEnd values

---

## 6) How to pass trigger time to pipeline?
Use:
- `@trigger().startTime`
- tumbling window outputs

---

## 7) Best practice for triggers?
- disable triggers during deployment
- enable after validation

---

## 8) Interview scenario
**Q:** Which trigger is best for strict hourly ingestion?
A: Tumbling window trigger.
