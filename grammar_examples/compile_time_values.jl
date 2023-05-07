
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





