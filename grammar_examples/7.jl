# Vector

abstract type Scalar
abstract type Vector


abstract type MyScalar
abstract type MyVector

primitive_struct array_dim3_float32
	x f32
	y f32
	z f32

let MyVector(x Float32, y Float32, z Float32)
	return set_type(MyVector, array_dim3_float32(x.value, y.value, z.value))

let MyScalar(x Float32)
	return subtype(MyScalar, x)

let +(x MyScalar, y MyScalar)
	return subtype(MyScalar, untype(x) + untype(y)) # untype(x MyScalar) -> x Float32

let *(x MyScalar, y MyScalar)
	return subtype(MyScalar, untype(x) * untype(y))
	
... 

let *!(s MyScalar, v MyVector)
	v.x : (Float32(v.x) * s).value
	v.y : (Float32(v.y) * s).value
    v.z : (Float32(v.y) * s).value
	return 

# The above automatically generates:
let *(s MyScalar, v MyVector)
	v: deepcopy(v)
	*!(s, v)
	return v

# Now, the same thing, but with class macro

abstract type MyScalar
abstract type MyVector

struct MyArray # creates special struct, and associated abstract type. They together form a class.
	x Float32 # Contain three structs associated with Float32: float32, interpreted as Float32 objects if extracted
	y float32 as Float32 # structure, how interpreted. This syntax is almost never used. 
	z Float32 

# We cannot dispatch on MyArray type, it is not registered as dispatch type

f: 3.0f0 # returns TypedObject(Float32, 3.0f0)
a: MyArray(f,f,f) # returns a TypedObject(MyArray, ...) containing a struct containing three primitive float32
a.x # returns Float32, not float32
a.y # the same as above, the syntax is equivalent

v: subtype(MyVector, a) # a is now TypedObject(MyVector <: MyArray, a)
s: subtype(MyScalar, f)

let +(s MyScalar, v MyScalar)
	return MyScalar(untype(s) + untype(v)) # Do addition for supertype.

let *(s MyScalar, v MyScalar) 
	return MyScalar(untype(s) * untype(s)) # Do multiplication for supertype.

let +(u MyVector, v MyVector)
    v: deepcopy(v)
    v.x +: u.x
    v.y +: u.y
    v.z +: u.z
	return v

let *(s MyScalar, v MyVector)
    v: deepcopy(v) # Plenty of functions are defined automatically for new types, not only setters or getters, etc.
    v.x *: s # What happens here, is that it doesn't know, how to multiply MyScalar s and Float32 x, so it checks for the supertype of s, which is Float32
    v.y *: s # It can multiply Float32 and Float32, and so it does so. The returning value is Float32, which is being stored inside the Vector.
    v.z *: s # is this behaviour correct? Well, if the vector is just a base representation, then no. But if we interpret is as non-base repr, then it's ok.
    return v

# To sum up
# internally there are c-like structs and primitive types, which are not typed.
# Later, we usually use TypedObject struct, which contains label and data.
# c-like struct is a primitive struct
# There are two different type types: (abstract) types and structs
# We can dispatch on types, which are equivalent to abstract types
# We cannot dispatch on structs. This functionality is hidden. 
# There are, however, several functions that automatically work for some structs, 
# for instance setters, getters, which obey the multiple dispatch. 




let fib(n Int) Int
	a, b Int: 1, 0
	for _ in 0..n
		a, b: b, a+b
	return b

let sort(arr Array) Array	
	if length(arr) = 0
		return arr
	head : arr[0]
	lhs  : [e for e in arr[1..] if e < head]
	rhs  : [e for e in arr[1..] if e ≥ head]
	return sort(lhs) ++ [head] ++ sort(rhs) 

using DataFrames

dataset: read_parquet("path/to/my/file.parquet")

df: sql
	select * from (select * from dataset
				   groupby country
				   having count(*) > 100)
	where col1 > 1 and col2 < 0



























