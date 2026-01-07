"""
Date and time handling in Data Engineering
"""

from datetime import datetime, timedelta

def main():
    today = datetime.now()
    yesterday = today - timedelta(days=1)

    print("Today:", today.strftime("%Y-%m-%d"))
    print("Yesterday:", yesterday.strftime("%Y-%m-%d"))

if __name__ == "__main__":
    main()

