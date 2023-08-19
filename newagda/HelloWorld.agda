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
fib₀ (suc (suc n)) = fib₀ (suc n) + fib₀ n

fib₁-rec : ℕ → ℕ → ℕ → ℕ 
fib₁-rec a b zero = b
fib₁-rec a b (suc n) = fib₁-rec b (a + b) n

fib₁ : ℕ → ℕ
fib₁ n = fib₁-rec (suc zero) zero n

-- proof that
-- fib₁-rec 1 0 m = fib₁-rec a b n = fib₁-rec (fib₀ m-n-1) fib₀ (m-n) n

pr : ∀ (m n : ℕ) → suc m + n ≡ suc (m + n)
pr m n = refl

pr1 : ∀ (f : ℕ → ℕ) → ∀ (m n : ℕ) → suc (f m) + n ≡ suc (f m + n)
pr1 f m n = refl

pr2 : ∀ (m n : ℕ)
    → fib₁-rec (fib₀ n) (fib₀ (suc n)) (suc m)
    ≡ fib₁-rec (fib₀ (suc n)) (fib₀ n + fib₀ (suc n)) m
pr2 m n = refl

pr4 : ∀ (n : ℕ)
    → fib₀ (suc n) + fib₀ n
    ≡ fib₀ (suc (suc n))
pr4 zero = refl
pr4 (suc zero) = refl
pr4 (suc (suc n)) = refl

skip-cong : ∀ {A B C : Set} (f : A → B → C) {a₁ a₂ : A} (b : B)
    → a₁ ≡ a₂
    → f a₁ b ≡ f a₂ b
skip-cong f b refl = refl

pr3 : ∀ (m n : ℕ)
    → fib₁-rec (fib₀ n) (fib₀ (suc n)) (suc m)
    ≡ fib₁-rec (fib₀ (suc n)) (fib₀ (suc (suc n))) m
pr3 m n =
  begin
    fib₁-rec (fib₀ n) (fib₀ (suc n)) (suc m)
    ≡⟨ pr2 m n ⟩
    fib₁-rec (fib₀ (suc n)) (fib₀ n + fib₀ (suc n)) m
    ≡⟨ skip-cong
        (fib₁-rec (fib₀ (suc n))) m (+-comm (fib₀ n) (fib₀ (suc n))) ⟩
    fib₁-rec (fib₀ (suc n)) (fib₀ (suc n) + fib₀ n) m
    ≡⟨ skip-cong (fib₁-rec (fib₀ (suc n))) m (pr4 n) ⟩
    fib₁-rec (fib₀ (suc n)) (fib₀ (suc (suc n))) m
  end


lemma₀ : ∀ (m n : ℕ)
    → fib₁-rec zero (suc zero) (m + n) ≡ fib₁-rec (fib₀ n) (fib₀ (suc n)) m
lemma₀ m zero = ≡-cong₃ fib₁-rec 0≡fib₀0 1≡fib₀1 m+0≡m where

    0≡fib₀0 : zero ≡ (fib₀ zero)
    0≡fib₀0 = refl

    1≡fib₀1 : suc zero ≡ (fib₀ (suc zero))
    1≡fib₀1 = refl

    m+0≡m : m + zero ≡ m
    m+0≡m = +-identity m

lemma₀ m (suc n) =
  begin
    fib₁-rec zero (suc zero) (m + suc n)
    ≡⟨ ≡-cong (fib₁-rec zero (suc zero)) (+-suc m n) ⟩
    fib₁-rec zero (suc zero) (suc (m + n))
    --≡⟨ ≡-cong (fib₁-rec zero (suc zero))  ⟩
    ≡⟨⟩ -- def ??  
    fib₁-rec zero (suc zero) (suc m + n)
    ≡⟨ lemma₀ (suc m) n ⟩
    fib₁-rec (fib₀ n) (fib₀ (suc n)) (suc m)
    ≡⟨ pr3 m n ⟩
    fib₁-rec (fib₀ (suc n)) (fib₀ (suc n) + fib₀ n) m
    ≡⟨⟩
    fib₁-rec (fib₀ (suc n)) (fib₀ (suc (suc n))) m
  end

lemma₁ : ∀ (n : ℕ)
    → fib₁ (suc n) ≡ fib₁-rec zero (suc zero) n
lemma₁ n = refl 

pr5 : ∀ (a b : ℕ)
    → fib₁-rec a b zero ≡ b
pr5 a b = refl

pr6 : ∀ (n : ℕ)
    → zero + n ≡ n
pr6 n = refl

theorem : ∀ (n : ℕ)
    → fib₁ n ≡ fib₀ n
theorem zero = refl
theorem (suc n) = 
    begin
        fib₁ (suc n)
        ≡⟨ lemma₁ n ⟩
        fib₁-rec zero (suc zero) n
        ≡⟨ ≡-cong (fib₁-rec zero (suc zero)) (pr6 n) ⟩
        fib₁-rec zero (suc zero) (zero + n)
        ≡⟨ lemma₀ zero n ⟩
        fib₁-rec (fib₀ n) (fib₀ (suc n)) zero
        ≡⟨ pr5 (fib₀ n) (fib₀ (suc n)) ⟩
        fib₀ (suc n)
    end        

