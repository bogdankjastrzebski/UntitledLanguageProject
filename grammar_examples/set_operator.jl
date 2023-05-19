
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

IMO they should have similar semantics.
But maybe different, than julia.


There are two possible styles, depending on who we want to appeal to.
We want to appeal to python users, because at worst we can just wrap
existing c libraries and call it a day, gain users and then people who
actually can write code will follow.

Hardcore programmers will not switch from rust or c++ or c.

Maybe we should do it like this
exact grammar:

let fib(n i32) i32
    a i32: 1
    b i32: 0
    t i32: 0
    while n > 0
        t <- a
        a <- b
        b +<- t
        n -<- 1
    return b

<- is a set in place operator.
.= in julia is also two letters.

this:

let fib(n T) T
    a : 1
    b : 0
    for _ in 0..n
        a, b : b, a+b
    return b

Will be optimized to the upper version, where we do things in place. 
Here : always mean "set to new value", but through code analysis we know,
that we will be able to optimise it.



For sure, there should be correspondence with typed code, and without.
So, how to do it?












