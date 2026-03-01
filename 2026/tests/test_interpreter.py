import unittest
from src.parser import parse, tokenize
from src.interpreter import MetaCompiler
from src.types import PrimalBox, AbstractVal, UnionVal

class TestInterpreter(unittest.TestCase):
    def setUp(self):
        """Initialize a fresh compiler environment before each test."""
        self.compiler = MetaCompiler()

    def run_code(self, source_code):
        """Helper to tokenize, parse, and evaluate a block of code."""
        tokens = tokenize(source_code)
        last_result = None
        while tokens:
            last_result = self.compiler.eval(parse(tokens))
        return last_result

    def test_concrete_execution(self):
        """Test basic math and concrete if-statements."""
        res = self.run_code("""
            (define x 10)
            (if (machine-gt x 5)
                (machine-add x 20)
                0)
        """)
        self.assertEqual(res, 30)

    def test_lexical_closures(self):
        """Test that functions properly capture their environments."""
        res = self.run_code("""
            (define (make-adder x)
                (lambda (y) (machine-add x y)))
            (define add-five (make-adder 5))
            (add-five 15)
        """)
        self.assertEqual(res, 20)

    def test_primal_boxing(self):
        """Test that PrimalBoxes attach labels to data and can be queried."""
        res = self.run_code("""
            (define my-val (box "Speed" 120))
            (get-label my-val)
        """)
        self.assertEqual(res, "Speed")

        # Test math on boxed values
        math_res = self.run_code("(machine-add my-val (box \"Speed\" 30))")
        self.assertIsInstance(math_res, PrimalBox)
        self.assertEqual(math_res.label, "Speed")
        self.assertEqual(math_res.value, 150)

    def test_abstract_inference(self):
        """Test that the interpreter can symbolically execute functions."""
        res = self.run_code("""
            (define (square x) (machine-add x x))
            (infer square (abstract "Int"))
        """)
        # abstract + abstract = abstract "Int" (based on our machine-add rules)
        self.assertEqual(res, AbstractVal("Int"))

    def test_universe_forking_union(self):
        """Test that an unknown condition forks into a UnionVal of both branches."""
        res = self.run_code("""
            (define (mystery x)
                (if (machine-gt x 0)
                    "Positive"
                    "Negative"))
                    
            (infer mystery (abstract "Int"))
        """)
        # The condition (machine-gt <?:Int> 0) is unknown, so it runs both!
        self.assertIsInstance(res, UnionVal)
        self.assertIn("Positive", res.possibilities)
        self.assertIn("Negative", res.possibilities)

    def test_idempotence_collapse(self):
        """Test that parallel universes returning the same type collapse into one."""
        res = self.run_code("""
            (define (always-int x)
                (if (machine-gt x 0)
                    (machine-add x 1)
                    (machine-add x 2)))
                    
            (infer always-int (abstract "Int"))
        """)
        # Branch A returns <?:Int>. Branch B returns <?:Int>. 
        # The Union should collapse them.
        self.assertEqual(res, AbstractVal("Int"))

    def test_element_wise_union_propagation(self):
        """Test that operations distribute across a UnionVal element-wise."""
        res = self.run_code("""
            (define (forking-math x)
                (if (machine-gt x 0)
                    10
                    20))
            
            ; This creates Union(10, 20), then adds 5 to it!
            (machine-add (infer forking-math (abstract "Int")) 5)
        """)
        self.assertIsInstance(res, UnionVal)
        self.assertIn(15, res.possibilities)
        self.assertIn(25, res.possibilities)


if __name__ == '__main__':
    unittest.main()
