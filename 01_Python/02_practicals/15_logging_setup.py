"""
Logging setup for Data Engineering pipelines
"""

import logging

def main():
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s - %(levelname)s - %(message)s"
    )

    logging.info("Pipeline started")

    try:
        logging.info("Processing data")
        raise ValueError("Sample error")
    except Exception as e:
        logging.error(f"Error occurred: {e}")

    logging.info("Pipeline finished")

if __name__ == "__main__":
    main()

