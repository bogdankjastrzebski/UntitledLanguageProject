
import re

# parser for keyword-less syntax

examples = [
"""
f(x) := 3 * x + 1 # -> (set! f (lam (x) ()+ (* 3 x) 1)))
""",
"""
f(y): A → B = {
    f(x): i32 = 3 * x + 1 # -> (set! f (lam (x) ()+ (* 3 x) 1)))
    line;
    f(g(h, y(z)))
}
""",
"""
f(x).g(y.h + 3).h.c.d.e + g.h
""",
"""
f(X: (o: O) → A, Y: (o: O) → A): (o: O) → A = X + Y
""",
"""
f(X: (o: O) → A,
  Y: (o: O) → A): (o: O) → A = X + Y
""",
"""
f{[(3)]}
""",
"""
f: Optional(N) → N = [
    Just(n) = n
    Nothing = 0
]
""",
"""
switch(alpha)[*args] := [*args][alpha]
result := switch(alpha)[
    Just(n) = n
    Nothing = 0
]
""",
"""
@cache
fib: N → N = [
   [0] = 0
   [1] = 1
   [n] = fib(n-1) + fib(n-2)
]
""",
"""
fib(n: N, a=1, b=0): N = [
    [  0, a, b] = b
    [n+1, a, b] = {
        c := a + b
        fib(n, b, c)
    }
]
""",
"""
mul(X: (ω: Ω) → (m: ℕ) → (n: ℕ) → ℝ,
    Y: (ω: Ω) → (n: ℕ) → (k: ℕ) → ℝ) := {
    ⊢ sum(n ↦ (X * Y)[n=n])
}
"""
]



#
#
# f(y) := {
#     line
#     line
#     line
# }
# f(y) := {;
#     line;
#     line;
#     line;
# };
# f(y) := {; line; line; line; };
# 
# 




def bracketize(line):
    if type(line) not in [list, tuple]:
        return line
    ret = []
    while len(line) > 0:
        t = line.pop(0)
        if type(t) is not str:
            ret.append(t)
        elif t[0].isalpha() and t[-1] in '([{':
            ret.append((
                'call' + t[-1], t[:-1],
                bracketize(line)
            ))
        elif t in '([{':
            ret.append((f'__{t}__', bracketize(line)))
        elif t in ')]}':
            break
        else:
            ret.append(t)
    return infixize(ret)


def infixize(line):
    if type(line) not in [list, tuple]: return line
    for symb in reversed('.→:*/+-,↦=;'): # Hey, maybe it is easy to write infixr and infixl!
        if symb not in line: continue
        ind = line.index(symb)
        return ( # this is infixl
            symb,
            infixize(line[:ind]),
            infixize(line[ind+1:]),
        )
        # this is infixr (conceptual)
        ind = len(line) - reversed(line).index(symb) 
        return (
            symb,
            infixize(line[:ind]),
            infixize(line[ind+1:]),
        )
    return tuple(line)


# def popblock(tokens):
#     block = []
#     line = []
#     while len(tokens) > 0:
#         t = tokens.pop(0)
#         match t:
#             case ';':
#                 block.append(infixize(line)) # bracketize(line))
#                 line = []
#             case t if t[-1] in '{([':
#                 line.append((
#                     *('call' + t[-1], t[:-1]
#                     if t[0].isalpha() else
#                     f'__{t}__'),
#                     popblock(tokens),
#                 ))
#             case t if t in '})]':
#                 break
#             case _:
#                 line.append(t)
#     return block





def parse(string):
    for s in '↦!@#$%^&*+=-~?/\\|:;><})],.':
        string = string.replace(s, f' {s} ')
    for s in '{([':
        string = string.replace(s, f'{s} ')
    # b = 0
    # letters = []
    # for s in string:
    #     if s in '([': b += 1
    #     if s in '])': b -= 1
    #     if b < 0: raise Exception("brackets do not match")
    #     if b > 0 and s == '\n': continue
    #     letters.append(s)
    # string = ''.join(letters)
    return ' ; '.join([
        line.split('#', 1)[0].rstrip()
        for line in string.splitlines()
    ]).split() + [';']
