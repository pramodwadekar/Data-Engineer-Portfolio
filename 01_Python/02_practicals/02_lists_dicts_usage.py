"""
Usage of lists and dictionaries in Data Engineering
"""

# List of records
orders = [
    {"order_id": 1, "amount": 500},
    {"order_id": 2, "amount": 1500},
    {"order_id": 3, "amount": 700}
]

# Dictionary for configuration
pipeline_config = {
    "source": "csv",
    "destination": "data_lake",
    "max_retries": 2
}

# Iterate over list
for order in orders:
    print(f"Order ID: {order['order_id']}, Amount: {order['amount']}")

# Access dictionary values
print("Source type:", pipeline_config["source"])
print("Destination:", pipeline_config["destination"])
print("Max retries:", pipeline_config["max_retries"])

