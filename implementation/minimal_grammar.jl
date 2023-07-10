
# The minimal grammar is a minimal language, which will implement the rest of the language.

# We do language from combinatory logic, based on lambda calculus:
# λ x y z -> y[x := z]
# we will have a lot syntactic sugar over it.

# Macros can be implemented, when what we write actually evaluates by default to code, and only after 
# we can evaluate it properly: 

(cons a b) ≡ (lambda (x) (x a b))
where x:
    true ≡ (lambda (x y) x)
    false ≡ (lambda (x y) y)

We have symbols, that are strings.

The default functions work as follows:
(foo (bar))
    1. (bar) evaluates to (cons :bar :nil)
    2. inside foo:
        arg = eval(:(bar))
        foo_inner(arg)
    3. because of our super duper language features, we have extra step:
        type = eval_type(:(bar)) # evaluates constants related to bar (type, ...)
        foo_inner = foo_generated(type)
        arg = eval(:(bar))
        foo_inner(arg)
 
 
