"""
API ingestion logic
"""

import requests

def fetch_api_data(api_url, timeout):
    response = requests.get(api_url, timeout=timeout)
    response.raise_for_status()
    return response.json()
