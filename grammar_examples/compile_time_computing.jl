
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













