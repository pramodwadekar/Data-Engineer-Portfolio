"""
GroupBy aggregations using pandas
"""

import pandas as pd

def main():
    df = pd.read_csv("data/sales.csv")

    summary = df.groupby("category")["amount"].sum().reset_index()

    print("Aggregated data:")
    print(summary)

if __name__ == "__main__":
    main()

