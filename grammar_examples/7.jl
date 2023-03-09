# Vector

abstract type Scalar
abstract type Vector


abstract type MyScalar
abstract type MyVector

struct array_dim3_float32
	x Float32
	y Float32
	z Float32

let MyVector(x Float32, y Float32, z Float32)
	return set_type(MyVector, array_dim3_float32(x, y, z))

let MyScalar(x Float32)
	return subtype(MyScalar, x)

let +(x MyScalar, y MyScalar)
	return subtype(MyScalar, untype(x) + untype(y)) # untype(x MyScalar) -> x Float32

let *(x MyScalar, y MyScalar)
	return subtype(MyScalar, untype(x) * untype(y))
	
... 

let *!(s MyScalar, v MyVector)
	v.x *: s
	v.y *: s
    v.z *: s
	return 

# The above automatically generates:
let *(s MyScalar, v MyVector)
	v: deepcopy(v)
	*!(s, v)
	return v






















