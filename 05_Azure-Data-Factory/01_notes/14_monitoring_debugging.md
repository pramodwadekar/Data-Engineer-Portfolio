# 14 - Monitoring & Debugging (Production)

## 1) ADF Monitor tab
Shows:
- pipeline runs
- activity runs
- trigger runs

---

## 2) Debug mode
Used for testing pipelines before publishing.

---

## 3) Common monitoring metrics
- duration
- data read/written
- errors
- retry count

---

## 4) Debugging pipeline failures
Steps:
1. check activity error message
2. check linked service connectivity
3. check IR
4. check permissions
5. re-run failed activity

---

## 5) Logging best practices
- write run_id
- write row count
- write status to control table

---

## 6) Interview scenario
**Q:** Pipeline failed in production, what do you do?
Check Monitor → error → fix → rerun.

---

## 7) Best Practices
- alerts for failures
- centralized logging table
- retry for transient failures
