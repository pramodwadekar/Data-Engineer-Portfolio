"""
Basic OOP-style pipeline for Data Engineering
"""

import pandas as pd

class ETLPipeline:
    def __init__(self, input_path, output_path):
        self.input_path = input_path
        self.output_path = output_path

    def run(self):
        df = pd.read_csv(self.input_path)
        df = df.dropna()
        df.to_csv(self.output_path, index=False)
        print("OOP pipeline completed")

def main():
    pipeline = ETLPipeline("data/input.csv", "output/output.csv")
    pipeline.run()

if __name__ == "__main__":
    main()

