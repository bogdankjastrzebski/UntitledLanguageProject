module Decidable where

open import Data.Nat
open import Data.Fin
open import Data.List
open import Agda.Builtin.Equality

data ⊥ : Set where

¬_ : Set → Set
¬ A = A → ⊥
infix 3 ¬_

data Dec (A : Set) : Set where
    yes : A   → Dec A
    no  : ¬ A → Dec A

ex-falso-quidlibet : {A : Set} → ⊥ → A
ex-falso-quidlibet ()

¬¬-elimination : {A : Set} → Dec A → ¬ (¬ A) → A
¬¬-elimination (yes A) ¬¬A = A
¬¬-elimination (no nA) nnA = ex-falso-quidlibet (nnA nA)

-- simple theorem proved by ad absurdum


record Prime : Set where
    field
        value : ℕ
        is-prime : {n : Fin value}
            → (suc zero) ≤ ((suc (suc n)) mod n)



