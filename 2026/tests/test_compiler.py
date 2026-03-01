import unittest
import ctypes
from src.parser import parse, tokenize
from src.backend import LLVMBackend
from src.types import MachineInt

class TestCompiler(unittest.TestCase):
    def setUp(self):
        """Initialize a fresh LLVM backend before each test."""
        self.backend = LLVMBackend()

    def test_compile_and_execute(self):
        """Test compiling an AST to machine code and executing it natively."""
        
        # We are bypassing the interpreter and feeding the backend a raw Machine Algebra AST.
        # Logic: if x > 10 then x + 5 else x + 100
        source_code = """
        (if (machine-gt x 10)
            (machine-add x 5)
            (machine-add x 100))
        """
        ast = parse(tokenize(source_code))
        
        # 1. Compile the function to LLVM IR
        func_name = "test_math_branching"
        self.backend.compile_function(
            name=func_name,
            arg_names=["x"],                  # The local variable name
            arg_types=[MachineInt(32)],       # i32
            ret_type=MachineInt(32),          # i32
            ast=ast                           # The parsed list
        )
        
        # 2. Finalize the module and get the raw executable memory pointer
        func_ptr = self.backend.finalize_and_get_ptr(func_name)
        
        # 3. Create a C-compatible Python wrapper using ctypes
        # CFUNCTYPE(Return_Type, Arg1_Type, ...)
        c_func_type = ctypes.CFUNCTYPE(ctypes.c_int32, ctypes.c_int32)
        compiled_func = c_func_type(func_ptr)
        
        # 4. EXECUTE NATIVELY ON THE CPU!
        
        # Test 'Then' branch: 20 > 10 => 20 + 5 = 25
        res_then = compiled_func(20)
        self.assertEqual(res_then, 25)
        
        # Test 'Else' branch: 5 is not > 10 => 5 + 100 = 105
        res_else = compiled_func(5)
        self.assertEqual(res_else, 105)

if __name__ == '__main__':
    unittest.main()
