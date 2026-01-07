"""
Reading JSON files in Data Engineering
"""

import json

def read_json_file(file_path):
    with open(file_path, "r") as file:
        return json.load(file)

def main():
    file_path = "data/events.json"

    try:
        data = read_json_file(file_path)
        print("JSON file read successfully")
        print(data)
    except FileNotFoundError:
        print("JSON file not found")
    except Exception as e:
        print("Error reading JSON:", e)

if __name__ == "__main__":
    main()

