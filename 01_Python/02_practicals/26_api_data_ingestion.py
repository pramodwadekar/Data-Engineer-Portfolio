"""
API data ingestion using Python (Data Engineering use case)
"""

import requests
import pandas as pd

def fetch_api_data(url):
    response = requests.get(url, timeout=10)
    response.raise_for_status()
    return response.json()

def main():
    api_url = "https://jsonplaceholder.typicode.com/posts"

    try:
        data = fetch_api_data(api_url)
        df = pd.DataFrame(data)

        df.to_csv("output/api_data.csv", index=False)
        print("API data ingested and saved successfully")

    except requests.exceptions.RequestException as e:
        print("API request failed:", e)

if __name__ == "__main__":
    main()

