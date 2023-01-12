# The Language 

Directories:
* 

## Language Features

Example:
```julia 

let fib(n)
  a: 1
  b: 0
  for _ in 0..n
    a, b: b, a+b
  return b
        
```

### The Let Keyword

The let keyword defines a compile time constant, that is allowed to be changed later on, causing the compiled parts of the code to be recompiled. For instance, we want functions to be compile time constants, but we want to be able to change them in an interactive session. For simplicity, the same is for constants of all types. Changing them is in general not recommended, only during development. The `let` keyword allows for different fancy syntax rules. 

Examples: 
```julia

let a 3 # define an int compile time rule

let fib(n) # define a function
    return n if n < 2 else fib(n-1) + fib(n-2)

let curry(a)(b) # define a double function, to think about. Maybe useful during piping.
    return a + b # curry(a) -> lambda (b) a + b
            
let show x # define a macro
    n = String(x)
    return quote
        print($n, ": ", $x)
                        
let foo.bar # maybe for get field? 
    ...

```

### Type System

No general type system is being applied. The `functions` are all untyped. We can compile the code, where some values are known, and some are unknown. Type is a field of a language object. Consider the following function:
```julia
let foo_int(x)
    return object("int", x.value + 1)

let foo_float(x)
    return object("float", x.value + 1.0)

let foo(x)
    if x.type = "int"
         return foo_int(x)
       x.type = "float"
         return foo_float(x)
       else
         error("Not implemented!")
```
This function will run `foo_int` function, if `x.type` is equal to `"int"`, etc. We want to compile the following code:
```julia
unknown_int: object("int", NA)
foo_compiled_for_int : foo(unknown_int)
```
where `NA` is an unknown value. The `if` statement can be evaluated, because the type "unknown_int.type" is known. Therefore, we translate the above into the following:
```julia
unknown_int : object("int", NA)
foo_compiled_for_int : foo_int(unknown_int)
```
Then we enter the function:
```julia
unknown_int : object("int", NA)
foo_compiled_for_int : object("int", unknown_int.value + 1)
```
and:
```julia
unknown_int : object("int", NA)
foo_compiled_for_int : object("int", NA + 1)
```
finally the statement is interpreted as a lambda:
```julia
foo_compiled_for_int : lambda (x) object("int", x + 1)
```
and can be run on a non-object type:
```julia
assert foo_compiled_for_int(object("int", 3).value) = object("int", 4)
```

The language paradigm is compile-time-computing language primarily. But as the main design pattern we choose a multiple-dispatch paradigm. The polymorphism problem is as follows, we need to create mapping between tuples of types and function implementations:
* T - set of all possible type combinations for a function.
* F - set of function implementations.

In general, this mapping can be very complex, and cannot be handled automatically in general (see julia heuristics for that). Instead, this mapping should be programmable, or, just set in a sparse matrix.

Or maybe create prolog-like type evaluation? Maybe a Haskell-Style patterm matching, since we are making a mapping?


### Operators

Operators:
* are not part of the parser, but a macro. There is a special 
    function/macro __math__, that takes a set of tokens and structurizes
    them into ast. Other than math operators have different rules attached,
    setting a variable etc.
* are being separated by the parser from other atoms. So you do not have to insert space between operator
    and word letter.
* notable changes:
    * `:`: set operator, in other languages `=`, short from `:=`.
    * `=`: is equal predicate, like `==` in other languges.

