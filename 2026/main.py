# main.py
import sys
import traceback
from src.parser import tokenize, parse
from src.interpreter import MetaCompiler
from src.types import AbstractVal, UnionVal, PrimalBox

class Colors:
    GRAY = '\033[90m'
    DARK_RED = '\033[31m'
    LIGHT_RED = '\033[91m'
    MUTED_YELLOW = '\033[33m'
    DIM = '\033[2m'
    RESET = '\033[0m'
    BOLD = '\033[1m'

def format_result(res):
    """Formats the output nicely for the terminal with a muted crimson/gray aesthetic."""
    if res is None:
        return ""
    if isinstance(res, (int, float)):
        return f"{Colors.MUTED_YELLOW}{res}{Colors.RESET}"
    if isinstance(res, str):
        return f"{Colors.LIGHT_RED}\"{res}\"{Colors.RESET}"
    if isinstance(res, AbstractVal):
        return f"{Colors.DARK_RED}<?:{res.label}>{Colors.RESET}"
    if isinstance(res, UnionVal):
        # Recursively format the inner items
        items = ", ".join(format_result(p) for p in res.possibilities)
        return f"{Colors.DARK_RED}Union({Colors.RESET}{items}{Colors.DARK_RED}){Colors.RESET}"
    if isinstance(res, PrimalBox):
        val = format_result(res.value)
        return f"{Colors.GRAY}[{Colors.DARK_RED}{res.label}{Colors.GRAY}: {Colors.RESET}{val}{Colors.GRAY}]{Colors.RESET}"
    if isinstance(res, dict) and res.get('type') == 'closure':
        args = " ".join(res['args'])
        return f"{Colors.GRAY}<Closure: (lambda ({args}) ...)>{Colors.RESET}"
    
    return f"{Colors.RESET}{str(res)}"

def repl():
    print(f"{Colors.DARK_RED}======================================================={Colors.RESET}")
    print(f"{Colors.BOLD}{Colors.DARK_RED}⚡ MetaLisp v0.1 REPL (Abstract Interpretation Engine) ⚡{Colors.RESET}")
    print(f"{Colors.DARK_RED}======================================================={Colors.RESET}")
    print(f"{Colors.GRAY}Type :q or :quit to exit.{Colors.RESET}\n")
    
    compiler = MetaCompiler()
    
    # Pre-populate the environment
    initial_code = """
    (define (square x) (machine-add x x))
    (define (is-positive x) (machine-gt x 0))
    """
    try:
        tokens = tokenize(initial_code)
        while tokens:
            compiler.eval(parse(tokens))
    except Exception as e:
        print(f"{Colors.LIGHT_RED}Error loading initial environment: {e}{Colors.RESET}")

    while True:
        try:
            # Subtle Gray Prompt
            cmd = input(f"{Colors.GRAY}λ> {Colors.RESET}").strip()
            
            if not cmd:
                continue
            if cmd in [":q", ":quit", "exit"]:
                print(f"{Colors.GRAY}Goodbye!{Colors.RESET}")
                break
                
            tokens = tokenize(cmd)
            
            last_res = None
            while tokens:
                ast = parse(tokens)
                last_res = compiler.eval(ast)
                
            formatted = format_result(last_res)
            if formatted:
                print(f"{Colors.GRAY} =>{Colors.RESET} {formatted}")
                
        except EOFError:
            print(f"\n{Colors.GRAY}Goodbye!{Colors.RESET}")
            break
        except KeyboardInterrupt:
            print(f"\n{Colors.GRAY}KeyboardInterrupt (type :q to exit){Colors.RESET}")
            continue
        except Exception as e:
            print(f"{Colors.LIGHT_RED}Error: {e}{Colors.RESET}")

if __name__ == "__main__":
    repl()
