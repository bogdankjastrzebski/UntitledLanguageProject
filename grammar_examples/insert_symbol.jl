using DataFrames

# What if we would want to allow better working with macros? 

df : sql
	select a, b, c from df
	where a > 0
	groupby c
	having mean(b) < 3

# magic_a : quote a # (symbol a)
magic_a : S"a" # symbol a

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
# Notice, that this is usually not possible.

# But only because the main macro strategy says so,
# in general the language does not have that feature.












