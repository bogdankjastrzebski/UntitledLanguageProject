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
 

