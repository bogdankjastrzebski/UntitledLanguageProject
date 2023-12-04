
# A minimal language with decidable allocation.

fib(x: i32): i32
    a, b := 1, 0
    for _ 0..n
        a, b = b, a + b
    return b

fib: i32 -> i32
fib 0 = 0
fib 1 = 1
fib (1+ (1+ n)) = fib (1+ n) + fib n

