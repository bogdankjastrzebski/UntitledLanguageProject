

: for type theory
= for setting

n: Int
n = 0
n: Int = 0
n := 0 # type infered

f: I ↦ I

true: Bool = x ↦ y ↦ x
false: Bool = x ↦ y ↦ y

pair: T → T → Bool → T = \
    a ↦ b ↦ p ↦ (p a b)

first: (Bool → T) → T = \
    p ↦ (p true)

second: (Bool → T) → T = \
    p ↦ (p false)

(pair 3 4): Bool → T

(first (pair 3 4))

f: I → I → I = x ↦ y ↦ x + y

foo: Int × Int → Int = (x, y) ↦ x + y
    
let foo(x: Int, y: Int): Int
    return x + y

let fib(n: Int): Int
    a, b, c: I32 = 1, 0, 0
    while n > 0
        c = a
        a = b
        b = c
        n -= 1
    return b




        

 



