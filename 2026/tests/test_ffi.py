# tests/test_ffi.py
import unittest
import os
import sys
from src.parser import parse, tokenize
from src.backend import LLVMBackend
from src.ffi import FFIManager
from src.types import MachineInt

class TestFFI(unittest.TestCase):
    def setUp(self):
        self.backend = LLVMBackend()
        self.ffi = FFIManager(self.backend)
        self.lib_name = "test_math_lib"
        self.ext = ".dll" if sys.platform == "win32" else ".dylib" if sys.platform == "darwin" else ".so"

    def tearDown(self):
        # Cleanup generated files after test
        for file in [self.lib_name + self.ext, self.lib_name + self.ext + ".meta"]:
            if os.path.exists(file):
                os.remove(file)

    def test_save_and_load(self):
        # 1. Compile a function into the backend module
        source = "(machine-add x y)"
        ast = parse(tokenize(source))
        
        func_name = "my_fast_add"
        self.backend.compile_function(
            name=func_name,
            arg_names=["x", "y"],
            arg_types=[MachineInt(32), MachineInt(32)],
            ret_type=MachineInt(32),
            ast=ast
        )
        
        # 2. Save it to disk with metadata
        signatures = {
            func_name: {
                "args": [MachineInt(32), MachineInt(32)],
                "ret": MachineInt(32)
            }
        }
        self.ffi.save_shared_library(self.lib_name, signatures)
        
        # Assert files exist
        self.assertTrue(os.path.exists(self.lib_name + self.ext))
        self.assertTrue(os.path.exists(self.lib_name + self.ext + ".meta"))
        
        # 3. Blindly load it back (simulating a completely fresh python process)
        loaded_module = self.ffi.load_shared_library(self.lib_name)
        self.assertIn(func_name, loaded_module)
        
        # 4. Execute the loaded function
        fast_add = loaded_module[func_name]
        result = fast_add(100, 250)
        
        self.assertEqual(result, 350)

if __name__ == '__main__':
    unittest.main()
