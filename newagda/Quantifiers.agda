module Quantifiers where

import Relation.Binary.PropositionalEquality as Eq
open Eq using (_≡_; refl)
open import Data.Nat using (ℕ; zero; suc; _+_; _*_)
open import Relation.Nullary using (¬_)
open import Data.Product using (_×_; proj₁; proj₂) renaming (_,_ to ⟨_,_⟩)
open import Data.Sum using (_⊎_; inj₁; inj₂)
open import plfa.part1.Isomorphism using (_≃_; extensionality; ∀-extensionality)
open import Function using (_∘_)


∀-elim : ∀ {A : Set} {B : A → Set}
    → (L : ∀ (x : A) → B x)
    → (M : A)
    → B M
∀-elim L M = L M

postulate
    ∀-distrib-× : ∀ {A : Set} {B C : A → Set} →
        (∀ (x : A) → B x × C x) ≃ (∀ (x : A) → B x) × (∀ (x : A) → C x)

postulate
    ⊎∀-implies-∀⊎ : ∀ {A : Set} {B C : A → Set} →
        (∀ (x : A) → B x) ⊎ (∀ (x : A) → C x) → ∀ (x : A) → B x ⊎ C x

data Σ (A : Set) (B : A → Set) : Set where
    ⟨_,_⟩ : (x : A) → B x → Σ A B

Σ-syntax = Σ
infix 2 Σ-syntax
syntax Σ-syntax A (λ x → Bx) = Σ[ x ∈ A ] Bx

∃ : ∀ {A : Set} (B : A → Set) → Set
∃ {A} B = Σ A B

∃-syntax = ∃
syntax ∃-syntax (λ x → B) = ∃[ x ] B

∃-elim : ∀ {A : Set} {B : A → Set} {C : Set}
    → (∀ x → B x → C)
    → ∃[ x ] B x
    → C
∃-elim f ⟨ x , y ⟩ = f x y

-- New parg
