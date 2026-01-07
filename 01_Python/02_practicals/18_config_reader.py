"""
Read configuration from JSON file
"""

import json

def read_config(config_path):
    with open(config_path, "r") as file:
        return json.load(file)

def main():
    config = read_config("config.json")
    print("Configuration loaded:", config)

if __name__ == "__main__":
    main()

