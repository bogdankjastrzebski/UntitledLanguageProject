
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
		return fun.value(arg.value) 
	end
	return CallCons(fun, arg)		
end

# Example 
a = Value(3)
b = Value(4)
c = Value(:c)
add = Value(x -> Value(y -> Value(x + y)))

add(a)(b)

add(c)(b)




# function (fun::CallCons)(arg)
# 	return CallCons(fun, arg)
# end
# 
# function (fun::Value)(arg::CallCons)
# 	return CallCons(fun, arg)
# end	







