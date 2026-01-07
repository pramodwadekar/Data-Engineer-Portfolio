"""
Data validation logic
"""

def validate_api_data(data):
    if not data:
        raise ValueError("API returned empty data")

    if not isinstance(data, list):
        raise ValueError("Unexpected API response format")

    required_keys = {"userId", "id", "title", "body"}

    for record in data:
        if not required_keys.issubset(record.keys()):
            raise ValueError("Missing required keys in API data")

    return True
