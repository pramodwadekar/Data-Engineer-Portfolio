"""
Database handling logic (SQLite)
"""

import sqlite3
import pandas as pd

def create_table(conn, table_name):
    query = f"""
    CREATE TABLE IF NOT EXISTS {table_name} (
        user_id INTEGER,
        post_id INTEGER,
        title TEXT,
        body TEXT
    )
    """
    conn.execute(query)
    conn.commit()

def insert_data(conn, df, table_name):
    df.to_sql(table_name, conn, if_exists="append", index=False)

def read_data(conn, table_name):
    return pd.read_sql(f"SELECT * FROM {table_name}", conn)
