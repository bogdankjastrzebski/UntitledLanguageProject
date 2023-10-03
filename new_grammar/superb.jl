
# Processors
using Device

let fib(n)
    d := Device()
    d.set a : i32 = 1
    d.set b : i32 = 0
    d.while n > 0
        a, b = b, a + b
    return Integer(d.b)
        

