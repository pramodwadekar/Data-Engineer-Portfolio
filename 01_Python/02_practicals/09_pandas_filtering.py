"""
Filtering data using pandas
"""

import pandas as pd

def main():
    df = pd.read_csv("data/sales.csv")

    filtered_df = df[df["amount"] > 1000]

    print("Filtered data:")
    print(filtered_df)

if __name__ == "__main__":
    main()

