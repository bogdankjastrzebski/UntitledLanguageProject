
"""
Simplified language, for starters.

# Grammar:
* indentation
	* indents create new block
* brackets
	* brackets are matched,
	* inside a bracket we have a list of symbols
* symbols

Since symbols can be analysed as strings, we can implement the following:
* dot syntax: asdf.asdf
* math syntax: 2*asfd+3

It is not recommended though, to use this syntax.

"""

let fib(n i32) i32
	set! a 1
	set! b 0
	set! c 0
	while isless?(0, n)
		set! c a
		set! a b
		set! b a	
		sub! n 1
	return b

Analysis:
* the literal one: 1, is a compile time symbol.
* through type analysis and optimization, a becomes
  an i32, to match b and return type i32. c is of type a.
* we could use either lisp syntax (foo arg) or foo(arg) for
  function syntax.

So, there are two things in the language:
* symbols, including: 
	* characters: asdf
	* special symbols: *+:. 
	* strings:  " asfd a" is being read as one symbol.
	* combination thereof: *alpha.s"asdf asdf" 
* constructs, i.e., indents and language structure.

Alternative syntax:

let (fib n)
	set! a 1
	set! b 0
	set! c 0
	while (isless? 0 n)
		set! c a 
		set! a b
		set! b c 
		sub! n 1 
	return b

The syntax is enough to show the point. 

# Language

Consider transformation:
	((λf.ffn) (λf.λx. x < 2 ? x : x * (ff(x-1))))
	(λf.λx.x<2?x:x*(ff(x-1)))(λf.λx.x<2?x:*x(f(x-1)))n
	(λx.x<2?x:x*((((λf.λx.x<2?x:*x(f(x-1))))λf.λx.x<2?x:*x(f(x-1)))(x-1)))n

We end up with a function of n. We cannot evaluate it. Hence, we stop.
Though, the first steps get executed. The rule is, everything that can be executed,
is being executed:

(λx. ...) creates a function.
(f x) evaluates function iff:
* f is a known function
	* perhaps with unknown values inside a definition.
* and x is known. 

Do we want ever, to express the output in terms of the input?
	(λx.x<2?x:x*((((λf.λx.x<2?x:*x(f(x-1))))λf.λx.x<2?x:*x(f(x-1)))(x-1)))n
	n<2?n:n*((((λf.λx.x<2?x:*x(f(x-1))))λf.λx.x<2?x:*x(f(x-1)))(n-1))

It hardly does anything, we cannot evaluate it further, as it is infinite.

The question is, will the result always be the a function of unknown parameters?
The answer is probably not.









