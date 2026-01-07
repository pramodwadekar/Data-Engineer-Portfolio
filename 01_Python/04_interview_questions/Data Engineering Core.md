## 1. How do you design a Python ETL pipeline that is reusable across environments?

### Answer:
By using a config-driven and modular design.

- Store file paths, DB details, and parameters in config files

- Keep logic separate from configuration

- Use reusable functions for extract, transform, load

This allows the same pipeline to run in dev, test, and prod without code changes.

## 2. How do you prevent bad data from entering downstream systems using Python?

### Answer:
By adding a validation layer before transformations:

- Check schema and required columns

- Check null values and data types

- Validate row counts and business rules

If validation fails, the pipeline stops and logs the error.

## 3. How do you handle partial pipeline failures in Python?

### Answer:
Using try-except blocks with logging:

- Catch failures at each stage

- Log the error clearly

- Stop the pipeline for critical failures

- Allow retries only for recoverable errors

This avoids silent data corruption.

## 4. How do you decide which transformations should be done in Python vs SQL vs Spark?

### Answer:

- Python → validation, light preprocessing, orchestration

- SQL → joins, aggregations, analytics

- Spark → large-scale, distributed processing

## Rule of thumb:

- Small data → Python
- Structured analytics → SQL
- Big data → Spark
