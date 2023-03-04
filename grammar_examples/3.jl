
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

# TypeWrappers

a: untyped(3) (a = 3)
b: 3          (b = TypedObject(Int, 3))
c: retype(b, String) (c = TypedObject(String, 3) ≠ TypedObject(String, "3"))

d: subtype(b, MyEnum) (d = TypedObject(MyEnum<:Int, 3)

## Example for field

# Imagine we have a library for field types:
let foobar(s::Scalar)
	return ... 

# We want to use it, so we create a scalar field

abstract type MyStringScalar alias MSS

let a::MSS + b::MSS
	return concat_strings(a,b).sort_letters()
let a::MSS * b::MSS
	return ... 
# It is not being checked, but + and * should be associative and commutative!
let zero(::MSS)
	return MSS("")
let one(::MSS)
	return ... 
# It if for you to check, that all the operations obey the axioms!
let negate(a::MSS) # -a 
	return ... 
let inverse(a::MSS) # a^-1
	return ...


a: MMS(Scalar("asdf")) (a = TypedObject(MSS <: Scalar <: String, "asdf"))

# When we run foobar(a) if firstly looks for foobar of MMS, and doesn't find an
# implementation. Then, it looks for foobar implementation for Scalar, and it finds one.
# In case it would not find foobar implementation for Scalar, then it would search 
# for foobar for String. Then it would fail. 


# In other words we have different type hierarchies, which belong to 















































