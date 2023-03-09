
 =  ≤  ≥  ≠  >  <
== <= >= !=  >  <

i: 0 
while i ≠ 0
	print(i)
	i -: 1


let fib(n: Int): Int # Second best, confusing : at the end of name() similar to python
    a: Int = 1 # More accurate for type theory, but uses =, which we want use for comparison
    b: Int = 0
    for _ in 0..n
        a, b = b, a+b
    return b

let fib(n&Int)&Int # Looks tood, but & sign used usually in different context.
    a&Int: 1
    b&Int: 0
    for _ in 0..n
        a, b: b, a+b
    return b

let fib(n Int) -> Int # The winner, it has somewhat dangling type at the end, maybe with arrow is better, but usually we dont need to specify output type.
	a Int: 1 # See, that -> Int how output of the function is being denoted in Rust or python.
	b Int: 0
	for _ in 0..n
		a, b: b, a+b
	return b

let fib(n::Int)::Int # Too many colons 
	a::Int: 0
	b::Int: 1 
	for _ in 0..n	
		a, b: b, a+b
	return b

let fib(n Int)	
	if n < 2
         return n
	   else        
         return fib(n-1) + fib(n-2)
let fib(n Int)
	if n < 2
		return n
	return fib(n-1) + fib(n-2)


if n < 2
	  print(3)
   n < 3
	  print(4)
   n < 5
      print(5)
   else 
	  print(6)


case
  n < 0
	print(3)
  n < 1 
	print(4)
  else
	print(5)














