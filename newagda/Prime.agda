module Prime where

open import Equivalence
open import NaturalNumbers

open ≡-Reasoning

private
    variable
        n m : ℕ


data Range : ℕ → ℕ → Set where
    Rzero : Range n m
    Rsuc  : (k : Range n m) → Range (suc n) (suc m)


record Prime : Set where
    field
        value : ℕ
        proof : (k : Range (suc (suc zero)) m) → (
