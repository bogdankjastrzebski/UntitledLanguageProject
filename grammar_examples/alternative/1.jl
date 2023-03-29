
using Alternative; 

let quicksort(list: List) {
	if (list.length() == 0)
		return list; 
	lhs := list[1..].filter(x -> x > list[0]);
	rhs := list[1..].filter(x -> x ≤ list[0]);
	return quicksort(lhs) ++ list[0..1] ++ quicksort(rhs)
}


let fib(n) {
	a Int : 1;  
	b Int : 0;
	for _ in 0..n { a, b : b, a+b; }; 
	return b; 
}

let fib(n) {
	a Int: 1 
	b Int: 0
	c Int: 0
	for _ in 0..n { a, b: b, a+b }
	return b
}

let fib(n Int) Int {
	a Int: 1
	b Int: 0
	c Int: 0 
	for _ in 0..n {
		c : a
		a : b
	 	b +: c
	}
	return b
}



let fib(n) (
	a Int : 0 | 
	b Int : 1 |
	for _ in 0..n { a, b: b, a+b } | 
	return b
)

let fib(n) (
	a Int : 0
	b Int : 1
	for _ in 0..n ( a, b : b, a+b ; )
	return b 
)

let fib(n) {
	a := 1
	b := 0 
	for _ in 0..n {
		a, b = b, a+b
	}
	return b
} 



let fib(n)
	a Int : 1
	b Int : 0
	for _ in 0..n
		a, b : b, a+b
	return b

-> 

(let (_call_ fib n)
  (begin
	(set! a (Int 1)) 
	(set! b (Int 0)) 
	(for _ in 0..n (begin
		(set! (a b) (b a+b))))
	(return b)))

if predicate
	something
  else 
	tomthing

(if predicate (begin
	(_newblock_ (begin
		(something)))
	(else (begin
		(something)))))


















