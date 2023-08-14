module HelloWorld where

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

main : IO Unit
main = putStr "Hello, World!"
