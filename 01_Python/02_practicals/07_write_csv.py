"""
Writing CSV files using pandas
"""

import pandas as pd

def main():
    data = {
        "id": [1, 2, 3],
        "name": ["A", "B", "C"],
        "amount": [100, 200, 300]
    }

    df = pd.DataFrame(data)
    output_path = "output/sample_output.csv"

    df.to_csv(output_path, index=False)
    print("CSV file written successfully")

if __name__ == "__main__":
    main()

