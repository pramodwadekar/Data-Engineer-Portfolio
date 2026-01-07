"""
Reading CSV files using pandas (Data Engineering use case)
"""

import pandas as pd

def read_csv_file(file_path):
    """
    Read CSV file and return DataFrame
    """
    return pd.read_csv(file_path)

def main():
    file_path = "data/customers.csv"

    try:
        df = read_csv_file(file_path)
        print("CSV file read successfully")
        print(df.head())
    except FileNotFoundError:
        print("CSV file not found")
    except Exception as e:
        print("Error reading CSV:", e)

if __name__ == "__main__":
    main()

