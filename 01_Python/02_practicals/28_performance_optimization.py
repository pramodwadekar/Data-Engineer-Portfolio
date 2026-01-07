"""
Basic performance optimization techniques in Python for DE
"""

import pandas as pd

def main():
    file_path = "data/large_sales.csv"

    total_amount = 0

    # Chunk-based processing (memory efficient)
    for chunk in pd.read_csv(file_path, chunksize=5000):
        total_amount += chunk["amount"].sum()

    print("Total amount:", total_amount)
    print("Used chunking to avoid memory issues")

if __name__ == "__main__":
    main()

