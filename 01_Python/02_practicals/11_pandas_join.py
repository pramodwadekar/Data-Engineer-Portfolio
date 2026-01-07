"""
Joining datasets using pandas
"""

import pandas as pd

def main():
    customers = pd.read_csv("data/customers.csv")
    orders = pd.read_csv("data/orders.csv")

    joined_df = pd.merge(customers, orders, on="customer_id", how="inner")

    print("Joined data:")
    print(joined_df.head())

if __name__ == "__main__":
    main()

