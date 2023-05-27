# The language purpose

Meta programming differently.

Meta programming is creating programs writing programs.
Lisp-style meta-programming allows for building building
language constructs and executing them. We, on the other hand,
will focus on building programs in "external" languages.
This means, that there will be a difference between language,
which writes and the target langauge.


Example: 

Normally metaprogramming is about building expressions.
We will build functions:

let ∘(f : R -> R, g : R -> R): R -> R
    return λ(x) f(g(x))

f - program
g - program

h := f ∘ g - another program (1)

We actually metaprogrammed, but in a normal way.
we could now compile new function:

h_compiled = compile(h)

Then, actually (1) h = f ∘ g can be seen as a forming of a program.

normal metaprogramming would be:
f - program, takes R, returns R
g - program, takes R, returns R 

quote
    x = f(x)
    x = g(x)

this is great, because it uses language semantics, and we can analyse it.
What if we could analyse the first example?


struct Composition
    f: R -> R
    g: R -> R

let ∘(f, g)
    return Composition(f, g)

let (c: Composition)(x)
    return c.f(c.g(x))

h := f ∘ g

# And now, we can acually retrieve f and g:

f_ := h.f
g_ := h.g



