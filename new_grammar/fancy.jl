# Echo


code := begin
    s := 0
    for i in 0..10
        s += i
    return s
 
code := (begin
             s := 0
             for i in 0..10
                 s += i
             return s)

func := (lambda(x) x+x)

func := (lambda (x)
            x *= 2
            return x+x)

pipe := df
    .where(c'alpha < 0)
    .select(sum(c'(beta)))



let foo(x: Integer): Integer
    y := zero(x)
    for i in 0..n
        y += i
    return y

foo = add!(x, y)


let fib(n: Integer): Integer
    a, b: Return = 1, 0
    while n > 0
        a, b = b, a + b
        n -= 1 
    return b 

        
        
    
# Parallel computing


array := [0, 1, 2, 3, 4, 3, 2, 1, 0, 1]

s = 0
@map i in eachindex(array)
    array[i] ^= 2
    @sync # like cuda sync
    if iseven?(i)
        array[i] += array[i+1]


# What names are allowed inside a scope?
# "constants"
# passed arguments

# Let := be =
let bar(x)  # Creates a "constant"
    return x + x

const a = 0
b = 0

let foo(x)
    # Cannot use b, read b, etc,
    b = 2 * x
    return bar(x)

# Notice, that we cannot modify global variables, but we can 
# use constant, in particular functions assigned as constant.




