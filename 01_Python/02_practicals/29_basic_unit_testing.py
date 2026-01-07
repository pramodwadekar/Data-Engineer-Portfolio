"""
Basic unit testing for Data Engineering functions
"""

import unittest

def calculate_total(amounts):
    return sum(amounts)

class TestETLFunctions(unittest.TestCase):

    def test_calculate_total(self):
        self.assertEqual(calculate_total([100, 200, 300]), 600)

    def test_empty_list(self):
        self.assertEqual(calculate_total([]), 0)

if __name__ == "__main__":
    unittest.main()

