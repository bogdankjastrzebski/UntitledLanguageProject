module Decidable where

open import Data.Nat using (ℕ; _+_; zero; suc; _≤_)
open import Data.Sum using (_⊎_)
--open import Data.Maybe
--open import Data.Fin using (Fin; zero; suc)
--open import Data.List using (List; _∷_; []; tabulate)
--open import Data.Vec using (Vec; []; _∷_; foldr)
--open import Function using (const; _∘_)
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
--  f x xs (suc y) =       x ∷ xs y

¬z≡s : {m : ℕ} → ¬ (zero ≡ suc m)
¬z≡s ()

≡-comm : {m n : ℕ} → n ≡ m → m ≡ n
≡-comm refl = refl

¬≡-comm : {m n : ℕ} → ¬ (n ≡ m) → ¬ (m ≡ n)
¬≡-comm ¬n≡m refl = ¬n≡m refl

s≡s : {m n : ℕ} → m ≡ n → (suc m ≡ suc n)
s≡s refl = refl

¬≡-suc : {m n : ℕ} → ¬ (m ≡ n) → ¬ (suc m ≡ suc n)
¬≡-suc ¬m≡n refl = ¬m≡n refl

_is≡_ : (m n : ℕ) → Dec (m ≡ n)
zero  is≡  zero = yes refl
zero  is≡ suc n = no ¬z≡s
suc m is≡  zero = no (¬≡-comm ¬z≡s)
suc m is≡ suc n with (m is≡ n)
suc m is≡ suc n    | yes m≡n = yes (s≡s m≡n)
suc m is≡ suc n    | no ¬m≡n = no (¬≡-suc ¬m≡n)

    

mod-helper : ℕ → ℕ → ℕ → ℕ → ℕ
mod-helper k m  zero    j      = k
mod-helper k m (suc n)  zero   = mod-helper 0 m n m
mod-helper k m (suc n) (suc j) = mod-helper (suc k) m n j

mod_1+_ : ℕ → ℕ → ℕ
mod m 1+ n = mod-helper 0 n m n

is-divisible : (m n : ℕ) → Dec (0 ≡ mod m 1+ n)
is-divisible m n with mod m 1+ n
is-divisible m n    | zero  = yes refl
is-divisible m n    | suc o = no ¬z≡s

is-prime-2+ : (m : ℕ) → Dec ((n : ℕ) → ((m ≤ n) ⊎ (is-divisible (2 + m) (2 + n))))
is-prime-2+ m = ?

