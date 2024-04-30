
const array_add
        {T : Set, n : ℕ}
        (lhs : Array[T, n], rhs : Array[T, n]) : Array[T, n]
    result := zeros(n)  # eltype is inferred, zeros has signature {T : Set}(n : ℕ)
    simd for ind in 0..length(lhs)
        result[ind] = lhs[ind] + rhs[ind]  # we do not need inbounds
    return result

func(x) := x + x
func{T K : Set}(x : T) : K = x + x

model :
    x ~ N(0, 1)
    y ~ N(0, 1)
    x + y

x ~ N(0, 1)
y ~ N(0, 1)

a+b := a + b

ℕ := Natural

const fib(n : ℕ) : ℕ
    a b := 1 0
    for _ in 0..n
        a b = b a + b
    return b

fib(n: ℕ): ℕ
  rec(rec, a, b, n) := n == 0 ? b : rec(rec, b, a + b, n - 1)
  return rec(rec, 1, 0, n) # to będzie nieprawidłowy typ

fib(n: ℕ): ℕ
  rec: ℕ × ℕ × ℕ → ℕ
    cases
      (a, b,       0) := b
      (a, b, (n + 1)) := rec(b, a + b, n)
  return rec(1, 0, n)

a := 3
a = 2


if x < 2
    print(4)
  x < 4
    print(3)
  else
    print(5)

match x
  x < 2
    print(4)
  x < 4
    print(5)
  else
    print(6)


f(x) := 2 * x + 1

g := Derivative(f)(x)







