module HelloWorld where

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

open ≡-Reasoning 


data ℕ : Set where 
    zero : ℕ 
    suc  : ℕ → ℕ

_+_ : ℕ → ℕ → ℕ 
zero + y = y
suc x + y = suc (x + y)

postulate
  +-identity : ∀ (m : ℕ) → m + zero ≡ m
  +-suc : ∀ (m n : ℕ) → m + suc n ≡ suc (m + n)
  --+-suc-def : ∀ (m n : ℕ) → suc m 

+-comm : ∀ (m n : ℕ)
    → m + n ≡ n + m
+-comm m zero = begin
        m + zero ≡⟨ +-identity m ⟩ m
                 ≡⟨⟩ zero + m
    end
+-comm m (suc n) = begin
        m + (suc n) ≡⟨ +-suc m n ⟩ suc (m + n)
                    ≡⟨ ≡-cong suc (+-comm m n) ⟩ suc (n + m)
                    ≡⟨⟩ suc n + m
    end


--+-iden : ∀ (n : ℕ)
--    → n + zero ≡ n
--+-iden n 

-- _-_ : ℕ → ℕ → ℕ
-- zero - n = zero
-- suc m - zero = suc m
-- suc m - suc n = m - n

fib₀ : ℕ → ℕ
fib₀ zero = zero
fib₀ (suc zero) = suc zero
fib₀ (suc (suc n)) = fib₀ n + fib₀ (suc n)

fib₁-rec : ℕ → ℕ → ℕ → ℕ 
fib₁-rec a b zero = b
fib₁-rec a b (suc n) = fib₁-rec b (a + b) n

fib₁ : ℕ → ℕ
fib₁ n = fib₁-rec (suc zero) zero n

lemma-giant-step : ∀ (m n : ℕ)
    → fib₁-rec zero (suc zero) (m + n)
    ≡ fib₁-rec (fib₀ n) (fib₀ (suc n)) m
lemma-giant-step m zero = begin
    fib₁-rec zero (suc zero) (m + zero)
  ≡⟨ ≡-cong (fib₁-rec zero (suc zero)) (+-identity m) ⟩
    fib₁-rec (fib₀ zero) (fib₀ (suc zero)) m
  end
lemma-giant-step m (suc n) = begin
    fib₁-rec zero (suc zero) (m + suc n)
  ≡⟨ ≡-cong (fib₁-rec zero (suc zero)) (+-suc m n) ⟩
    fib₁-rec zero (suc zero) (suc m + n)
  ≡⟨ lemma-giant-step (suc m) n ⟩
    fib₁-rec (fib₀ (suc n)) (fib₀ (suc (suc n))) m
  end

{--
    ≡-cong₃ fib₁-rec 0≡fib₀0 1≡fib₀1 m+0≡m where
    0≡fib₀0 : zero ≡ (fib₀ zero)
    0≡fib₀0 = refl
    1≡fib₀1 : suc zero ≡ (fib₀ (suc zero))
    1≡fib₀1 = refl
    m+0≡m : m + zero ≡ m
    m+0≡m = +-identity m
--}
{--
  begin
    fib₁-rec zero (suc zero) (m + suc n)
  ≡⟨ ≡-cong (fib₁-rec zero (suc zero)) (+-suc m n) ⟩
    fib₁-rec zero (suc zero) (suc (m + n))
  ≡⟨⟩  
    fib₁-rec zero (suc zero) (suc m + n)
  ≡⟨ lemma-giant-step (suc m) n ⟩
    fib₁-rec (fib₀ n) (fib₀ (suc n)) (suc m)
  ≡⟨⟩
    fib₁-rec (fib₀ (suc n)) (fib₀ (suc (suc n))) m
  end
--}

theorem : ∀ (n : ℕ)
    → fib₁ n ≡ fib₀ n
theorem zero = refl
theorem (suc n) = begin
    fib₁ (suc n)
  ≡⟨ lemma-giant-step zero n ⟩
    fib₀ (suc n)
  end
{--
    begin
        fib₁ (suc n)
      ≡⟨⟩
        fib₁-rec zero (suc zero) n
      ≡⟨⟩
        fib₁-rec zero (suc zero) (zero + n)
      ≡⟨ lemma-giant-step zero n ⟩
        fib₁-rec (fib₀ n) (fib₀ (suc n)) zero
      ≡⟨⟩
        fib₀ (suc n)
    end        
--}

{--

unique-zero : ∀ (m n : ℕ)
    → m + n ≡ m
    → n ≡ zero
unique-zero zero n m+n≡n = {!   !}
unique-zero (suc m) n m+n≡n = {!   !}
    
--}

_*_ : ℕ → ℕ → ℕ
zero * n = zero
suc m * n = n + (m * n)


--data ℕ₊ (n : ℕ) : Set where
--    next : ∀ (m : ℕ) → ℕ₊ (suc m)

data ℕ₊ : ℕ → Set where
    next : ∀ (m : ℕ) → ℕ₊ (suc m)

    --one : ℕ₊
    --suc : ℕ₊ → ℕ₊

record ℚ : Set where
    constructor _//1+_
    field
        ↑ : ℕ
        ↓ : ℕ

gdc : ℕ → ℕ → ℕ
gdc :  
gdc 

--to-normal-form : 




data _≡ℚ_ (x : ℚ) : ℚ → Set where
    refl : x ≡ℚ x

{--

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
--}
