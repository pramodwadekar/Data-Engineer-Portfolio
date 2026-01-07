6. How do you process very large CSV files using Python without running out of memory?

Answer:
By using chunk-based processing:

pd.read_csv("file.csv", chunksize=10000)


This processes data in small batches instead of loading everything into memory.

7. How do you validate file schema before processing?

Answer:
By checking:

Required column names

Data types

Nullability

If schema validation fails, the pipeline stops immediately.

8. How do you handle duplicate records in Python pipelines?

Answer:
By using pandas functions:

Identify duplicates using key columns

Remove duplicates using drop_duplicates()

This ensures data consistency before loading.

9. How do you version output files in data pipelines?

Answer:
By adding:

Timestamps

Batch IDs

Date partitions

Example:

sales_summary_2024_01_01.csv


This helps with traceability and rollback.

10. How do you handle corrupt or malformed files?

Answer:
By:

Wrapping file reads in try-except blocks

Logging errors

Moving bad files to a quarantine folder

Stopping the pipeline if data is unusable
