module Fibonacci where

open import Equivalence
open import NaturalNumbers

open ≡-Reasoning


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

theorem : ∀ (n : ℕ)
    → fib₁ n ≡ fib₀ n
theorem zero = refl
theorem (suc n) = begin
    fib₁ (suc n)
  ≡⟨ lemma-giant-step zero n ⟩
    fib₀ (suc n)
  end
