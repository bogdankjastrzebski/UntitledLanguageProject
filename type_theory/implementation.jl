

struct LazyFunction
	func::Function
end

struct UnknownValue
	

function (l::LazyFunction)(args...)
	return l.func(args...)
end




