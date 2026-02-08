# 11 — Monitoring & Troubleshooting

Track:
- pipeline runs
- SQL queries
- Spark jobs
- failures

---

## Common issues
- Serverless slow due to small files
- Dedicated slow due to data movement or missing stats
- Pipeline failures due to permissions

---

## Debug checklist
1. Check permissions
2. Check file path
3. Check schema mismatch
4. Check distribution/skew
5. Check statistics
