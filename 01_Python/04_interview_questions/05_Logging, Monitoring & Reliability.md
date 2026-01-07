# 🔹 Logging, Monitoring & Reliability

## 1. What information should always be logged in a data pipeline?

### Answer:
A data pipeline should always log:
- Pipeline start and end
- Each major step (extract, transform, load)
- Input and output file names or sources
- Record counts (before and after processing)
- Errors and exceptions with messages

This helps in debugging, monitoring, and auditing pipeline runs.

---

## 2. How do you make Python pipelines observable in production?

### Answer:
By combining:
- Structured logging (INFO, WARNING, ERROR)
- Clear log messages at each step
- Centralized log storage (files or monitoring tools)
- Error logs for failures

Observability means you can **understand pipeline behavior without re-running it**.

---

## 3. How do you differentiate recoverable vs non-recoverable errors?

### Answer:
- **Recoverable errors**: temporary issues  
  (API timeout, network glitch) → retry possible
- **Non-recoverable errors**: data or logic issues  
  (schema mismatch, corrupt file) → pipeline must fail

The pipeline should retry recoverable errors and stop on non-recoverable ones.

---
