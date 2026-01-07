"""
Writing Parquet files for analytics workloads
"""

import pandas as pd

def main():
    df = pd.read_csv("data/sales.csv")

    output_path = "output/sales.parquet"
    df.to_parquet(output_path)

    print("Parquet file written successfully")

if __name__ == "__main__":
    main()

