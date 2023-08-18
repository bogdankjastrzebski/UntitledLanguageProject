module elo where

data _≡_ {A : Set} (x : A) : A → Set where
    refl : x ≡ x
infix 4 _≡_

--≡-comm : ∀ {A : Set} (x y : A)
--    → x ≡ y
--    → y ≡ x
--≡-comm x y x≡y = ?

{--
module ≡-Reasoning {A : Set} where
    
    infix 1 begin_
    infixr 2 _≡⟨⟩_ _≡⟨_⟩_
    -- infix 3 _end

    begin_ : ∀ {x y : A}
        → x ≡ y
        → x ≡ y
    begin x≡y = x≡y

    _≡⟨⟩_ : ∀ (x : A) {y : A}
        → x ≡ y
        → x ≡ y
    x ≡⟨⟩ x≡y = x≡y

    _≡⟨_⟩_ : ∀ (x : A) {y z : A}
        → x ≡ y
        → y ≡ z
        → x ≡ z
    x ≡⟨ x≡y ⟩ y≡z =  ?


open ≡-Reasoning


--}

data ℕ : Set where
    zero : ℕ 
    suc  : ℕ → ℕ

_+_ : ℕ → ℕ → ℕ
x + y = ?



