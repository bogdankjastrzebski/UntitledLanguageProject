data Greeting : Set where
  hello : Greeting

greet : Greeting
greet = hello

module hello-world where



open import Agda.Builtin.IO using (IO)
open import Agda.Builtin.Unit using (⊤)
open import Agda.Builtin.String using (String)

postulate putStrLn : String → IO ⊤
{-# FOREIGN GHC import qualified Data.Text as T #-}
{-# COMPILE GHC putStrLn = putStrLn . T.unpack #-}

main : IO ⊤
main = putStrLn "Hello world!"



data List (X : Set): Set where
    ⟨⟩ : List X
    _,_ : X → List X → List X

zap : { X Y : Set } → List (X → Y) → List X → List Y
zap ⟨⟩ ⟨⟩ = ⟨⟩
zap ( f , fs ) ( x , xs ) = f x , zap fs xs
zap _ _ = ⟨⟩

data ℕ : Set where
    zero : ℕ
    succ : ℕ → ℕ

length : { X : Set } → List X → ℕ
length ⟨⟩ = zero
length ( x , xs ) = succ (length xs)


_+ℕ_ : ℕ → ℕ → ℕ
zero +ℕ y = y
(succ x) +ℕ y = succ (x +ℕ y)

_×ℕ_ : ℕ → ℕ → ℕ
zero ×ℕ _ = zero
(succ x) ×ℕ y = y +ℕ (x ×ℕ y)

_++List_ : { X : Set } → List X → List X → List X
⟨⟩ ++List ys = ys
(x , xs) ++List ys = x , (xs ++List ys)



