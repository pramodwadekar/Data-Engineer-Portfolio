"""
Data validation logic for Retail ETL
"""

def validate_dataframe(df):
    if df.empty:
        raise ValueError("Input DataFrame is empty")

    required_columns = {"order_id", "category", "amount", "order_date"}

    if not required_columns.issubset(df.columns):
        raise ValueError("Missing required columns")

    return True
