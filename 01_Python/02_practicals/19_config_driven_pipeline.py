"""
Config-driven ETL pipeline
"""

import pandas as pd
import json

def main():
    with open("config.json") as f:
        config = json.load(f)

    df = pd.read_csv(config["input_path"])
    df = df.dropna()

    df.to_csv(config["output_path"], index=False)
    print("Pipeline executed successfully")

if __name__ == "__main__":
    main()

