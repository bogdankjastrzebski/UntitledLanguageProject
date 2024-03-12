module Decidable where

open import Data.Nat using (ℕ; _+_; zero; suc; _≤_)
open import Data.Sum using (_⊎_)
open import Data.Product using (_×_; proj₁; proj₂) renaming (_,_ to ⟨_,_⟩)
open import Data.Product using (Σ; _,_; ∃; Σ-syntax; ∃-syntax)
--open import Data.Maybe
open import Data.Fin using (Fin; toℕ)
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

ex-falso-quodlibet : {A : Set} → ⊥ → A
ex-falso-quodlibet ()

¬¬-elimination : {A : Set} → Dec A → ¬ (¬ A) → A
¬¬-elimination (yes A) ¬¬A = A
¬¬-elimination (no nA) nnA = ex-falso-quodlibet (nnA nA)

_<_ : ℕ → ℕ → Set
n < m = suc n ≤ m

≤-refl : {n : ℕ} → n ≤ n
≤-refl {zero} = _≤_.z≤n
≤-refl {suc n} = _≤_.s≤s ≤-refl

≤-trans : {x y z : ℕ} → x ≤ y → y ≤ z → x ≤ z
≤-trans _≤_.z≤n y≤z = _≤_.z≤n
≤-trans (_≤_.s≤s m≤n₁) (_≤_.s≤s m≤n) = _≤_.s≤s (≤-trans m≤n₁ m≤n)

¬zero<zero : suc zero ≤ zero -> ⊥
¬zero<zero ()

¬s<s : (m n : ℕ) → ¬ (m < n) → ¬ (suc m < suc n)
¬s<s m n ¬m<n (_≤_.s≤s m≤n) = ¬m<n m≤n

¬sn≤n : (n : ℕ) → ¬ (suc n ≤ n) 
¬sn≤n (suc n) (_≤_.s≤s snn) = ¬sn≤n n snn

¬n<n : (n : ℕ) → ¬ (n < n)
¬n<n (suc n) (_≤_.s≤s n<n) = ¬n<n n n<n


ph-dec0 : (m n : ℕ)
  → (f : Fin n → Fin m)
  → (k l : Fin n)
  → (toℕ k < toℕ l)
  → Dec (((f k ≡ f l) × (toℕ k < toℕ l)))
ph-dec0 m n f k l k<l = {! -c!} 

ph-dec1 : (m n : ℕ) → (f : Fin n → Fin m) → (k : Fin n) → Dec (∃[ l ] ((f k ≡ f l) ⊎ (toℕ k < toℕ l)))
ph-dec1 m n f k = {! !}

ph-dec : (m n : ℕ) → (f : Fin n → Fin m) →  Dec (∃[ k ] ∃[ l ] ((f k ≡ f l) ⊎ (toℕ k < toℕ l)))
ph-dec m n f = {!!}

--peagonhole : (m n : ℕ) (n < m)
--            (f : Fin m → Fin n)
--          → ∃[k l] (k < l) ⊎ (f k ≡ f l) 

--≤-trans _≤_.z≤n y≤z = _≤_.z≤n
--≤-trans (_≤_.s≤s m≤n₁) (_≤_.s≤s m≤n) = _≤_.s≤s (≤-trans m≤n₁ m≤n)

--ℕ-disorder : {n m : ℕ} → n < m → m ≤ n → ⊥
--ℕ-disorder (_≤_.s≤s m≤n₁) (_≤_.s≤s m≤n) = ℕ-disorder m≤n₁ m≤n

data Compare (n m : ℕ) : Set where
    less : n ≤ m → Compare n m
    more : m ≤ n → Compare n m

compare : (n m : ℕ) → (Compare n m)
compare zero m = less _≤_.z≤n
compare (suc n) zero = more _≤_.z≤n
compare (suc n) (suc m) with compare n m
...| less n≤m = less (_≤_.s≤s n≤m)
...| more m≤n = more (_≤_.s≤s m≤n)


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
is-divisible m n = case (mod m 1+ n) where
    case : (o : ℕ) → Dec (0 ≡ o)
    case zero    = yes refl
    case (suc o) = no ¬z≡s
--is-divisible m n with mod m 1+ n
--is-divisible m n    | zero  = yes refl
--is-divisible m n    | suc o = no ¬z≡s

--is-prime-2+ : (m : ℕ) → Dec ((n : ℕ) → ((m ≤ n) ⊎ (is-divisible (2 + m) (2 + n))))
--is-prime-2+ m = ?

