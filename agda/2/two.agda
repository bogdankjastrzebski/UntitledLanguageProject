module two where

-- import Relation.Binary.PropositionalEquality as Eq
-- open Eq using (_≡_; refl)
-- open Eq.≡-Reasoning using (begin_; _≡⟨⟩_; _∎)

data ℕ : Set where
    zero : ℕ 
    suc : ℕ → ℕ

{-# BUILTIN NATURAL ℕ #-}

_+_ : ℕ → ℕ → ℕ 
zero + n = n
(suc m) + n = suc (m + n)

_*_ : ℕ → ℕ → ℕ
zero * _ = zero
(suc m) * n = n + (m * n)

_^_ : ℕ → ℕ → ℕ 
m ^ zero = suc zero
m ^ (suc n) = m * (m ^ n)

-- _-_ : ℕ → ℕ → ℕ
-- m - zero = m
-- zero - _ = zero
-- (suc m) - (suc n) = m - n
--_-_ : ℕ → ℕ → ℕ
--m - n = ?

infixl 6 _+_ -- _-_
infixl 7 _*_


