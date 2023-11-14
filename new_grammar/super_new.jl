
# Let's design something inbetween
# Agda, but more like sql

fib : Int → Int
fin(n)
    a, b : Int = 1, 0
    for _ in 0..n
        a, b = b, a + b
    return b

fib(n: Int): Int
    a, b := 1, 0
    for _ in 0..n
        a, b = b, a + b
    return b

# the following are equivalent:
alpha = beta
alpha
    beta

# So we can do:
dataframe
    sql select * from df
    where something

code
  quote
    a := 0
    b := 1

foo(x)
    return x + x

foo(x)(y)
    return x + y

foo a b #macro
  quote
    $a $b
           

let fib(n: Int): Int
    a, b := 1, 0
    for _ in 0..n
        a, b = b, a + b
    return b

let fib: Int → Int = n ↦ n if n ≤ 1 else fib(n-1) + fib(n-2)

function fib: Int → Int
    fib(0) = 0
    fib(1) = 1
    fib(suc(suc(n))) = fib(suc(n)) + fib(n)

if a ≡ 0
    print(a)
  else
    print(b)
    
if a ≤ 2
    print(2)
  a ≤ 4
    print(4)
  else
    print(5)


