# 03 — Advanced Data Warehouse Interview Questions

## Advanced Modeling
1. Explain Data Vault architecture (Hub, Link, Satellite).
2. When do you prefer Data Vault over Kimball?
3. What is a bridge table and when to use it?
4. How do you handle many-to-many relationships in DWH?
5. What is mini dimension and why used?
6. What is outrigger dimension and why it is risky?
7. What is a junk dimension and when it helps?

## Advanced SCD
8. Explain SCD Type 0.
9. Explain SCD Type 4.
10. Explain SCD Type 6.
11. What is hybrid SCD?
12. How do you handle late arriving dimensions?
13. How do you handle late arriving facts?
14. What is backfilling in DWH?

## Advanced Incremental / CDC
15. Explain insert/update/delete handling in CDC.
16. What is soft delete vs hard delete?
17. What is merge/upsert?
18. How do you implement merge in Delta Lake / SQL?
19. What is reprocessing window (N days) and why used?

## Performance & Scaling
20. What is data skew?
21. What is distribution key in MPP systems?
22. Hash vs round-robin vs replicated distribution?
23. What is data movement and why it is costly?
24. How do you choose distribution keys?
25. What is partition pruning?
26. What is clustering (Snowflake) / Z-ORDER (Delta)?
27. What is materialized view?

## Governance / Metadata
28. What is metadata management?
29. What is data lineage?
30. What is data catalog?
31. What is data stewardship?
32. What is GDPR and how it impacts DWH?

## Security
33. Explain RBAC.
34. Explain row-level security (RLS).
35. Explain column-level security.
36. Explain dynamic data masking.
37. How do you protect PII in warehouse?

## Real World
38. What happens if your fact table has duplicates?
39. How do you detect duplicates in fact?
40. How do you design warehouse for near-real-time dashboards?
