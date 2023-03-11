
## Different Idea of Types

"""
Different idea.

Groups: Set and group operation group_operator(., .)

"""

# Our library

let foo(x GroupElement)
	x: untype(x)
	return group_operator(x, x)  # Returns Group Element 

let bar(x GroupElement, y GroupElement)
	x: untype(x) 
	y: untype(y)	
	return ...

# Our own type

abstract type MyGroupElement

let group_operator(x MyGroupElement, y MyGroupElement) GroupElement # Returns GroupElement<:MyGroupElement
	return ... 

# So the idea was, to make the type the following way
# We make dispatch only on the final type. If there is no function, it fails.
# 
# For example, if we have only the aforementioned bar implementation, then
# we can only use it, for elements, whose newest type is GroupElement
# inside functions in our library, the x and y are firstly untyped.
# So for all functions used inside foo and bar, dispatch is made on their previous type.

x GroupElement<:MyGroupElement<:Int: 3

foo(x) # calls foo and then group_operator for MyGroupElement

# It is not very convenient, but it is fully controllable by the programmer.
# It is also very easy to understand.
# Better syntax for it should be:

let bar(x GroupElement, y GroupElement)
	untype x y
	return ... 

let bar(x<:GroupElement, y<:GroupElement)
	# where a<:T means subtype(GroupElement, a)  
	return ...










