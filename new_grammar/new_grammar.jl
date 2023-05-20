

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

using type names should be limited to minimum























