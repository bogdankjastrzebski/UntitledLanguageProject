module Inequality where

open import NaturalNumbers
open import Equivalence

open ≡-Reasoning

data _≤_ : ℕ → ℕ → Set where
    z≤s : ∀ {z : ℕ} → zero ≤ z
    s≤s : ∀ {m n : ℕ}
        → m ≤ n
        → suc m ≤ suc n
infix 4 _≤_ 

z≤n-inv : ∀ {m : ℕ}
    → m ≤ zero
    → m ≡ zero
z≤n-inv z≤s = refl

s≤s-inv : ∀ {m n : ℕ}
    → suc m ≤ suc n
    → m ≤ n
s≤s-inv (s≤s m≤n) = m≤n

≤-refl : ∀ {n : ℕ}
    → n ≤ n
≤-refl {zero} = z≤s
≤-refl {suc n} = s≤s ≤-refl

≤-trans : ∀ {m n k : ℕ}
    → m ≤ n
    → n ≤ k
    → m ≤ k
≤-trans z≤s n≤k = z≤s
≤-trans (s≤s m≤n) (s≤s n≤k) = s≤s (≤-trans m≤n n≤k)

≤-antisym : ∀ {m n : ℕ}
    → m ≤ n
    → n ≤ m
    → m ≡ n
≤-antisym z≤s z≤s = refl
≤-antisym (s≤s m≤n) (s≤s n≤m) = ≡-cong suc (≤-antisym m≤n n≤m)

data Total (m n : ℕ) : Set where
    forward : m ≤ n → Total m n 
    flipped : n ≤ m → Total m n

≤-total : ∀ (m n : ℕ) → Total m n
≤-total zero _ = forward z≤s
≤-total _ zero = flipped z≤s
≤-total (suc m) (suc n) = result (≤-total m n) where
    result : Total m n → Total (suc m) (suc n)
    result (forward m≤n) = forward (s≤s m≤n)
    result (flipped n≤m) = flipped (s≤s n≤m)

--≤-total (suc m) (suc n) with ≤-total m n
--... | forward m≤n = forward (s≤s m≤n)
--... | flipped n≤m = flipped (s≤s n≤m)

≡-to-≤ : ∀ {m n : ℕ}
    → m ≡ n
    → m ≤ n
≡-to-≤ {m} {.m} refl = ≤-refl

+-≤-comm : ∀ {m n : ℕ}
    → m + n ≤ n + m
+-≤-comm {m} {n} = ≡-to-≤ (+-comm m n)

+-≤-monoʳ : ∀ {m n k : ℕ}
    → n ≤ k
    → m + n ≤ m + k
+-≤-monoʳ {zero} {n} {k} n≤k = n≤k
+-≤-monoʳ {suc m} {n} {k} n≤k = s≤s (+-≤-monoʳ {m} {n} {k} n≤k)

+-≤-monoˡ : ∀ {m n k : ℕ}
    → n ≤ k
    → n + m ≤ k + m
+-≤-monoˡ {m} {n} {k} n≤k = ≤-trans (≤-trans (+-≤-comm {n} {m}) (+-≤-monoʳ n≤k)) (+-≤-comm {m} {k})

+-≤-mono : ∀ {m n p q : ℕ}
    → m ≤ n
    → p ≤ q
    → m + p ≤ n + q
+-≤-mono {m} {n} {p} {k} m≤k p≤q = ≤-trans (+-≤-monoˡ {p} m≤k) (+-≤-monoʳ {n} p≤q)



-- +-≤-monoˡ {m} {n} {k} n≤k rewrite +-comm n m | +-comm k m = +-≤-monoʳ {k} {m} {n} n≤k 

{--
+-≤-monoˡ : ∀ {m n k : ℕ}
    → n ≤ k
    → n + m ≤ k + m
--+-≤-monoˡ {m} {n} {k} n≤k rewrite +-comm n m | +-comm k m = +-≤-monoʳ {k} {m} {n} n≤k
+-≤-monoˡ {m} {n} {k} n≤k = ≤-trans (≤-trans n+m≤m+n m+n≤m+k) m+k≤k+m
    where
        lemma : ∀ (m n : ℕ)
            → m ≡ n
            → m ≤ n
        lemma zero zero m≡n = z≤s
        lemma (suc m) (suc n) m≡n = s≤s (lemma m n ?)

+-≤-mono : ∀ {m n k l : ℕ}
    → m ≤ n
    → k ≤ l
    → m + k ≤ n + l
+-≤-mono {m} {n} {k} {l} m≤n k≤l = ≤-trans (+-≤-monoˡ {m} {n} {k} m≤n) (+-≤-monoʳ {n} {k} {l} k≤l)
--}

-- module ≤-Reasoning 

