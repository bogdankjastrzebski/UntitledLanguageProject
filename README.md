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

The syntax does not use the meaning of keywords. Quoted code is being parsed "as it is":

```julia

quote 
   aaa
   foo
      bar 

# translates to:
# (( __nl__ aaa) ( __nl__ foo ( __nl__ bar))

```

Each syntax rule translates to a unique structure, and the translation process is invertible.

```
foo(x) # translates to ( __call__ foo x)
foo.bar # translates to ( __dot__ foo bar)
foo.bar(x) # translates to ( __call__ ( __dot__ foo bar) x) # from left to right
```

# Implementation Plan

* Find good vm for interpretation, and create a transpiler.
* Create transpiler of code to LLVM IR.

The implementation should be simple and based entirely on constant folding.
It should work as an interpreter, that can call a compiler, produce executable, 
and later use the executable to produce results. 

Function evaluation should be available in at least three modes:
* interpretation
* jit compilation
* compilation

Programmer chooses, which functions are interpreted, jit-compiled or compiled. 
For compiling functions, programmer has to choose a type, the function is being compiled for.
The code can be compiled for structs or abstract types.

Compiling functions for abstract types should reduce efforts made during inference, but 
would allow to reduce compilation time, as less functions would be compiled. This also reduces
memory needed to store a precompiled module.

Jit compiled functions would be an implementation, where an interpreter searches for compiled 
function, if it finds one, uses it, if not, compiles code and runs it, just like in julia.

Interpretation is the standard mode, and compilation / jit compilation are extra features.

The language is inherently type-less, which means, the data has to be used with functions designed
for correct types to create correct results. Type is in fact only an extra identifier, that can be
read by the interpreter during execution. Due to constant folding, when the interpretation is being 
compiled, types are not needed, as they are usually constant. Hence, via code optimization, all code checks
are being compile-time computed, and unnecessary object structures are being dropped during compilation.
For instance, consider the following code:

```julia
let foo(x)
   return 2*x + 3 
```
An integer is a tuple of object type and data, hence the function signature is as follows:
```julia
(type::Symbol: Int, data::Any) -> (type::Symbol: Int, data::Any)
```
During interpretation, the function creates such tuple firstly multiplying x by 2 and later adding 3. 
But because for x being an integer, the 2 times x always creates an integer, which is non excaping,
it is being compile time computed, and removed, as it is not escaping and later never used. The interpreted function does the following:
```julia
# add_int_int: (int, int) -> int
# add_any_any: ((type, int), (type, int)) -> (type, int)

let add_any_any(a, b)
   if a[0] = Int and b[0] = Int # The language does not have out of the box polymorphism.
      return (Int, add_int_int(a, b)) # Here we have to create a tuple! 
    ...

let mul_any_any(a, b)
   ... 

add_any_any(mul_any_any(x, 2), 3)
```
while compiled function, due to constant folding does this:
```julia
add_int_int(mul_int_int(x, 2), 3)
```

# Specialization

The programmer is responsible for what he want to compile. The compilation does specialization always and based on all compile-time constants and assumptions. We already know, that the programmer defines compile-time constants with the let keyword.

# Functional Programming

The language is not primarily functional, however, functions are useful abstraction for mathematics.
We have:
* first class functions
* no side effects for functions

However, the functions can be analysed e.g. we can exctract functions from composition $f \circ g$ etc.
Functions are with math in mind, taking gradients etc. not necessarily for functional programming style.

## Mathy stuff

Gradients are derivatives. A derivative is a function, that returns something for an argument. Instread of
pullback functions, we rather create abstract gradient value, that can be multiplied with other things and
pullback is a multiplication for this type.

For instance, mapping one function on a vector has a diagonal jacobian. We do not want to create a full matrix
jacobian, but we do not want pullback either. So we return a diagonal matrix. And the diagonal matrix is 
smaller than a full matrix, and also multiplying matrix by it is optimised.

## Memory Allocation

### Compile time malloc

# TODO

* type theory 


# Cool Resources

* [tput commands](https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x405.html)
* [tput commands better](https://www.gnu.org/software/termutils/manual/termutils-2.0/html_chapter/tput_1.html)
