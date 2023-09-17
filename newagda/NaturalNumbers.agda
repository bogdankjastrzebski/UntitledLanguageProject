
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

--≡-cong : ∀ (f : ℕ → ℕ) -> x ≡ y → f x ≡ f y

+-identity : ∀ (m : ℕ) → m + zero ≡ m
+-identity zero = refl
+-identity (suc m) = begin
    suc m + zero
  ≡⟨⟩
    suc (m + zero)
  --≡⟨ +-identity m ⟩ -- m + zero ≡ m | suc (m + zero) ≡ suc m
  --  suc m
  --end
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

-- +-sum : ∀ (m n k : ℕ) → m + k ≡ n + k → m ≡ n
-- +-sum m n k = ?

-- +-suc≡suc : ∀ (m n : ℕ) → suc m ≡ suc n → m ≡ n
-- +-suc≡suc zero zero sucm≡sucn = refl

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


