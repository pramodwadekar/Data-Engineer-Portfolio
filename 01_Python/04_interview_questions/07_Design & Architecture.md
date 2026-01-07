# 🔹 Design & Architecture

## 7. How do you structure a Python project for a large data pipeline?

### Answer:
By separating responsibilities:
- Ingestion logic
- Transformation logic
- Validation logic
- Configuration
- Logging

A modular structure improves readability, testing, and maintenance.

---

## 8. How do you implement incremental loads using Python?

### Answer:
By:
- Tracking last processed timestamp or ID
- Reading only new or changed records
- Storing checkpoints in a file or database

Incremental loads reduce processing time and cost.

---

## 9. How do you manage secrets securely in Python pipelines?

### Answer:
By:
- Never hardcoding secrets
- Using environment variables
- Using secret managers or secured config files

This prevents credential leakage and improves security.

---

## 10. How do you test data pipelines written in Python?

### Answer:
By:
- Unit testing transformation logic
- Validating input and output data
- Testing failure scenarios
- Using small sample datasets

Testing ensures pipeline correctness before production deployment.

---

## 11. How do you document Python data pipelines for handover?

### Answer:
By providing:
- README with pipeline overview
- Architecture documentation
- Folder and file explanations
- How-to-run instructions
- Known limitations and future scope
