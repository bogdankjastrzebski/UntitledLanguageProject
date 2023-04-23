
"""
Everything, that is possible to be run at compile-time, 
is being computed at compile-time. 

The key optimization is ability to change the memory,
that is required during run-time, i.e., removal of
fields, that are known at compile-time.

The fields can be used in runtime, as an escape.

For instance:
* type
* ref-count
* array length

It is possible, not to know a field value at any point in time.

We can definitelly previously know, and now don't.
We can also know now, but not previously.


Let's say, that we have a program A and a 
set of symbols, whose value is unknown.

We want to express the program through only the things we don't know.
Consider a lambda calculus, where compute everything up to the application
of an unknown symbol:

"""

begin with unknown n
	s : 0
	for i in 0..fib(5)	
		s +: i*n
	s	
	
"""
Above, we can:
* calculate fib(3)
* unroll the loop
* state, that s = 0+1*n+2*n+3*n+4*n
		then s = (1+2+3+4)*n = 10*n 
"""
	

The destroyable objects should work through standard optimization.
The optimization of memory should be a part of general optimization of
unused or compile-time used variables.








