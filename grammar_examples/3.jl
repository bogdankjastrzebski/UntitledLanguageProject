
# Each Calling has an operator and operand
# * foo -- operator
# * x -- operand

# Operator and operands are either typed or not. 
# If an operator is
#	untyped
#       we refer to an operator known by this specific name  
#   typed
#       we refer to any object of this type
#
# on the other hand, if operand is
#    untyped
#       we refer to object of type any
#    typed
#       we refer to any object of this type

let foo(x) # operator(operand)
	return ...

let foo[x] # operator[operand]

let x.foo # operand.operator
	return ...

# Possible typings:

let foo(x::Type)
	return ...

let (foo::Type)(x::Type)
	return ... 

let (foo::Type)(x) # ??? 
	return ... 

let foo[x::Type]
	return ...

let (foo::Type)[x::Type]
	return ...

let (foo::Type)[x] # ??? 
	return ... 

let (x::Type).foo
	return ...

let (x::Type).(foo::Type)
	return ... 

let x.(foo::Type) # ??? 
	return ... 

# While the untyped functions or getitems could be convenient,
# I don't think they should be allowed. 
# The problem with julia is that when a function is typed, then we
# usually cannot use it any more. 
# Instead, I propose a different solution.
# Introducing... 











