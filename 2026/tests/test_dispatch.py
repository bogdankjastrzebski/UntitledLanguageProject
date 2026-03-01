# tests/test_dispatch.py
import unittest
from src.parser import tokenize, parse
from src.interpreter import MetaCompiler
from src.types import UnionVal
# (Or just add UnionVal to your existing import line)

class TestDispatch(unittest.TestCase):
    def setUp(self):
        self.compiler = MetaCompiler()
        
        # Load the Standard Library (which now includes our router)
        with open("lib/stdlib.lisp", "r") as f:
            stdlib_code = f.read()
            
        tokens = tokenize(stdlib_code)
        while tokens:
            self.compiler.eval(parse(tokens))

    def test_primal_dual_dispatch(self):
        # 1. Define the implementations
        setup_code = """
        ; Method 1 (Older, broader): Matches ANY Int
        (define method-any-int 
            (make-method Int? 
                         (lambda (x) "Fallback: Just some integer")))
            
        ; Method 2 (Newer, stricter): Matches ONLY Positive Ints
        (define method-pos-int 
            (make-method PositiveInt? 
                         (lambda (x) "Intercepted: A strictly positive integer!")))
        
        ; 2. Build the registry (Newest first!)
        (define describe-registry 
            (cons method-pos-int 
                (cons method-any-int empty)))
        """
        
        tokens = tokenize(setup_code)
        while tokens:
            self.compiler.eval(parse(tokens))
            
        # 3. Test a negative number (Should hit the fallback)
        res1 = self.compiler.eval(parse(tokenize(
            "(dispatch describe-registry (box \"Int\" -5))"
        )))
        self.assertEqual(res1, "Fallback: Just some integer")
        
        # 4. Test a positive number (Should be intercepted by the newer method)
        res2 = self.compiler.eval(parse(tokenize(
            "(dispatch describe-registry (box \"Int\" 42))"
        )))
        self.assertEqual(res2, "Intercepted: A strictly positive integer!")
        
        # 5. Test an unknown type
        res3 = self.compiler.eval(parse(tokenize(
            "(dispatch describe-registry (box \"Float\" 3.14))"
        )))
        
        # If it's a UnionVal, check if one of the possibilities is our Error box
        if isinstance(res3, UnionVal):
            # Check if any possibility has our label
            found = False
            for p in res3.possibilities:
                if hasattr(p, 'label') and p.label == "Error":
                    found = True
            self.assertTrue(found)
        else:
            self.assertEqual(res3.label, "Error")

if __name__ == '__main__':
    unittest.main()
