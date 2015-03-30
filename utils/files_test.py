import unittest

import files

class TestFiles(unittest.TestCase):
    def test_modify_name(self):
        self.assertEqual(
            files.modify_name('123 dash separated', (' '), '-')
            , '123-dash-separated')
        self.assertEqual(
            files.modify_name('123,underscore separated', (' ', ','), '_')
            , '123_underscore_separated')

    def test_rename_according_to_naming_conventions(self):
        self.assertEqual(
            files.rename_according_to_naming_conventions('123 [] () {} dash separated', "")
            , '123-dash-separated')
        self.assertEqual(
            files.rename_according_to_naming_conventions('les ;copains :d-\'abord!?,', "")
            , 'les-copains-d\'abord')
        self.assertEqual(
            files.rename_according_to_naming_conventions('les _ copains - d-\'abord!?,', "")
            , 'les-copains-d\'abord')
        
        
if __name__ == '__main__':
    unittest.main()
            
