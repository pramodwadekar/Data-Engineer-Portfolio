## 11. Why are loops slow in pandas, and how do you avoid them?

### Answer:
Loops are slow because pandas is optimized for vectorized operations.

To avoid loops:

- Use built-in pandas functions

- Use column-level operations instead of row-by-row loops

## 12. What are vectorized operations in pandas?

### Answer:
Vectorized operations apply calculations to entire columns at once,
instead of looping through rows.

They are:

- Faster

- Memory-efficient

- Optimized internally

## 13. How do you profile Python code in data pipelines?

### Answer:
By:

- Measuring execution time of steps

- Logging start and end times

- Identifying slow transformations

- Optimizing only the bottlenecks

Deep profiling is usually avoided; Spark handles heavy workloads.

## 14. When would you completely avoid Python for data processing?

### Answer:
When:

- Data size is very large

- Processing requires distributed computing

- Performance is critical

In such cases, Spark or SQL engines are more suitable than Python.
