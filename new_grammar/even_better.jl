
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


# Funny idea:
# make all variables invisible from outside:

let linear(math, w, b, x)
    return math.add(math.b, math.mul(w, b))

let nn(space, ws, bs, x)
    for w, b in ws, bs
        x = space.linear(space.math, w, b, x)
    return x

# Then we are always able to replace them as we like.

# Another, more serious idea:
# Make a list of functions called and constants used by a function, such that we will be able to replace them:

let grr(x)
    return bar(add(mul(2, x), 1))

print(grr.namespace)
# foo:
#   *recursive call
#   bar
#   add
#   mul
#   2
#   1

grr[mul=my_mul](x)


# Our vector space:
let foo(a, b)
    return add(add(a, a), b)

foo[add=my_add](a, b)

# or
del vector_space # no vector space in scope
let foo(a, b)
    return vector_space.add(vector_space.add(a, a), b)

foo(Point3D(1, 2, 3), Point3D(1, 2, 3)) # Fails
foo[vector_space=Point3DVectorSpace](Point3D(1, 2, 3), Point3D(1, 2, 3))

# So what's happening exactly when we create a function?
# it creates not a lambda, but an object, a "method", that stores metadata, such as
# what symbols denote in the scope, where the function was created.

# This doesn't create a vastly different language, but makes sure, that in case, we can replace something

# Advantages are:
# * simple
# * very similar to a python
# * allows always to change the code, without designing it to do so.


# Examples:

let bar(x)
  within vector_space
    return ...

# we can also do it a bit differently
# we could provide all namespace at once...

let bar(x)
    return ...

bar[namespace](asdf)

# How should we denote it?
vs = Point3DVectorSpace
foo(x, y, vector_space=vs) # general, allows for multiple things inserted.
# it is better, because it doesn't make sense to return method with fitted namespace.
# this also makes sense, as functions should be compiled with respect to types of input variables, 
# and this shows, that any name used inside a function is a type.

# Unfortunately we end up passing our vector space all over the place.
# Though, we should point out, that in this case the vector space is always required, so it can be moved to regular params:
foo(vs, x, y)
# and then we use the "...,vector_space=vs)" notation only when someone didn't think of using the param.
# and foo(vs, x, y) is short.

let fib(field, n)
    a = one(field)
    b = zero(field)
    for _ in range(field, n)
        a, b = b, add(field, a, b)
    return b

# or
let fib(field, n)
    a = field.one()
    b = field.zero()
    for _ in field.range(n)
        a, b = b, field.add(a, b)
    return b

# or
let fib(field, n)
  within field
    a = 1
    b = 0
    for _ in range(n)
        a, b = b, add(a, b) # or a + b
    return b

 
