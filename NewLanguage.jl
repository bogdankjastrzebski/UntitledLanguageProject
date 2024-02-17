
# The New Language

"""
Lisp, without brackets, with dependent types, implemented as lambdas.
Language designed for building code, compiling it(, saving) and running.
"""

fun : {X : Set} -> (x : X) -> L x
fun 0 = ...  
fun (suc x) = ...

# Mało programistycznie, może tak:

fun{X : Set}(x: X): L x
  match x
    0       ...
    (suc x) ...
 
# Równoważne definicje:
fun(x, y) = ... 
fun(x, y)
    ...
fun{X Y : Set}(x : X, y : Y)
fun{X : Set}{Y : Set}(x : X, y : Y)
    ...
fun{X : Set}{Y : Set}((x , y) : Tuple X Y)
    ...

# Nie równoważne definicje:
f(x)(y):    X -> Y -> Z = ...
f(x, y): Tuple X Y -> Z = ...

# Równoważne:
foo(x) = bar(x)
foo(x; bar=bar) = bar(x)
foo(bar=bar)(x) = bar(x)

# General Rules
arg : type = value
arg := value # type inferred
arg : type
    value
arg
    value

# For functions
fun : typeA → typeB = arg ↦ ...
fun(arg) := ...
fun(arg : typeA) := ...
fun(arg) : typeB = ...
fun(arg : typeA) : typeB = ...
fun(arg)
    ...
fun(arg : typeA)
    ...
fun(arg) : typeB 
    ...
fun(arg : typeA) : typeB 
    ...

# we usually make the function constant:
const fun(arg)
    ...

data ⊥ : Set where

ex-falso-quodlibet : {x : Set} → ⊥ → x
ex-falso-quodlibet ()

data Dec (A : Set) : Set where
    yes : A -> Dec A
    no  : ¬ A -> Dec A

thm : Dec A -> ((A -> F) -> F) -> A
thm (yes a) ¬¬a = a
thm (no ¬a) ¬¬a = ex-falso-quodlibet (¬¬a ¬a)  

