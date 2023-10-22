# The "minimal" grammar

# There are many types of functions

# Dependent type:
using DependentTypes

fib : ℕ → ℕ
  fib(0) = 0
  fib(1) = 1
  fib(n) = fib(n-1) + fib(n-2)

# Machine Types
using MachineTypes

fib(n: i32): i32 = (n < 2 ? n | fib(n-1) + fib(n-2))
# or
fib := (n: i32) ↦ ...
# or
fib(n: i32): i32
    return ...
# or
fib : i32 → i32 # this one is similar to agda
  fib(n) = ...

# Traits
using Traits
...


# Macros

if n == 0
    return 0
  n == 1
    return 1
  else
    return fib(n-1) + fib(n-2)

case n
    0 => 0
    1 => 1
    n => fib(n-1) + fib(n-2)
 
# Memory Model
using LinearTypes

x: Foo = f()
# Error: x not consumed

x: Foo = f()
g(x)
g(x) # Error: x consumed twice.

x: Foo = f()
g(x) # OK

x: Foo = f()
if whatever()
    g(x)
  else
    pass
# Error, x not-consistently consumed.
x: Foo = f()
while True
  g(x)  # Error: consumed in loop


# Agda style linear types:
fib : ℕ → ℕ
  fib zero = zero
  fib (suc zero) = (suc zero)
  fib (suc (suc n))
    n₀, n₁ := copy n
    return fib n₀ + fib (suc n₁)


a := make_a()
b, c := (copy a) # a get's destroyed
print b # b get's destroyed
delete c # delete c 


# Calling functions

Method : {I O : Set} → Set
Method {I} {O} = String × ... × I → O # Name, metadata, actual function

method_call : {I O : Set} → Method {I} {O} → I → O
    method_call {I} {O} (name, ..., func) = func

fib n # function call
fib(n)
  -> (method_call fib (n,))
  -> ((method_call fib) (n, ))
  -> (func (n, ))
  -> output

# so for instance:

a := w x + b # where w is linear is ok.

func := (quote a + b)

data := (select * from df where something)


# Alternative number creation
postulate
    ℕ : Set
    zero : ℕ
    suc  : ℕ → ℕ
 

# Is → an operator?
# is it an operator?

func := (g ↦ f (g g)) (g ↦ f (g g))

# It is an operator, it takes two types and returns a type:

_→_ : Set × Set → Set # But how to define it?
a → b = builtin

# Proc Model as Monad

CPU : Name → Value

record CPU
    stack ... 

_ | _ <- _ : Device → Name → Value → Device   
something | Name <- Value 

memory : CPU = empty
memory = memory | a : i32
memory = memory | a <- 3
memory = memory ...



# The point is to prove some things about the code


