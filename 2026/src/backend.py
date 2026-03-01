# src/backend.py
import llvmlite.ir as ir
import llvmlite.binding as llvm
from .types import MachineInt, MachineFloat

class LLVMBackend:
    def __init__(self):
        # Initialize LLVM backend
        llvm.initialize()
        llvm.initialize_native_target()
        llvm.initialize_native_asmprinter()
        
        self.module = ir.Module(name="lisp_machine_core")
        self.target = llvm.Target.from_default_triple()
        self.target_machine = self.target.create_target_machine(reloc='pic')
        
        # Create the JIT execution engine
        backing_mod = llvm.parse_assembly("")
        self.engine = llvm.create_mcjit_compiler(backing_mod, self.target_machine)

    def get_llvm_type(self, machine_type):
        """Maps our Machine Algebra types to LLVM IR types."""
        if isinstance(machine_type, MachineInt):
            return ir.IntType(machine_type.bits)
        if isinstance(machine_type, MachineFloat):
            return ir.DoubleType() if machine_type.bits == 64 else ir.FloatType()
        raise NotImplementedError(f"LLVM type mapping for {machine_type} not implemented.")

    def compile_function(self, name, arg_names, arg_types, ret_type, ast):
        """Creates an LLVM function and compiles the AST into it."""
        llvm_arg_types = [self.get_llvm_type(t) for t in arg_types]
        llvm_ret_type = self.get_llvm_type(ret_type)
        
        func_type = ir.FunctionType(llvm_ret_type, llvm_arg_types)
        func = ir.Function(self.module, func_type, name=name)
        
        block = func.append_basic_block(name="entry")
        builder = ir.IRBuilder(block)
        
        # Create a local environment mapping variable names to LLVM function arguments
        local_env = {}
        for i, arg_name in enumerate(arg_names):
            func.args[i].name = arg_name
            local_env[arg_name] = func.args[i]
            
        # Emit the function body
        ret_val = self._emit(builder, ast, local_env, func)
        builder.ret(ret_val)
        
        return func

    def _emit(self, builder, expr, env, func):
        """Recursively translates machine-* AST nodes into LLVM instructions."""
        # 1. Primitives & Variables
        if isinstance(expr, int):
            return ir.Constant(ir.IntType(32), expr)
        if isinstance(expr, float):
            return ir.Constant(ir.DoubleType(), expr)
        if isinstance(expr, str):
            return env[expr]
            
        op = expr[0]
        
        # 2. Machine Math
        if op == 'machine-add':
            a = self._emit(builder, expr[1], env, func)
            b = self._emit(builder, expr[2], env, func)
            # Assuming i32 for this v0.1 implementation
            return builder.add(a, b, name="addtmp")
            
        elif op == 'machine-gt':
            a = self._emit(builder, expr[1], env, func)
            b = self._emit(builder, expr[2], env, func)
            # icmp_signed = Integer Compare Signed
            return builder.icmp_signed('>', a, b, name="gttmp")
            
        # 3. Control Flow (The PHI Node)
        elif op == 'if':
            cond_val = self._emit(builder, expr[1], env, func)
            
            # Create the 3 blocks needed for an if-statement
            then_bb = func.append_basic_block(name="then")
            else_bb = func.append_basic_block(name="else")
            merge_bb = func.append_basic_block(name="ifcont")
            
            # Branch based on the condition
            builder.cbranch(cond_val, then_bb, else_bb)
            
            # --- Compile 'Then' Branch ---
            builder.position_at_end(then_bb)
            then_val = self._emit(builder, expr[2], env, func)
            builder.branch(merge_bb)
            then_bb = builder.block # Update in case _emit created nested blocks
            
            # --- Compile 'Else' Branch ---
            builder.position_at_end(else_bb)
            else_val = self._emit(builder, expr[3], env, func)
            builder.branch(merge_bb)
            else_bb = builder.block
            
            # --- Compile 'Merge' Branch (PHI) ---
            builder.position_at_end(merge_bb)
            # The PHI node dynamically picks the value depending on which block we just came from
            phi = builder.phi(ir.IntType(32), name="iftmp") 
            phi.add_incoming(then_val, then_bb)
            phi.add_incoming(else_val, else_bb)
            
            return phi
            
        raise NotImplementedError(f"Backend cannot emit AST node: {op}")

    def finalize_and_get_ptr(self, func_name):
        """Compiles the LLVM IR into machine code and returns the memory address."""
        # Parse the string representation of our module into the Execution Engine
        mod_parsed = llvm.parse_assembly(str(self.module))
        mod_parsed.verify()
        
        self.engine.add_module(mod_parsed)
        self.engine.finalize_object()
        
        # Return the raw pointer to the executable memory
        return self.engine.get_function_address(func_name)
