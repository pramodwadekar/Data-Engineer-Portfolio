# 08 - Error Handling, Retry, Alerts (Production)

## 1) Retry policies
Each activity can have:
- retry count
- retry interval

---

## 2) Failure handling
Patterns:
- on failure → send alert
- on failure → write to error table
- on failure → stop pipeline

---

## 3) Common error handling activities
- Web activity (send alert)
- Azure function
- Logic app
- Stored procedure logging

---

## 4) Dependency conditions
- Succeeded
- Failed
- Skipped
- Completed

---

## 5) Alerting (real)
Common:
- email alerts
- Teams alerts
- PagerDuty (enterprise)

---

## 6) Common Interview Questions
### Q1: How do you handle pipeline failure?
Retry + alert + idempotency.

### Q2: How do you handle partial failure in ForEach?
Use continue on error and log failed items.

---

## 7) Best Practices
- always log pipeline run id
- keep failure notifications
- do not silently ignore failures
