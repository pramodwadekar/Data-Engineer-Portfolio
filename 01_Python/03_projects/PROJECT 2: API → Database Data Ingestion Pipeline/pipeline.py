"""
API → Database Data Ingestion Pipeline
"""

import json
import sqlite3
import pandas as pd

from logger import get_logger
from api_ingestion import fetch_api_data
from validation import validate_api_data
from db_handler import create_table, insert_data

logger = get_logger()

def load_config():
    with open("config.json") as f:
        return json.load(f)

def transform_api_data(data):
    logger.info("Transforming API data")
    return pd.DataFrame(data).rename(
        columns={
            "userId": "user_id",
            "id": "post_id"
        }
    )[["user_id", "post_id", "title", "body"]]

def main():
    try:
        logger.info("Pipeline started")

        config = load_config()

        # Extract
        logger.info("Fetching data from API")
        api_data = fetch_api_data(
            config["api_url"],
            config["request_timeout"]
        )

        # Validate
        validate_api_data(api_data)

        # Transform
        df = transform_api_data(api_data)

        # Load
        conn = sqlite3.connect(config["database_path"])
        create_table(conn, config["table_name"])
        insert_data(conn, df, config["table_name"])
        conn.close()

        logger.info("Pipeline completed successfully")

    except Exception as e:
        logger.error(f"Pipeline failed: {e}")
        raise

if __name__ == "__main__":
    main()
