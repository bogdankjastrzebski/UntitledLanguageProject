# UntitledLanguageProject
The official repository for the untitled language project.

TODO:
* language syntax
* language characteristics
* language implementation

## Language Characteristics

The language is a compile-time computing language with different types of execution.
It is both compiled and interpreted. It is an interpreter, that via macros and code
generation can translate itself to LLVM, compile functions and later use. Because of
that, we will be able to compile the interpreter itself. 

Compile time "constants" are being assigned with the `let` keyword. During compilation, 
they are assumed to be what they are. They are being inlined and assumed as constant. Yet, 
in fact they can change, which triggers recompilation.

The `let` keyword is primarily used to define procedures. It can be used to define standard
values and macros. Examples:

```julia
let π 3.1415926535897

let fib(n)
   a: 1
   b: 0
   for _ in 0..n
      a, b: b, a+b
   return b
            
let show x
   str: String(x)
   return quote
      println($str, ": ", $x)

```
