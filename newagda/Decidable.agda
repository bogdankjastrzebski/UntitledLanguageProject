module Decidable where

open import Data.Nat using (ℕ; _+_; zero; suc)
open import Data.Maybe
open import Data.Fin using (Fin; zero; suc)
open import Data.List using (List; _∷_; []; tabulate)
open import Data.Vec using (Vec; []; _∷_; foldr)
open import Function using (const; _∘_)
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

--is-prime? : (n : ℕ) → Dec ( (m : ℕ) → ((suc (suc (suc m))) ≤ n) → ((suc zero) ≤ n mod (suc (suc m))))
--is-prime? n = ?

--primes : (n : ℕ) → List (Fin n)
--primes zero = []
--primes (suc zero) = []
--primes (suc (suc zero)) = []
--primes (suc (suc (suc m))) = sieve (tabulate (just ∘ Fin.suc))
--    where
--    cross-off : {n : ℕ} → Fin _ → Vec (Maybe _) n → Vec (Maybe _) n
--
--    sieve : {n : ℕ} → Vec (Maybe (Fin (2 + m))) n → List (Fin (3 + m))
--    sieve [] = []
--    sieve (nothing ∷ xs) = sieve xs
--    sieve {suc n} (just x  ∷ xs) = (suc x) ∷ sieve {n} (cross-off x xs)
--
--    cross-off p fs = Vec.foldr B f (const []) fs p
--        where
--        B = λ n → ∀ {i} → Fin i → Vec (Maybe (Fin (2 + m))) n

--        f : {n : ℕ} → Maybe (Fin (2 + m)) → B n → B (suc n)
--        f _ xs zero    = nothing ∷ xs p
--        f x xs (suc y) =       x ∷ xs y

mod-helper : ℕ → ℕ → ℕ → ℕ → ℕ
mod-helper k m  zero    j      = k
mod-helper k m (suc n)  zero   = mod-helper 0 m n m
mod-helper k m (suc n) (suc j) = mod-helper (suc k) m n j

mod_1+_ : ℕ → ℕ → ℕ
mod m 1+ n = mod-helper 0 n m n

divisable? : (m n : ℕ) → Dec (mod m 1+ n ≡ 0)
divisable? m n = ?

