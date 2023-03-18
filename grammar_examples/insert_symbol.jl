using DataFrames

# What if we would want to allow better working with macros? 

df : sql
	select a, b, c from df
	where a > 0
	groupby c
	having mean(b) < 3

# magic_a : quote a # (symbol a)
magic_a : s"a" # symbol a

# Now consider the following. In a sentence: "A does something.",
# the word "A" refers to its designate. Another way to refer to A, 
# is to say: "The designate of 'A' does something.". Before the "A"
# we specify, that we refer to a designate of a symbol. If the word 
# "magic_A" designates symbol "A", then we can say: 
# "The designate of magic_A does something.". We designate symbols
# by prefixing them with $.  

vec : sql select $magic_a from df
# The above is equivalent to: 
vec : sql select a from df
# But only because the main macro strategy says so,
# in general the language does not have that feature.

# How to interpret it?
# A problem: nested macros 
vec : sql select $magic_a from df
(s"set" s"vec"
	(s"sql" s"select" magic_a s"from" s"df")) # This is what we want.

# There is a problem, from which scope should we take magic_a

A : 0
B : 1

magic_a : s"B"
quote 
	magic_a : s"A" 
	quote
		print($magic_a)
# what will the above do?
# notice, quote is a simple macro.
# in the previous example, we would like it to
# insert s"B", so from the oldest scope.
# in this case, it should probably be s"A"


# maybe instead do this:

vec : literal magic_a in
	sql select magic_a from df

# The literal macro takes magic_a as a symbol
# finds all occurences in the below code, 
# and replaces them with the value from the above scope.

# The ultimate question is, is it possible to make the upper
# efficient?
# We probablty should precompute everything in the macro up
# to the point, where it is possible.

# For instance:
"""
Replaces symbol with the argument is a code.

We suppose the code is just list of symbols.
"""
let replace_symbol(symbol, argument, code)
	if code isa Cons
		return replace_symbol.part(symbol, argument).map(code)
	  else # code isa Symbol
		return argument if x = symbol else x 	
 
let literal symbol code...
	quota : quote
		eval(replace_symbol(__literal_symbol__, __literal_arg__, __literal_code__))
	return replace_symbol(s"__literal_symbol__", Cons(s"quote", symbol),
		   replace_symbol(s"__literal_arg__"   , symbol,
		   replace_symbol(s"__literal_code__"  , Cons(s"quote", code),
		   quota)))






 









  





















