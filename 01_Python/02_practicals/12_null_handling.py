"""
Handling null values in Data Engineering
"""

import pandas as pd

def main():
    df = pd.read_csv("data/sales.csv")

    print("Null count before cleaning:")
    print(df.isnull().sum())

    df_cleaned = df.dropna()

    print("Null count after cleaning:")
    print(df_cleaned.isnull().sum())

if __name__ == "__main__":
    main()

