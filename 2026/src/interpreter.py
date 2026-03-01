# src/interpreter.py
from .types import PrimalBox, AbstractVal, UnionVal

class MetaCompiler:
    def __init__(self):
        # The global environment
        self.env = {}

    def eval(self, expr, env=None):
        if env is None: 
            env = self.env
            
        # 1. Self-Evaluating Primitives & Boxed Types
        if isinstance(expr, (int, float)): return expr
        if isinstance(expr, str): return env.get(expr, expr) # Symbol lookup
        if isinstance(expr, (PrimalBox, AbstractVal, UnionVal)): return expr

        # It's a list (AST node)
        if not isinstance(expr, list) or not expr:
            return expr

        op = expr[0]
        
        # ==========================================
        # CORE LANGUAGE FORMS
        # ==========================================
        if op == 'quote':
            return expr[1]

        elif op == 'define':
            # (define (foo x y) body) OR (define x 10)
            if isinstance(expr[1], list):
                name, args = expr[1][0], expr[1][1:]
                env[name] = {'type': 'closure', 'args': args, 'body': expr[2], 'env': env}
            else:
                env[expr[1]] = self.eval(expr[2], env)
            return None

        elif op == 'lambda':
            # (lambda (x y) body)
            args, body = expr[1], expr[2]
            return {'type': 'closure', 'args': args, 'body': body, 'env': env}

        elif op == 'if':
            cond = self.eval(expr[1], env)
            # Use a strict check to ensure we don't accidentally return None
            # when we meant to return the result of the branch
            if isinstance(cond, bool):
                return self.eval(expr[2] if cond else expr[3], env)
            
            # For symbolic/union execution:
            branch_a = self.eval(expr[2], env)
            branch_b = self.eval(expr[3], env)
            return UnionVal(branch_a, branch_b).collapse()

        # ==========================================
        # PRIMAL BOXING & ABSTRACT TYPE QUERIES
        # ==========================================
        elif op == 'box':
            return PrimalBox(self.eval(expr[1], env), self.eval(expr[2], env))
            
        elif op == 'abstract':
            return AbstractVal(self.eval(expr[1], env))
            
        elif op == 'get-label':
            val = self.eval(expr[1], env)
            if isinstance(val, PrimalBox): return val.label
            if isinstance(val, AbstractVal): return val.label
            raise ValueError(f"Cannot get label of unboxed value: {val}")

        # ADD THIS BLOCK RIGHT HERE:
        elif op == 'get-value':
            val = self.eval(expr[1], env)
            if isinstance(val, PrimalBox): return val.value
            raise ValueError(f"Cannot get value of unboxed value: {val}")

        elif op == 'infer':
            # (infer func_name abstract_arg1 abstract_arg2 ...)
            func = self.eval(expr[1], env)
            args = [self.eval(arg, env) for arg in expr[2:]]
            
            # Create a local scope for symbolic execution
            local_env = func['env'].copy()
            for n, v in zip(func['args'], args): 
                local_env[n] = v
                
            return self.eval(func['body'], local_env)

        # ==========================================
        # MACHINE ALGEBRA (The Dumb Backend Primitives)
        # ==========================================
        elif isinstance(op, str) and op.startswith('machine-'):
            # Pre-evaluate arguments
            args = [self.eval(arg, env) for arg in expr[1:]]
            
            # --- ELEMENT-WISE UNION PROPAGATION ---
            # If any argument is a UnionVal, distribute the operation across all possibilities
            for i, arg in enumerate(args):
                if isinstance(arg, UnionVal):
                    results = []
                    for possibility in arg.possibilities:
                        # Construct a new AST with the concrete possibility and evaluate it
                        new_expr = [op] + args[:i] + [possibility] + args[i+1:]
                        results.append(self.eval(new_expr, env))
                    return UnionVal(*results).collapse()

            # --- CONCRETE & ABSTRACT MATH LOGIC ---
            if op == 'machine-add':
                a, b = args[0], args[1]
                if isinstance(a, (int, float)) and isinstance(b, (int, float)): 
                    return a + b
                if isinstance(a, PrimalBox) and isinstance(b, PrimalBox):
                    # Maintain the label of the first operand for now
                    return PrimalBox(a.label, a.value + b.value)
                if isinstance(a, AbstractVal) or isinstance(b, AbstractVal):
                    # Algebraic Type Rules
                    return AbstractVal("Int")

            elif op == 'machine-gt': # Greater than (>)
                a, b = args[0], args[1]
                if isinstance(a, AbstractVal) or isinstance(b, AbstractVal): 
                    return AbstractVal("Bool") # Unknown boolean result triggers a fork
                if isinstance(a, PrimalBox): a = a.value
                if isinstance(b, PrimalBox): b = b.value
                return a > b

            # --- Inside src/interpreter.py, under machine-add ---
            elif op == 'machine-eq':
                a, b = args[0], args[1]
                if isinstance(a, PrimalBox): a = a.value
                if isinstance(b, PrimalBox): b = b.value
                return a == b
                
            # --- STRUCT MEMORY SIMULATION ---
            elif op == 'machine-alloc': 
                return [0] * args[0] # Simulates allocating an array/struct of size N
            elif op == 'machine-set': 
                args[0][args[1]] = args[2] # Set field index
                return args[0]
            elif op == 'machine-get': 
                return args[0][args[1]] # Get field index

        # ==========================================
        # LISTS & DATA STRUCTURES
        # ==========================================
        elif op == 'cons':
            return [self.eval(expr[1], env)] + self.eval(expr[2], env)
        elif op == 'first':
            return self.eval(expr[1], env)[0]
        elif op == 'rest':
            return self.eval(expr[1], env)[1:]
        elif op == 'empty?':
            lst = self.eval(expr[1], env)
            return len(lst) == 0

        # ==========================================
        # FUNCTION APPLICATION
        # ==========================================
        else:
            func = self.eval(op, env)
            args = [self.eval(arg, env) for arg in expr[1:]]
            
            if isinstance(func, dict) and func.get('type') == 'closure':
                local_env = func['env'].copy()
                for n, v in zip(func['args'], args): 
                    local_env[n] = v
                return self.eval(func['body'], local_env)
            else:
                raise RuntimeError(f"Attempted to call non-function: {op}")
