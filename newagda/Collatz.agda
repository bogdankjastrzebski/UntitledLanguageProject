module Collatz where

data ℕ : Set where 
    zero : ℕ 
    suc : ℕ → ℕ

data Even : ℕ → Set
data Odd  : ℕ → Set

data Even where
    even-zero : Even zero
    even-suc : {n : ℕ} → Odd n → Even (suc n)

data Odd where
    suc : {n : ℕ} → Even n → Odd (suc n)

collatz : 
