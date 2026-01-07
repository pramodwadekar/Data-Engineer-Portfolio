"""
Basic data validation checks for Data Engineering
"""

import pandas as pd

def validate_data(df):
    checks = {
        "row_count": len(df),
        "null_counts": df.isnull().sum().to_dict(),
        "columns": list(df.columns)
    }
    return checks

def main():
    df = pd.read_csv("data/sales.csv")

    validation_result = validate_data(df)

    print("Data Validation Report:")
    print(validation_result)

if __name__ == "__main__":
    main()

