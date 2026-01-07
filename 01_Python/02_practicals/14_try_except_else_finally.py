"""
try-except-else-finally usage in DE pipelines
"""

import pandas as pd

def main():
    try:
        df = pd.read_csv("data/input.csv")
    except FileNotFoundError:
        print("File not found")
    else:
        print("File read successfully")
        print(df.head())
    finally:
        print("Pipeline step execution completed")

if __name__ == "__main__":
    main()

