
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
    yes :   A -> Dec A
    no  : ¬ A -> Dec A

thm : Dec A -> ((A -> F) -> F) -> A
thm (yes a) ¬¬a = a
thm (no ¬a) ¬¬a = ex-falso-quodlibet (¬¬a ¬a) 

In our type system:

set := new_set()
N := subset(set)
zero : N     = f -> x -> x
suc : N -> N = n -> f -> x -> f(n(x))


zero(f)(x) := x
suc(n)(f)(x) := f(n(x))

Set = new_universum()
N <: Set
zero : N
suc  : N -> N


hello(x):
  select * from df
  where col > 3

df:
  select sum(*) from data
  where col > 3 and loc < 2
  group by categorical

fib(n):
    a, b := 1, 0
    for _ in 0..n 
    	a, b = b, a + b
    return b

name : type = value

fib(n: Natural): Natural
  case n
    0          0
    1          1
    1+(1+(n))  fib(n + 1) + fib(n) 


# Reversed Notation

fib : ℕ → ℕ
0 fib = 0
0 +1 fib = 1
n +1 +1 fib = n +1 fib + n fib


fib : ℕ → ℕ
(0)fib = 0
(0 +1)fib = 1
(n +1 +1)fib = (n +1)fib + (n)fib

fib : ℕ → ℕ
0.fib = 0
0.+1.fib = 1
n.+1.+1.fib = n.+1.fib + n.fib


płot.("biało" pomaluj).(pędzelkiem szlaczki_zrób)

g.f = g.g.¬

The typing will be optional!

range(n: ℕ): Vec{Fin{n}, n}
  fn _range(k):
    0    = Vec{Fin{n}, 0}()
    k +1 = push(_range(k), k)
  return _range(k)
      


