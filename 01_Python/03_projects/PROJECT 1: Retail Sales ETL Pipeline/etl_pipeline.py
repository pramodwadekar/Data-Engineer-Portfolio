"""
Retail Sales ETL Pipeline (Python for Data Engineering)
"""

import pandas as pd
import json
from logger import get_logger
from validation import validate_dataframe

logger = get_logger()

def load_config():
    with open("config.json") as f:
        return json.load(f)

def extract(input_path):
    logger.info("Reading input sales data")
    return pd.read_csv(input_path)

def transform(df, min_amount):
    logger.info("Starting data transformation")

    # Remove null values
    df = df.dropna()

    # Filter invalid amounts
    df = df[df["amount"] >= min_amount]

    # Aggregate sales by category
    summary = (
        df.groupby("category")["amount"]
        .sum()
        .reset_index()
        .rename(columns={"amount": "total_sales"})
    )

    return summary

def load(df, output_path):
    logger.info("Writing transformed data")
    df.to_csv(output_path, index=False)

def main():
    try:
        config = load_config()

        df = extract(config["input_path"])
        validate_dataframe(df)

        result_df = transform(df, config["min_amount"])
        load(result_df, config["output_path"])

        logger.info("Retail Sales ETL Pipeline completed successfully")

    except Exception as e:
        logger.error(f"Pipeline failed: {e}")
        raise

if __name__ == "__main__":
    main()
