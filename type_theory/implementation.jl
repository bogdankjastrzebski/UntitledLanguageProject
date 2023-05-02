
abstract type MaybeKnown end

mutable struct CallCons <: MaybeKnown
	operator
	operand
end 

mutable struct Value <: MaybeKnown
	name::Symbol
	known::Bool
	value
end
Value(name::Symbol) = Value(name, false, nothing)
Value(arg) = Value(:literal, true, arg)

function is_known(value::Value)
	return value.known
end

function is_known(::CallCons)
	return false
end

function (fun::MaybeKnown)(arg::MaybeKnown)
	if is_known(fun) && is_known(arg)
		return Value(fun.value(arg.value)) 
	end
	return CallCons(fun, arg)		
end

# Example 
a = Value(3)
b = Value(4)
c = Value(:c)
add = Value(x -> y -> x + y)

add(a)(b)

add(c)(b)

# Example 2 

k = Value(2)
v = Value(:v)
f = Value(x -> add(x)(v)) # error! 
f = add(v)

f(v)

f(k)

f = Value(x -> add(x)(v).value)


# function (fun::CallCons)(arg)
# 	return CallCons(fun, arg)
# end
# 
# function (fun::Value)(arg::CallCons)
# 	return CallCons(fun, arg)
# end	







