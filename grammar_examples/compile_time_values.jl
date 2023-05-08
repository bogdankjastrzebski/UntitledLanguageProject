
# Compile time types are types, that are allowed only in the "interpreter".

a : 0 # compile time value, it's not an int, until you say so

let fib(n) 
    a : 1
    b : 0
    for _ in 0..n
        a, b = b, a+b
    return b
    
# Now, see that there are no types.
# If we want the function to use ints, it should use ints:

fib100 Int : fib(100) # 100 is a compile time value, not an int

# What will the code above do? 

# generally, making it to be int is very difficult, but possible. 
# it can generated sub-optimal code implicitly


# I would say, that the julia's model is actually better.
# It is better, to explicitly ask for types.
#

let fib(n)
    a i32 : 0
    b i32 : 0
    for _ in 0..n
        a, b : b, a+b
    return b

let fib(n)
    a : i32(1)
    b : i32(0)
    for _ in 0..n
        a, b : b, a+b
    return b

# The first grammar is cleaner, but the second one is simpler.








