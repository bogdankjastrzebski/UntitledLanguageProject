# Automatic Differentiation

# Firstly, automatic differentiation is for functions!

function fib(n): n if n < 2 else fib(n-1) + fib(n-2)

function fib(n)
	rec: lambda(n, a, b)
		b if n = 0 else rec(n-1, b, a+b)
	return rec(n, 1, 0)

function fib(n)
	return loop rec(n, a, b)
		b if n = 0 else loop(n-1, b, a+b)

# But not any functions:

function forward(w, b, x)
	return w * x + b # all is broadcasted!

J: forward.part(w, b).derivative(x) # this one? Super verbose 
J: forward.part(w, b).der(x)
J: forward.p(w, b).d(x) # maybe this one? 
J: forward.part(w, b)'(x)
J: forward(w, b, _)'(x) # this one? looks cool

# J: (x -> forward(w, b, x))'(x) # Julias Notation is still one of the longest

# Jacobian is something similar to diagm(w), which is implemented
# efficiently both memorywise and computationalwise, i.e., 
# the product of it and another vector is simply 
# element-wise multiplication and is linear in complexity.

# Derivatives/Jacobians are between two normed normed vector spaces.
# The vectors can be anything from numbers, arrays to functions etc.
# For obvious reasons it is not always possible, to fill out whole interface.

# What king of things do we want to do with jacobians? What is the interface?

# Firstly, we want jacobian vector product. 
# Secondly, we want jacobian jacobian product.
# Maybe we need only jacobian jacobian product?














