module Equivalence where

data _≡_ {A : Set} (x : A) : A → Set where
    refl : x ≡ x
infixr 4 _≡_

≡-sym : ∀ {A : Set} {x y : A}
    → x ≡ y
    → y ≡ x
≡-sym refl = refl

≡-trans : ∀ {A : Set} {x y z : A}
    → x ≡ y
    → y ≡ z
    → x ≡ z
≡-trans refl refl = refl

≡-cong : ∀ {A B : Set} (f : A → B) {x y : A}
    → x ≡ y
    → f x ≡ f y
≡-cong f refl = refl

≡-cong₂ : ∀ {A B C : Set} (f : A → B → C) {a₁ a₂ : A} {b₁ b₂ : B}
    → a₁ ≡ a₂
    → b₁ ≡ b₂
    → f a₁ b₁ ≡ f a₂ b₂
≡-cong₂ f refl refl = refl

≡-cong₃ : ∀ {A B C D : Set} (f : A → B → C → D) {a₁ a₂ : A} {b₁ b₂ : B} {c₁ c₂ : C}
    → a₁ ≡ a₂
    → b₁ ≡ b₂
    → c₁ ≡ c₂
    → f a₁ b₁ c₁ ≡ f a₂ b₂ c₂
≡-cong₃ f refl refl refl = refl

≡-cong-app : ∀ {A B : Set} {f g : A → B}
    → f ≡ g
    → ∀ {x : A} → f x ≡ g x
≡-cong-app refl = refl

≡-subst : ∀ {A : Set} (P : A → Set) {x y : A} 
    → x ≡ y
    → P x → P y
≡-subst P refl px = px

module ≡-Reasoning {A : Set} where
    
    infix  1 begin_
    infixr 2 _≡⟨⟩_ _≡⟨_⟩_
    infix  3 _end

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
    x ≡⟨ x≡y ⟩ y≡z = ≡-trans x≡y y≡z 

    _end : ∀ (x : A)
        → x ≡ x
    x end = refl
