using Something

let fib(n)
	if n < 2
	     return n
	   else
		 return fib(n-1) + fib(n-2)

let fib(n)
	return n if n < 2 else fib(n-1) + fib(n-2)


let fib(n)
	a: 1
	b: 0
	for _ in 0..n
		a, b: b, a+b
    return b

# double function syntax 

let foo(x)(y)
	return x + y

foo(3) -> lambda(y) 3+y; 

# macro syntax 

let show x
	name: str(x)
	return quote $name: $x

# Dot syntax:

let foo.bar
	...
	return do something

# -> means "something like", a different type of call.

foo.bar -> bar(foo) # but different type of call!

foo.bar.zzz -> bar(foo).zzz -> zzz(bar(foo))

foo.bar(zzz) -> (__call__ (__dot__ foo bar) zzz)
             -> (__call__ (__call__ bar foo) zzz)
			 ->  bar(foo)(zzz)

## Example: Map Reduce

f: lambda(x, y) ... 

f.part(x: 1).map([1,2,3]).sum()

lazysum(map(part(f)(x: 1))([1,2,3]))()

# To działa jak powyższa aplikacja funkcji, ale nie można jej
# zapisać w skladni funkcyjnej, by nie było kolizji!

# "Method" syntax

let foo.bar(zzz)
	return do_something(foo, zzz)

foo.bar -> lambda(zzz) do_something(foo, zzz)

## Podobne do double function!!!

## Dobra umowa: chcemy mieć () na końcu czegoś, co wykonuje pracę:

let (arr::Array).sum # Głupio tak pisać
	let temp() 
		s: zero(eltype(arr))
		for e in arr
			s +: e
		return s
	return temp

let (arr::Array).sum() ## Lepiej pisać tak
	s: zero(eltype(arr)) 
	for e in arr
		s +: e 
	return s

arr.sum -> lambda() ... 

# Array Programming

a: [1,2,3,4]

b: a * a

c: dot(a', a)

dot.part(_, 3).map([1,2,3])

map(part(dot)(_, 3))
























