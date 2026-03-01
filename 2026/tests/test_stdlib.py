# tests/test_stdlib.py
import unittest
import os
import sys
import ctypes
from src.parser import tokenize, parse
from src.interpreter import MetaCompiler
from src.backend import LLVMBackend
from src.ffi import FFIManager
from src.types import MachineInt

class TestStdlibAndFFI(unittest.TestCase):
    def setUp(self):
        self.compiler = MetaCompiler()
        
        # 1. Load the Standard Library
        with open("lib/stdlib.lisp", "r") as f:
            stdlib_code = f.read()
            
        tokens = tokenize(stdlib_code)
        while tokens:
            self.compiler.eval(parse(tokens))

    def test_c_struct_in_interpreter(self):
        """Tests that our Lisp-defined C-struct (Point) works correctly."""
        # Create a point (10, 20) and shift X by 5
        res = self.compiler.eval(parse(tokenize("(shift-point-x (make-point 10 20) 5)")))
        
        self.assertEqual(res.label, "Point")
        # Memory layout [X, Y]
        self.assertEqual(res.value, [15, 20]) 

    def test_run_compiled_function_elsewhere(self):
        """Tests compiling an AST, saving it to disk, and running it via standard C-types."""
        backend = LLVMBackend()
        ffi = FFIManager(backend)
        lib_name = "compiled_stdlib_test"
        
        # We define a raw machine-algebra function to compile
        # (if x > 100 return x + 1 else return x)
        ast = parse(tokenize("(if (machine-gt x 100) (machine-add x 1) x)"))
        
        backend.compile_function(
            name="process_value",
            arg_names=["x"],
            arg_types=[MachineInt(32)],
            ret_type=MachineInt(32),
            ast=ast
        )
        
        # Save to disk as .so / .dll
        ffi.save_shared_library(lib_name, {
            "process_value": {
                "args": [MachineInt(32)],
                "ret": MachineInt(32)
            }
        })
        
        # --- RUNNING IT "ELSEWHERE" ---
        # We load the raw .so file using Python's standard ctypes, completely 
        # ignoring our Lisp compiler. This proves it is a standalone binary!
        ext = ".dll" if sys.platform == "win32" else ".dylib" if sys.platform == "darwin" else ".so"
        raw_c_lib = ctypes.CDLL(os.path.abspath(lib_name + ext))
        
        # Setup the C signature
        compiled_func = raw_c_lib.process_value
        compiled_func.argtypes = [ctypes.c_int32]
        compiled_func.restype = ctypes.c_int32
        
        # Execute the hardware binary
        self.assertEqual(compiled_func(150), 151) # > 100, adds 1
        self.assertEqual(compiled_func(50), 50)   # < 100, returns x
        
        # Cleanup
        os.remove(lib_name + ext)
        os.remove(lib_name + ext + ".meta")

if __name__ == '__main__':
    unittest.main()
