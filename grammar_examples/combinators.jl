using DataFrames
using Parquet

# Introducing idea of combinators
"""
A combinator is a macro, that cannot read symbol names.
Hence, only the structure of the input matters. With 
combinators, you can write macros without keywords, 
that are usually much more useful.

"""

df : Parquet.read("path/to/df", DataFrame) # Loading data. 

df : df.select(col"a", col"b", col"c") # How we would write it without macros.
	   .from(df)
	   .where(col"a" > 3) # col"a" creates Column("a") object. Column("a") > 3 -> FilterCriterium(...) (Lazy evaluation) 
	   .groupby(col"c")
       .having(mean(col"b") < 0)

df : sql # This is standard macro. The problem is, if we have column names in
	select a, b, c from df # an array, how to pass them to a macro? 
	where a > 3 # Since people will write mostly with macros, allowing both this
	groupby c   # syntax, that translates into the above will make the above unknown. 
	having mean(b) < 0

df : pipe df # Here we have different thing. This combinator is fully keyword agnostic.
	select   col"a", col"b", col"c" # translates into .select(col"a", col"b", col"c") 
	where    col"a" > 3           # translates into .where(col"a" > 3) 
	groupby  col"c"  # translates... (the combinator just adds dot and brackets) 
	having   mean(col"b") < 0  # so..., mean(col"b") < 0 -> FilterCriterium(...) 

# We get the best of both worlds. We made the syntax much cleaner, while 
# the combinator if very easy to understand. 

# A different example: 

let swap a b
	temp: gensym()  
	return quote
		$temp : $a
		$a : $b
		$b : $temp
		del $temp

# Notice, that swap does not refer to the symbols, it simply generates more code.


# Let's say, that we actually do not have macros, only combinators. We can create a macro
# in the following way:

let my_combinator code...
	quoted_code : gensym() 
	return quote 
		$quoted_code : quote $code... 
		my_macro_function($quoted_code)
		del $quoted_code

let my_macro_function(quoted_code)
	# Now we can access symbol name... 
	... # quoted_code -> generated_code 
	# remember, code is not automatically evaluated, we have to do it ourselves:
	eval(generated_code) 

# In theory we can do everything, but the default way is to use just combinators
# or to translate the code into a representation of a code (perhaps using builin quoted expressions)
# and then run the code.

col"time to last period"
col"something"
col"set price"
 










		
	


