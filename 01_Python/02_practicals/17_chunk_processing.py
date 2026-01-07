"""
Process large files using chunking (memory-safe approach)
"""

import pandas as pd

def main():
    file_path = "data/large_sales.csv"

    for chunk in pd.read_csv(file_path, chunksize=10000):
        print("Processing chunk with rows:", chunk.shape[0])
        # Example transformation
        total = chunk["amount"].sum()
        print("Chunk total:", total)

if __name__ == "__main__":
    main()

