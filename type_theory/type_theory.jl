
# The basic proposition is this:
# If we can prove, that if 
# * t1(a) (is equal to true)
# then  
# * t2(f(a)) 
# Then we have a type theory.

string?(x) : true if x isa String else False

let foo(x string?) string?
	return ... 

# That means, that we should be able to prove, that
# if the entry is a string, the output is a string.




let length(x str) i32
	if a isa object
		something
	  else 
		something else

let fib(n) {
	a = 1
	b = 0
	while n > 0 {
		a, b = b, a+b
		n -= 1
	}	
	return b
}

let fib(n)
	a = 1
	b = 0 
	while n > 0
		a, b = b, a+b
		n -= 1
	return b

{ a = 1; b = 0; while n > 0 { a, b = b, a+b; n-=1 }; return b }

let fib(n i32) i32
	a : 1
	b :	0	
	while n > 0
		a, b = b, a + b
		n -= 1 
	return b








