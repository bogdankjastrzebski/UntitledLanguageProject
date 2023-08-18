module HelloWorld where

_≡_




data ℕ : Set where 
    zero : ℕ 
    suc  : ℕ → ℕ

_+_ : ℕ → ℕ → ℕ 
zero + y = zero
suc x + y = suc (x + y)


