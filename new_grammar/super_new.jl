
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


