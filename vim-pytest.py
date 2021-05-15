#!/home/<path-to-virtualenv>
import unittest
import sys


if __name__ == '__main__':
    module_path_name = sys.argv[-1]
    if module_path_name == 'all':
        kw_args = {'argv': [sys.argv[0], 'discover']}
        unittest.main(argv=[sys.argv[0], 'discover'])
    else:
        path_name = module_path_name.strip('.py').replace('/', '.')
        unittest.main(argv=[sys.argv[0]], module=path_name)
