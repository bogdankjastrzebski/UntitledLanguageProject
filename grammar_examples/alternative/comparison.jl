
fib(n i32) i32 : {
	a, b : 1, 0
	for _ 0..n { a, b : b, a+b }
	return b
}

let fib(n i32) i32 {
	a, b : 1, 0
	for _ 0..n { a, b : b, a+b }
	return b
}

let fib(n i32) i32
	a, b : 1, 0
	for _ in 0..n
		a, b : b, a+b
	return b

let fib(n i32) i32
	a, b : 1, 0
	for _ in 0..n { a, b : b, a+b }
	return b

fib(n i32) i32 :
	a, b : 1, 0
	for _ in 0..n
		a, b : b, a+b
	return b


fib(n i32) i32 : n < 2 ? n | fib(n-1) - fib(n-2)




