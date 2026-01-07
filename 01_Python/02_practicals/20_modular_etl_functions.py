"""
Modular ETL functions for reuse
"""

import pandas as pd

def read_data(path):
    return pd.read_csv(path)

def transform_data(df):
    return df[df["amount"] > 500]

def write_data(df, path):
    df.to_csv(path, index=False)

def main():
    df = read_data("data/sales.csv")
    df = transform_data(df)
    write_data(df, "output/filtered_sales.csv")
    print("ETL completed")

if __name__ == "__main__":
    main()

