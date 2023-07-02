
# Levels of abstraction:

## 1. just lambda:
foo = lambda(x) x + x



## 2. dispatched lambda:
### a. typed values
struct typed_value
    type
    value

foo_int = lambda(x) 2 * x
foo_float = lambda(x) 2.0f0 * x
foo = lambda(x) {int: foo_int, float: foo_float}[x.type](x.value)

## 3.a via dispatch lambda
foo_dispatch = lambda(t) foo_int
foo = lambda(x) foo_dispatch(x.type)(x)
foo_dispatch = lambda(t) foo_int if t is int else foo_float

## 3.b simple modifiable lambda:
foo_dict = lambda(t) error if t is not int else foo_int
foo = lambda(x) foo_dict(type(x))(x)

foo_dict = \
    with foo_dict as foo_dict_prev
        lambda(t) foo_float if t is float else foo_dict_prev(t)

## 3.c best of a and b, modifiable lambdas:
...

# we want to build from it math structures:
# but what is it?
#
# Maybe we should pass a context to a function?


let foo(vector_space, a, b)
    assert a isa vector
    assert b isa vector
    return vector_space.add(vector_space.add(a, a), b)

# 
RealField = Field(
    set=Real,
    addition=add_Real,
    multiplication=mul_Real,
)
Point3DVectorSpace = VectorSpace(
    field=RealField,
    set=Point3D, 
    addition=add_Point3D,
    multiplication=mul_Real_Point3D,
)

foo(Point3DVectorSpace, a, b)

# And for covenience, we can:

with Point3DVectorSpace as V
    foo(V, a, b)

# or we can do this like this:

Point3DVectorSpace.foo = lambda(a, b) add(add(a, a), b)
 
Point3DVectorSpace.foo(a, b) # This will use add_Point3d as add

# and maybe:
within Point3DVectorSpace
    foo(a, b)

# by is it correct? 
# what are difficulties?


