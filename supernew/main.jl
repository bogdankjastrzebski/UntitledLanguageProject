
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

const fib(n : ℕ) : ℕ
    a b := 1 0
    for _ in 0..n
        a b = b a + b
    return b


    
