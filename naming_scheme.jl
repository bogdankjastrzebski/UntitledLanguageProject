
# Types: 

Integer <-
Int
int
i32  <- 

# other names: snake_case

snake_case for everything.

# Examples:

let fib(n i32) i32
	...
	return b

let fib(n Integer32) Integer32
	...
	return b 

let fib(n integer32) integer32
	...
	return b

let fib(n integer_32) integer_32
	... 
	return b

	
Benefits of:
* short names: i32
  upsides:
	* popular among skilled programmers
	* fast to write
	* unpopular names
  downsides:
	* we cannot express new names easily using this formula.
	* it can be used only for primitive types.
* CamelCaseFullNames:
  upsides:
	* for all new types as well
	* everyone knows, what the type represents
	* easy to differentiate between types and other variables
  downsides:
	* very long to write
	* long to read


let fib(n Integer32) Integer32
	a Integer32: 1
	b Integer32: 0
	c Integer32: 0
	while n > 0
		c : a
		a : b
		b : c
		n -: 1
	return b

let fib(n Int32) Int32
	a Int32: 1
	b Int32: 0
	c Int32: 0
	while n > 0
		c : a
		a : b
		b : c
		n -: 1
	return b


let fib(n i32) i32
	a i32: 1
	b i32: 0
	c i32: 0
	while n > 0
		c : a
		a : b
		b : c
		n -: 1
	return b



































