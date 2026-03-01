import os
import sys
import ctypes

# =================================================================
# PART 1: THE VENDOR (Our Lisp Compiler)
# This simulates you compiling your code on your machine.
# =================================================================
def compile_library():
    print("--- 1. COMPILING ---")
    from src.parser import tokenize, parse
    from src.backend import LLVMBackend
    from src.ffi import FFIManager
    from src.types import MachineInt

    # Our Lisp code
    source = """
    (if (machine-gt price 100)
        (machine-add price -20)
        price)
    """
    ast = parse(tokenize(source))

    backend = LLVMBackend()
    ffi = FFIManager(backend)
    
    # Compile and save to 'discount_lib.so' / '.dll'
    backend.compile_function(
        name="calculate_discount",
        arg_names=["price"],
        arg_types=[MachineInt(32)],
        ret_type=MachineInt(32),
        ast=ast
    )
    
    ffi.save_shared_library("discount_lib", {
        "calculate_discount": {
            "args": [MachineInt(32)],
            "ret": MachineInt(32)
        }
    })
    print("Compilation finished. Shared library generated.\n")


# =================================================================
# PART 2: THE CLIENT ("Elsewhere")
# This simulates a completely different program (like a web server)
# loading your compiled binary. NO LISP CODE IS IMPORTED HERE.
# =================================================================
def run_elsewhere():
    print("--- 2. RUNNING ELSEWHERE ---")
    ext = ".dll" if sys.platform == "win32" else ".dylib" if sys.platform == "darwin" else ".so"
    lib_file = os.path.abspath("discount_lib" + ext)
    
    print(f"Loading bare-metal binary: {lib_file}")
    
    # We use Python's built-in ctypes. This could easily be Node.js, Rust, or C++.
    raw_c_lib = ctypes.CDLL(lib_file)
    
    # Tell Python the C-signature: int32 calculate_discount(int32)
    calculate_discount = raw_c_lib.calculate_discount
    calculate_discount.argtypes = [ctypes.c_int32]
    calculate_discount.restype = ctypes.c_int32
    
    # Execute the hardware binary!
    prices = [50, 100, 150, 200]
    for p in prices:
        final_price = calculate_discount(p)
        print(f"Original Price: ${p}  =>  Final Price: ${final_price}")

    # Cleanup the files so we don't clutter your folder
    os.remove("discount_lib" + ext)
    os.remove("discount_lib" + ext + ".meta")

if __name__ == "__main__":
    compile_library()
    
    # Imagine transferring the .so file to a different computer right here.
    
    run_elsewhere()
