
: for type theory
= for setting

n: Int
n = 0
n: Int = 0
n := 0 # type infered

n := do
    asdf
    
data ℕ
    zero: ℕ
    succ: ℕ → ℕ

fib : ℕ → ℕ
fib = n ↦ n if n < 2 else fib(n-1) + fib(n-2)

data 𝔹
    ⊥ : 𝔹
    ⊤ : 𝔹

⊥ : 𝔹 = x ↦ y ↦ y
⊤ : 𝔹 = x ↦ y ↦ x

f: I ↦ I

true: Bool = x ↦ y ↦ x
false: Bool = x ↦ y ↦ y

pair: T → T → Bool → T = \
    a ↦ b ↦ p ↦ (p a b)

first: (Bool → T) → T = \
    p ↦ (p true)

second: (Bool → T) → T = \
    p ↦ (p false)

(pair 3 4): Bool → T

(first (pair 3 4))

f: I → I → I = x ↦ y ↦ x + y

foo: Int × Int → Int = (x, y) ↦ x + y
    
let foo(x: Int, y: Int): Int
    return x + y

let fib(n: Int): Int
    a, b, c: I32 = 1, 0, 0
    while n > 0
        c = a
        a = b
        b = c
        n -= 1
    return b


let fib(n: Int): Int
  if n < 2
      return n
    else
      return fib(n-1) + fib(n-2)


# How to prove inside lambda calculus?
# Can we prove things inside lambda calculus, or should we start with types?
#
Each lambda is really a tuple:

first  := pair ↦ pair(true)
second := pair ↦ pair(false)

func := (type_lambda, true_lambda)

call := (func, x) ↦ second(func)(x)



# Agda inspired functions

function fib : ℕ → ℕ
    0           ↦ 0
    suc(0)      ↦ suc(0)
    suc(suc(n)) ↦ fib(n) + fib(suc(n))

function fib : ℕ → ℕ
    0           = 0
    suc(0)      = suc(0)
    suc(suc(n)) = fib(n) + fib(suc(n))

fib : ℕ → ℕ
fib(0) = 0
fib(1) = 1
fib(suc(suc(n))) = fib(n) + fib(suc(n))


# New

Can we emulate the thing in standard lambda calculus?
Yes, we should be able to do that. 







