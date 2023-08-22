module RationalNumbers where

open import NaturalNumbers
open import Equivalence
open ≡-Reasoning


gcd : ℕ → ℕ → ℕ
gcd m n = ?


data ℕ₊ : ℕ → Set where
    next : ∀ (m : ℕ) → ℕ₊ (suc m)

record ℚ : Set where
    constructor _//_
    field
        ↑ : ℕ
        ↓ : ℕ

data _≡ℚ_ (x : ℚ) : ℚ → Set where
    refl : x ≡ℚ x


