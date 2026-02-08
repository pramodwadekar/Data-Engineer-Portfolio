# 14 — Real-World Synapse Design Patterns (Interview Level)

## Pattern 1: Lake → Serverless → CETAS → Power BI
Best for:
- low cost
- fast delivery

## Pattern 2: Lake → Dedicated SQL Pool → BI
Best for:
- enterprise BI
- high concurrency

## Pattern 3: Spark transformations + Dedicated serving
Best for:
- heavy transformations
- large scale

## Interview points
Always justify why you choose serverless vs dedicated.
