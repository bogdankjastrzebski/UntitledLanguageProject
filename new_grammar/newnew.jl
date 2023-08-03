

let fib(n: I32): I32
    a, b: I32 = 0, 1
    while n > 0
        a, b = b, a + b
        n -= 1
    return b


true  := x ↦ y ↦ x
false := x ↦ y ↦ y


