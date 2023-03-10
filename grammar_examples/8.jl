
# Which method is selected first?

let foo(x A, y B) # impl1
	return ... 

let foo(x B, y A) # impl2 
	return ... 


x: A(B(...)) # A <: B <: ... 
y: B(A(...)) # B <: A <: ...

foo(x, x) # impl ? 
foo(x, y) # impl 1
foo(y, x) # impl 2
foo(y, y) # impl ?

# Yet, we could make foo(x, x) go to impl 1 and foo(y, y) to impl 2,
# making the first argument more important, than the second one.
# Would it resolve all possible errors in typing?

# For 



