
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
