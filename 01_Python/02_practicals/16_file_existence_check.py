"""
Check file existence before processing
"""

import os

def main():
    file_path = "data/input.csv"

    if os.path.exists(file_path):
        print("File exists. Proceeding with pipeline.")
    else:
        print("File does not exist. Stopping pipeline.")

if __name__ == "__main__":
    main()

