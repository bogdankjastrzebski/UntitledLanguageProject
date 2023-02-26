

let fib(n)
	a: 1
    b: 0
    for _ in 0..n
		a, b: b, a+b
    return b

quot: quote
	temp : a
    a    : b
    b    : temp

quot:
  quote
	something
	something

data: 
  sql
	select * from dataframe
	where col1 > 0 and col2 < 0

data: sql
	select * from dataframe	
	where col1 > 0 and col2 < 0

let foo(a)
	if a = 0
    	 print(0)
	   a ≤ 1
    	 print(1)
	   else 
		 print(2)

	return a

func: lambda(x)
	for i in 0..n
		x +: i
		show x

complex: begin
	func: lambda(f, a, n) a if n ≤ 1 else a*f(f, a, b)
	return func(func, 1, 10)




	
	











# Evaluates to (__nl__ quot __colon__ (__nl__ quote (__nl__ something) (__nl__ something)))
#            = (set! quot (quote (something) (something)))




