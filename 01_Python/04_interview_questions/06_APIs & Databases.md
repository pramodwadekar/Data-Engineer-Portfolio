# 🔹 APIs & Databases

## 4. How do you handle API rate limits in Python?

### Answer:
By:
- Respecting API limits using delays (`sleep`)
- Retrying requests after wait time
- Handling HTTP status codes like `429 Too Many Requests`

This prevents API blocking and ensures stable ingestion.

---

## 5. How do you make API ingestion idempotent?

### Answer:
By ensuring **re-running the pipeline does not create duplicates**:
- Use unique IDs from API data
- Deduplicate before loading
- Use upserts or primary keys in database

Idempotency ensures safe re-execution of pipelines.

---

## 6. How do you ensure database consistency when loading data via Python?

### Answer:
By:
- Using database transactions
- Committing only after successful load
- Rolling back on failures
- Avoiding partial inserts

This guarantees data integrity even if the pipeline fails.

---
