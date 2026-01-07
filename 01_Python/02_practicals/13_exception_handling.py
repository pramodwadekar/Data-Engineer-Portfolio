"""
Exception handling example for DE pipelines
"""

import pandas as pd

def main():
    try:
        df = pd.read_csv("data/input.csv")
        print("File read successfully")
    except FileNotFoundError:
        print("Input file not found")
    except Exception as e:
        print("Unexpected error:", e)

if __name__ == "__main__":
    main()

