

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


