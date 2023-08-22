
module NaturalNumbers where

open import Equivalence
open ≡-Reasoning


data ℕ : Set where
    zero : ℕ
    suc : ℕ → ℕ

_+_ : ℕ → ℕ → ℕ
zero + n = n
suc m + n = suc (m + n)


+-assoc : ∀ (m n k : ℕ) → (m + n) + k ≡ m + (n + k)
+-assoc zero n k = refl
+-assoc (suc m) n k = begin
    ((suc m) + n) + k
  ≡⟨ ≡-cong suc (+-assoc m n k) ⟩
    suc m + (n + k)
  end

+-identity : ∀ (m : ℕ) → m + zero ≡ m
+-identity zero = refl
+-identity (suc m) = begin
    suc m + zero
  ≡⟨ ≡-cong suc (+-identity m) ⟩ 
    suc m
  end

+-suc : ∀ (m n : ℕ) → m + suc n ≡ suc (m + n)
+-suc zero n = refl
+-suc (suc m) n = begin
    suc m + suc n
  ≡⟨ ≡-cong suc (+-suc m n) ⟩
    suc (suc m + n)
  end

+-comm : ∀ (m n : ℕ) → m + n ≡ n + m
+-comm m zero = begin
    m + zero
  ≡⟨ +-identity m ⟩
    zero + m
  end
+-comm m (suc n) = begin
    m + (suc n)
  ≡⟨ +-suc m n ⟩
    suc (m + n)
  ≡⟨ ≡-cong suc (+-comm m n) ⟩
    suc n + m
  end

{--
+-assoc
begin
    (zero + n) + k ≡⟨⟩ n + k
                   ≡⟨⟩ zero + (n + k)
  end
  begin
    ((suc m) + n) + k
  ≡⟨⟩
    suc (m + n) + k
  ≡⟨⟩
    suc ((m + n) + k)
  ≡⟨ ≡-cong suc (+-assoc m n k) ⟩
    suc (m + (n + k))
  ≡⟨⟩
    suc m + (n + k)
  end
--}

_*_ : ℕ → ℕ → ℕ
zero * n = zero
suc m * n = n + (m * n)

infixr 2 _*_


