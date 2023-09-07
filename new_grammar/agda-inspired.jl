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











