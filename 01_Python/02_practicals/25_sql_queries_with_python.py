"""
Execute SQL queries using Python
"""

import sqlite3
import pandas as pd

def main():
    conn = sqlite3.connect("example.db")

    query = "SELECT * FROM users"
    df = pd.read_sql(query, conn)

    print("Query result:")
    print(df)

    conn.close()

if __name__ == "__main__":
    main()

