# src/parser.py
import re

def tokenize(program: str):
    """Extracts tokens, keeping double-quoted strings intact, and ignores comments."""
    # 1. Strip Lisp comments (everything from ; to the end of the line)
    program = re.sub(r'(?m);.*$', '', program)
    
    # 2. Extract tokens
    return re.findall(r'"[^"]*"|\(|\)|[^\s()]+', program)

def parse(tokens):
    """Converts a list of tokens into an AST (nested lists)."""
    if not tokens: 
        raise SyntaxError('Unexpected EOF')
        
    token = tokens.pop(0)
    
    if token == '(':
        ast = []
        while tokens and tokens[0] != ')': 
            ast.append(parse(tokens))
        if not tokens:
            raise SyntaxError('Missing closing parenthesis')
        tokens.pop(0) # Remove ')'
        return ast
    elif token == ')': 
        raise SyntaxError('Unexpected )')
    else:
        # Keep strings with quotes intact for the evaluator to recognize
        if token.startswith('"') and token.endswith('"'): 
            return token[1:-1]
            
        # Try parsing as int, then float, otherwise return as string symbol
        try: 
            return int(token)
        except ValueError: 
            try:
                return float(token)
            except ValueError:
                return token
