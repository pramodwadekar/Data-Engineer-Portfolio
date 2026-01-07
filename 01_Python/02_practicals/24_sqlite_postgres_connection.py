"""
Database connection using SQLite (Postgres conceptually similar)
"""

import sqlite3

def main():
    conn = sqlite3.connect("example.db")
    cursor = conn.cursor()

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER,
            name TEXT
        )
    """)

    cursor.execute("INSERT INTO users VALUES (1, 'Alice')")
    conn.commit()

    cursor.execute("SELECT * FROM users")
    print(cursor.fetchall())

    conn.close()

if __name__ == "__main__":
    main()

