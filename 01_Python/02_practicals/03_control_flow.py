"""
Control flow examples for Data Engineering pipelines
"""

file_size_mb = 120
threshold_mb = 100

# Conditional logic
if file_size_mb > threshold_mb:
    print("Large file detected. Spark processing recommended.")
else:
    print("Small file. Pandas processing is sufficient.")

# Loop example
records_processed = 0

for i in range(1, 6):
    records_processed += 1
    print(f"Processing record {i}")

print("Total records processed:", records_processed)

