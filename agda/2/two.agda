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

_-_ : ℕ → ℕ → ℕ
m - zero = m
zero - suc n = zero
suc m - suc n = m - n

data _≡_ {A : Set} (x : A) : A → Set where
    refl : x ≡ x

infix 4 _≡_

+-assoc : ∀ {x y z} → x + (y + z) ≡ (x + y) + z
+-assoc {x} {y} {z} Z= {!!}

infixl 6 _+_ -- _-_
infixl 7 _*_


