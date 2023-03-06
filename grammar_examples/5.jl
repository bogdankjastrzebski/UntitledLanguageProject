# An example implementation of fields

```
Axioms: 
* Associativity of addition and multiplication:
	a + (b + c) = (a + b) + c, and a ⋅ (b ⋅ c) = (a ⋅ b) ⋅ c.
* Commutativity of addition and multiplication:
	a + b = b + a, and a ⋅ b = b ⋅ a.
* Additive and multiplicative identity:
	there exist two different elements 0 and 1 in F such that a + 0 = a and a ⋅ 1 = a.
* Additive inverses:
	for every a in F, there exists an element in F, denoted −a, called the additive inverse of a, such that a + (−a) = 0.
* Multiplicative inverses:
	for every a ≠ 0 in F,
    there exists an element a^{-1} in F,
    such that a ⋅ a^{−1} = 1.
* Distributivity of multiplication over addition:
	a ⋅ (b + c) = (a ⋅ b) + (a ⋅ c).

```

### Operations:
# +(::MyType, ::MyType)
# *(::MyType, ::MyType) 
# negate
# inverse
# zero()
# one()

let parabola_vertex(a::Scalar, b::Scalar, c::Scalar)
	x: -b/(2*a)
	y: a*x^2 + b*x + c
	return (x, y) 

let parabola_roots(a::Scalar, b::Scalar, c::Scalar)
	Δ: sqrt(b^2 - 4*a*c)/(2*a)
	x: -b/(2*a)
	return (x - Δ, x + Δ)

abstract type OurScalar # Modulo 7

let +(a::OurScalar, b::OurScalar)
	return OurScalar(mod(Int(a) + Int(b), 7))

let *(a::OurScalar, b::OurScalar)
	return OurScalar(mod(Int(a) * Int(b), 7))

let zero(_::OurScalar)
	return OurScalar(Scalar(0))

let one(_::OurScalar)
	return OurScalar(Scalar(1))

let negate(a OurScalar)
	return OurScalar(mod(7 - Int(a), 7))

let invert(a::OurScalar)
	return euclidean_algorithm...


for _ in 0..n
	a, b = b, a+b
return b



let fib(n: Int): Int
	a: Int = 1
	b: Int = 0 
	for _ in 0..n
		a, b = b, a+b
	return b


let fib(n Int) Int
	a Int: 1
	b Int: 0 
	for _ in 0..n
		a, b: b, a+b
	return b

 

















