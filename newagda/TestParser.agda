module TestParser where

open import NaturalNumbers
open import Equivalence

_//_ : ℕ → ℕ → ℕ
zero // n = n
suc m // n = suc (m // n)

_//_//_ : ℕ → ℕ → ℕ → ℕ
m // n // k = (m // n) // zero 

infixr 10 _//_
infixr 11 _//_//_

theorem : ∀ {m n k : ℕ}
    → m // n // k ≡ m // n // zero
theorem {m} {n} {k} = ?
