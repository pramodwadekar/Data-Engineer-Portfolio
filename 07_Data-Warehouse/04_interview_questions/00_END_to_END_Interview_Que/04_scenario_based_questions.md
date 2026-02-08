# 04 — Scenario Based Questions (Most Important)

These are the questions interviewers ask to test real experience.

## Modeling Scenarios
1. Design a sales data warehouse for an e-commerce company.
2. What would be the grain of your sales fact table?
3. How will you model order lifecycle (created → shipped → delivered)?
4. When will you use accumulating snapshot?

## SCD Scenarios
5. Customer changes city. Which SCD type and why?
6. Product price changes. Should it be SCD2 or Type1? Why?
7. A dimension attribute is corrected (typo). Which SCD type?
8. How will you handle customer merge (duplicate customers)?

## Incremental Load Scenarios
9. Your source has no updated timestamp. How do you do incremental load?
10. Your source sends full file daily. How do you process incrementally?
11. Data arrives late for last 3 days. What will you do?
12. How do you handle deletes in incremental load?

## Data Quality Scenarios
13. Business says KPI does not match. How will you debug?
14. Fact table totals do not match source. What steps you take?
15. Dimension has duplicates. How will you fix?

## Performance Scenarios
16. Your dashboard query is slow. How will you optimize?
17. Fact table is 5 TB. How will you design partitions?
18. Data skew in MPP. How will you handle?

## Security Scenarios
19. Finance data must be visible only to finance users. How do you implement?
20. Region-wise access needed (West team sees only West). How?

---

## Interview Tip
In scenario answers, always talk about:
- grain
- SCD
- incremental strategy
- DQ checks
- performance
