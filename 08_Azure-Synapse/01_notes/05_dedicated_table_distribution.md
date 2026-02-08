# 05 - Dedicated SQL Pool: Table Distribution

Dedicated SQL pool is MPP.
Data is split across distributions.

## Distribution types
### 1) Round-robin
- default
- good for staging
- bad for joins

### 2) Hash distribution
- best for large fact tables
- choose join key (customer_id, product_id)

### 3) Replicated
- small dimension tables
- copied to all nodes
- fast joins

## Best practices
- Fact: hash distributed on common join key
- Dimensions: replicated (if small)
- Use round-robin for staging then CTAS into final

---
