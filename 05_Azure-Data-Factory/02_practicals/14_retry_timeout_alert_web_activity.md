# 14 - Retry, Timeout, Alerts (Practical)

## Goal
Implement production error handling.

---

## Steps
1. Set retry on Copy activity:
- retry: 3
- interval: 60 seconds

2. Add failure path:
- Web activity (send Teams alert)
OR
- Logic App

3. Include:
- pipeline name
- run id
- error message

---

## Interview Points
- retries for transient failures
- alerting is mandatory
