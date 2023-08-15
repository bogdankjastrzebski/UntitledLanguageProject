module one where

{-# FOREIGN GHC import qualified Data.Text.IO as Text #-}

data Unit : Set where
  unit : Unit
  
{-# COMPILE GHC Unit = data () (()) #-}

postulate
  String : Set

{-# BUILTIN STRING String #-}

postulate
  IO : Set → Set

{-# BUILTIN IO IO #-}
{-# COMPILE GHC IO = type IO #-}

postulate
  putStr : String → IO Unit

{-# COMPILE GHC putStr = Text.putStr #-}

data ℕ : Set where
    zero : ℕ
    succ : ℕ → ℕ

{-# BUILTIN NATURAL ℕ #-}

variable A B C : Set
variable m n : ℕ 

-- data List (A : Set) : Set where
--    [] : List
--    _++_ : A → MyList A → MyList A 

l1 : List Nat
l1 = 1 :: 2 :: 3 :: []

main : IO Unit
main = putStr "Hello, World!\n"
