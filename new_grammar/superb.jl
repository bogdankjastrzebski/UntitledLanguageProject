
# A minimal language with decidable allocation.

const fib(n: i32): i32
    a, b := 1, 0
    for _ 0..n
        a, b = b, a + b
    return b

fib: i32 -> i32
fib 0 = 0
fib 1 = 1
fib (1+ (1+ n)) = fib (1+ n) + fib n

fib(n: i32): i32 = n if n < 2 else fib(n-1) + fib(n-2)

# Is proof verification computation?
# Let's say, we have lambda calculus.

zero := λf.λx.x
suc  := λn.λf.λx.f(nx)

# There's no way to prove, that a function is 
# a natural number, because we can interact with
# it only through calling it. However, we can
# assume, that:
# zero : Nat
# suc  : Nat → Nat
# and use only these constructors to work
# with natural numbers. 
# Pros:
#   * the system is sufficient
#   * the system has built in polimorphism: we
#     can redefine zero and suc and all theorems,
#     provided that all constructors terminate,
#     still hold.
# Cons:
#   * how do we verify, within the system,
#     that the constructors terminate?
#     If we can only interact with them through
#     calling, it's impossible.
#   * Do we need reflexivity?
#   * What's the point of lambda calculus then anyway?
#
#
# If we write with a dependantly typed language, we
# know that our function termiates, provided that 
# the type inference terminates. Type inferenence / checking
# is only a computation:

rule-0: zero ↦ ℕ
rule-n: suc ℕ ↦ ℕ

_+_ : ℕ → ℕ → ℕ
zero + n = n
suc m + n = m + suc n

zero + n by definition just gives us n
suc m + n = suc ℕ + ℕ = ℕ + suc ℕ


# Ok, but on the other hand, how to emulate processor in this language?

function fib: ℕ → ℕ
    zero        | zero
    suc zero    | suc zero
    suc (suc n) | fib(n)

The language should have dual system of:
* writing c-style functions
* being able to represent them with functional code.


