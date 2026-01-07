"""
Basic functions for reusable Data Engineering logic
"""

def calculate_tax(amount, tax_rate=0.18):
    """
    Calculate tax for a given amount
    """
    return amount * tax_rate

def validate_amount(amount):
    """
    Validate amount value
    """
    if amount <= 0:
        return False
    return True

# Function usage
order_amount = 2000

if validate_amount(order_amount):
    tax = calculate_tax(order_amount)
    print("Tax amount:", tax)
else:
    print("Invalid order amount")

