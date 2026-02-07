# 20 - Tumbling Window Trigger (Strict Incremental) (Practical)

## Goal
Use tumbling window triggers for strict time-based ingestion.

---

## When used?
- hourly pipelines
- ensures every hour is processed
- supports retries per window

---

## Steps
1. Create tumbling window trigger
2. Window size: 1 hour
3. Pass windowStart and windowEnd to pipeline

---

## Dynamic usage
Use in SQL query:
```text
WHERE updated_at >= @trigger().outputs.windowStartTime
AND updated_at < @trigger().outputs.windowEndTime
```

---

## Interview Points
- tumbling windows guarantee no missing windows
