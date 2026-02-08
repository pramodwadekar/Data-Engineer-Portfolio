# 02 — Intermediate Data Warehouse Interview Questions

## Dimensional Modeling
1. What is dimensional modeling?
2. Explain Kimball methodology.
3. Explain Inmon methodology.
4. Kimball vs Inmon?
5. What are conformed dimensions and why are they important?
6. What is a bus matrix?
7. What is a slowly changing dimension (SCD)?
8. When to use SCD Type 1?
9. When to use SCD Type 2?
10. How do you implement SCD Type 2?
11. What columns are needed for SCD2?
12. What is Type 3 SCD?
13. Type 1 vs Type 2 differences?

## Fact table design
14. What is additive measure?
15. What is semi-additive measure?
16. What is non-additive measure?
17. Give examples of each.
18. What is a snapshot fact table used for?
19. Why accumulating snapshot requires updates?

## Incremental Loading
20. What is incremental load?
21. What is watermark strategy?
22. What is CDC?
23. CDC vs watermark?
24. How do you handle deletes in CDC?
25. How do you handle late arriving data?
26. What is idempotency?
27. How do you avoid duplicates in incremental pipelines?

## Data Quality
28. What are common data quality checks?
29. How do you check referential integrity in warehouse?
30. How do you reconcile source vs warehouse?

## Performance
31. What is partitioning?
32. How partitioning helps query performance?
33. What is indexing?
34. What is columnstore index?
35. Why columnstore is good for analytics?

## Tools/Platforms
36. Name popular cloud data warehouses.
37. What is MPP architecture?
38. Why MPP is used in warehouses?

---

## Interview Hint
If you can explain SCD2 + grain clearly, you already beat 70% candidates.
