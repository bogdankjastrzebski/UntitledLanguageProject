
# to make the language easy, let's make the following convention:
a : 0 # creates a
a : 1 
# changes a to 1

# Inside a function, names from outer scopes have to be allowed.
# We should also be able to set them. 

let fib(n)
    a i32
    b i32
    a : 1
    b : 0 
    for _ in 0..n
        a, b : b, a+b
    return b

let fib(n)
    a : 0
    b : 1
    for _ in 0..n
        a, b <- b, a+b
    return b

let fib(n)
    a :: 0
    b :: 1
    for _ in 0..n
        a, b : b, a+b
    return b

let fib(n)
    a <- 0
    b <- 1
    for _ in 0..n
        a, b : b, a+b
    return b

let fib(n)
    a := 0
    b := 1
    for _ in 0..n
        a, b = b, a + b
    return b


The question is, what should be the semantics for: 
* formal language
* informal language
And how similar they should be.





