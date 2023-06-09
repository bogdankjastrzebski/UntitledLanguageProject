

let fib(n)
    a := 1
    b := 0
    for _ in 0..n
        a, b = b, a + b
    return b

:= - definition
=  - set operator

let foo(x: i32): i32
    a: i32 = 1
    b: i32 = 0
    for _ in 0..n
        a, b = b, a+b
    return b

: type = - definition with type
:= - definition with inferred type

let fib(n: i32): i32
    a: i32 # Define as i32 without seting value
    b: i32
    a, b = 1, 0
    for _ in 0..n
        a, b = b, a+b
    return b

: - define variable.
:= - define and set.
= - set value.


## If statement

# Alternative
case
  a < 1
    alpha
  a < 2
    something
  else
    omega

# Winner
if a < 1
    alpha
  a < 2
    beta
  else
    omega 

# Second best, permitted
if a < 1
     alpha
   a < 2
     beta
   else
     omega

#### Type Naming

# using type names should be limited to minimum

There are two types of "types": 
* abstract types;
* machine types;

We almost never use machine types,
because we want our code to be abstract: 

let fib(n: Additive)
    a := one(n)  # a: typeof(n) = 1
    b := zero(n) # b: typeof(n) = 0
    for _ in 0..n
        a, b = b, a + b
    return b

This creates:
- if does not exist:

__fib := dict()
fib := lambda(args...) __fib[typeof.map(args)](args...) # If does not already exist

- then:
__fib[(S"Additive",)] := lambda(n) ...


# Macros
let swap a b
    ... 

swap a b
something asdf
    ...


## One line macros:
func := (lambda (n) ...)

## Two Line macros
func := (lambda (n)
              a := one(n)
              b := zero(n)
              for _ in 0..n
                  a, b = b, a + b
              return b) # This one looks to the compiler like:
# lambda (n)
#               a := one(n)
#               b := zero(n)
#               for _ in 0..n
#                   a, b = b, a + b
#               return b   
#
# Which actually parses to the same thing. (since we are only comparing indents)


func := (lambda (n)
    a := one(n)
    b := zero(n)
    for _ in 0..n
        a, b = b, a + b
    return b)

              
func := (
lambda (n)
    a := one(n)
    b := zero(n)
    for _ in 0..n
        a, b = b, a + b
    return b   
)             
              
              
func := (
    lambda (n)
        a := one(n)
        b := zero(n)
        for _ in 0..n
            a, b = b, a + b
        return b   
) # This will parse maybe to:
# <newblock>
#     lambda (n)
#         a := one(n)
#         b := zero(n)
#         for _ in 0..n
#             a, b = b, a + b
#         return b   
# Maybe not              

q := (quote
          func := (lambda (n, func) 1 if n < 1 else n * func(n-1))
          factorial := (lambda (n) func(n, func)))
                                                                            
#### Broadcasting
# operations are not broadcasted by default.
# math operation are
a + a # works normally 
a - a # works normally 
a * a # * denotes comutative multiplication, thus elementwise.
a ⋅ a # matmul (not broadcasted, however if shape(a) = (batchsize, n, n)... it may be)
a / a # denotes elementwise division
a \ a # is broadcasted, but like ⋅ 
# a \ a = a^-1 ⋅ a,   (a' \ a')' = (a'^-1 ⋅ a')' = a ⋅ a^-1

# Other functions we broadcast with .map
foo.map([...])

:= is not broadcasted.
Should = change pointer or content with broadcasting?

# Function types:

f: Real -> Real = (lambda(x) x^2)
g: Real -> Real -> Real = (lambda (x) (lambda (y) x + y))


f(x) := x + x
f(x) : R -> R = x + x

let foo(x : Real) : Real
    return x + x

typeof(foo) == Real -> Real

f: Natural -> Natural = x -> x+x

# How to understand function types?
# the function type is solely it's name written in an odd way.
let foo(x: Real)
    ...

let foo(x: Int)
    ...

# creates something like
foo_Real(x) = ...
foo_Int(x) = ...

# and the language has implemented dispatch function:

let foo(x)
    switch typeof(x)
      Real
        return foo_Real(x)
      Int
        return foo_Int(x)




# Implementation Example
let quicksort(arr: Array): Array
    lhs := [e for e in arr[1..] if e < arr[0]]  # here := not = because we introduce new name
    rhs := [e for e in arr[1..] if e ≥ arr[0]]  # zero indexing
    return quicksort(lhs) ∪ [arr[0]] ∪ quicksort(rhs)  # fancy operators

#maybe the default should be different?
a = 0
let foo()
    a := 0
    a = 1

let foo()
    a = 0
    a <- 1 # inplace modification


# List Comprehension

b: Array[Int] = [i for i in 0..n if i % 2 == 0]

# Predicates

equals?(a, b)
lessthan?(a, b)
morethan?(a, b)
pred?(a, b, c, ...)









struct mystruct
    id: i32
    name: str







