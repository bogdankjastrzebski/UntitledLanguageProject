## Automatic Differentiation

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

J: forward.part(w, b).derivative(x) # this one? 
J: forward.part(w, b).der(x)
J: forward.part(w, b)'(x)
J: forward(w, b, _)'(x) # this one?

# J: (x -> forward(w, b, x))'(x) # Julias Notation is still one of the longest

# Jacobian is something similar to diagm(w), which is implemented
# efficiently both memorywise and computationalwise, i.e., 
# the product of it and another vector is simply 
# element-wise multiplication and is linear in complexity.

 









