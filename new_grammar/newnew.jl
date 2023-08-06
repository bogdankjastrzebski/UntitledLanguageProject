
let fib(n: I32): I32
    a, b: I32 = 0, 1
    while n > 0
        a, b = b, a + b
        n -= 1
    return b

true  := x ↦ y ↦ x
false := x ↦ y ↦ y

function fib: Integer → Integer
    0 ↦ 1
    1 ↦ 1
    n ↦ fib(n-1) + fib(n-2)

function fib(n: Integer): Integer
    match n
        0 ↦ 1
        1 ↦ 1
        n ↦ fib(n-1) + fib(n-2)

function fib(n: Integer): Integer
    rev: Int × Int × Int → Int = (a, b, n) ↦ b if n == 0 else rev(b, a + b, n - 1)
    # rev := (a, b, n) ↦ b if n == 0 else rev(b, a+b, n-1)
    return rev(1, 0, n)



function monad
    M{a} := a × String
    f: A → M{A}
    g: A → M{A}
    let (f ∘ g)(x: A)
        mf, mg: String
        x, mf = f(x)
        x, mg = g(x)
        return x, mf ++ mg


function (f ∘ g)(x)
    return f(g(x))

# The dark language

let ((foo x) y)
  incr! x y
  set! x y
  return x


