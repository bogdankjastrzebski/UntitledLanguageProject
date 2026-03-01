# src/ffi.py
import os
import sys
import json
import ctypes
import subprocess
import llvmlite.binding as llvm
from .types import MachineInt, MachineFloat

class FFIManager:
    def __init__(self, backend):
        """Takes a reference to the LLVMBackend to access its target machine and modules."""
        self.backend = backend

    def _type_to_dict(self, machine_type):
        """Serializes our Machine Types to JSON metadata."""
        if isinstance(machine_type, MachineInt):
            return {"kind": "int", "bits": machine_type.bits}
        if isinstance(machine_type, MachineFloat):
            return {"kind": "float", "bits": machine_type.bits}
        raise NotImplementedError(f"Cannot serialize type {machine_type} for FFI.")

    def _dict_to_ctype(self, type_dict):
        """Deserializes JSON metadata directly into Python ctypes."""
        kind = type_dict["kind"]
        bits = type_dict["bits"]
        if kind == "int" and bits == 32:
            return ctypes.c_int32
        if kind == "float" and bits == 64:
            return ctypes.c_double
        if kind == "float" and bits == 32:
            return ctypes.c_float
        raise NotImplementedError(f"Cannot deserialize FFI type {type_dict}")

    def save_shared_library(self, lib_name, function_signatures):
        """
        Emits the LLVM module as an object file, links it into a shared library,
        and saves the function signatures into a .meta JSON file.
        
        function_signatures: dict of { "func_name": {"args": [MachineType...], "ret": MachineType} }
        """
        # 1. Determine platform extension
        ext = ".dll" if sys.platform == "win32" else ".dylib" if sys.platform == "darwin" else ".so"
        if not lib_name.endswith(ext):
            lib_name += ext

        # 2. Emit the Object File (.o)
        mod_parsed = llvm.parse_assembly(str(self.backend.module))
        obj_name = lib_name + ".o"
        with open(obj_name, "wb") as f:
            f.write(self.backend.target_machine.emit_object(mod_parsed))
            
        # 3. Invoke the system linker (gcc/clang) to create a shared library
        compiler_cmd = "gcc" if sys.platform != "darwin" else "clang"
        try:
            subprocess.run([compiler_cmd, "-shared", "-fPIC", "-o", lib_name, obj_name], check=True)
        except FileNotFoundError:
            raise RuntimeError(f"Could not find a C compiler ({compiler_cmd}) to link the shared library.")
        finally:
            # Clean up the intermediate object file
            if os.path.exists(obj_name):
                os.remove(obj_name)

        # 4. Generate the JSON Metadata sidecar
        meta_info = {"functions": {}}
        for fname, sig in function_signatures.items():
            meta_info["functions"][fname] = {
                "args": [self._type_to_dict(t) for t in sig["args"]],
                "ret": self._type_to_dict(sig["ret"])
            }
            
        with open(lib_name + ".meta", "w") as f:
            json.dump(meta_info, f, indent=2)
            
        print(f"[FFI] Saved library: {lib_name}")
        print(f"[FFI] Saved metadata: {lib_name}.meta")

    def load_shared_library(self, lib_name):
        """
        Reads the .meta file, loads the shared library, and returns a dictionary 
        of Python-callable functions.
        """
        # 1. Determine platform extension
        ext = ".dll" if sys.platform == "win32" else ".dylib" if sys.platform == "darwin" else ".so"
        if not lib_name.endswith(ext):
            lib_name += ext
            
        meta_file = lib_name + ".meta"
        
        # 2. Read Metadata
        if not os.path.exists(meta_file):
            raise FileNotFoundError(f"Metadata file {meta_file} not found. Cannot safely load {lib_name}.")
            
        with open(meta_file, "r") as f:
            meta_info = json.load(f)

        # 3. Load Library
        lib_path = os.path.abspath(lib_name)
        c_lib = ctypes.CDLL(lib_path)
        
        # 4. Bind Functions dynamically
        module_exports = {}
        for fname, sig in meta_info["functions"].items():
            try:
                c_func = getattr(c_lib, fname)
            except AttributeError:
                raise RuntimeError(f"Function '{fname}' listed in metadata but not found in binary.")
                
            c_func.argtypes = [self._dict_to_ctype(t) for t in sig["args"]]
            c_func.restype = self._dict_to_ctype(sig["ret"])
            module_exports[fname] = c_func
            
        return module_exports
