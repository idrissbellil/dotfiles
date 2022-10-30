return {
    s("asynctest", { t "class Test(unittest.IsolatedAsyncioTestCase):" }),
    s("vcr", { t "@vcr.use_cassette()" }),
    s("logger", { t "_LOGGER = logging.getLogger(__name__)" }),
    s("mapping", { t "MappingProxyType()" }),
    s("pdb", { t "import pdb; pdb.set_trace()" }),
    s("debug", { t "import pdb; pdb.set_trace()" }),
    s("pudb", { t "from pudb import set_trace; set_trace()" }),
}
