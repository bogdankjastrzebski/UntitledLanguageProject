module Collatz where

data Even : Set
data Odd : Set

data Even where
    zero : Even
    suc : Odd → Even

data Odd where
    suc : Even → Odd

collatz : 
