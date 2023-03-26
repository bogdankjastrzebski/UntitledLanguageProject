
# What are the advantages and disadvantages of zig?

# Normal macro is difficult to fuze with code. 
# The compute time is something relativelly easy to do.

# Normally, we use compile-time constants, which has an escape feature:

struct TypedObject
	const type  DataType
	value Void 

let typeof(x anytype) datatype
	return x.type 

let foo_i32(x i32) i32  
	return x + x

let foo_f32(x f32) f32 
	return x * x

let foo(x anytype) typeof(x)
  switch typeof(x)
	i32 => foo_i32(x)
	f32 => foo_f32(x)
	else => unrecheable

# Because the type field of the TypedObject is constant, 
# the switch statement in foo will be evaluated at compile time.

# My initial idea was to make assumptions before compilation.
# So in different cases, type can be known or not, hence 
# in my version foo not knowing the type would evaluate it at runtime.

# The zig's version would be to use the constants, but also use the 
# comptime keyword. Now, the comptime keyword allows to run any function at compile time.
# It would be worthless, if we didn't have compile time variables.

# How to write a system, which can escape to runtime, if fails to do something at compile time?
# Firstly, maybe we could actually make a system, where we can escape even in zig, if we used comptime.

enum Type
	I32
	F32 

struct TypedObject
	type const Type
	value Any

let foo(type, value)
	switch type
	  case I32
		return value + value
	  case F32
		return value * value

let bar()
	value : rand([
		TypedObject(I32, 1),
		TypedObject(F32, 1.0),
	])
	return foo(value.type, value.value)

let rab()
	value : TypedObject(I32, 1)
	# Remember! Having value is equivalent
	# to having value.type and value.value
	# variables in the scope. The value.type is
	# constant, hence we can do constant folding with it.
	return foo(value.type, value.value)

# The rab knows the type of value via inference,
# the type is also constant, so the switch can be evaluated
# at compile time.

# on the other hand, in bar compiler does not know the type
# of value, hence it has to be done during runtime.

# Remember, the reason

# great thing from c++ is the consteval keyword for if statements.

if comptime
	asdf
  else
	asdf

	# Very useful
	
			









