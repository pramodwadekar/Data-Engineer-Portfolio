"""
Simulated pipeline orchestration using Python
(Real orchestration is handled by ADF / Airflow)
"""

import logging

logging.basicConfig(level=logging.INFO)

def extract():
    logging.info("Extract step completed")

def transform():
    logging.info("Transform step completed")

def load():
    logging.info("Load step completed")

def main():
    logging.info("Pipeline started")

    extract()
    transform()
    load()

    logging.info("Pipeline finished successfully")

if __name__ == "__main__":
    main()

