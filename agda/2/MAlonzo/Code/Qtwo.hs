{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE EmptyCase #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}

{-# OPTIONS_GHC -Wno-overlapping-patterns #-}

module MAlonzo.Code.Qtwo where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text

-- two.ℕ
d_ℕ_2 = ()
data T_ℕ_2 = C_zero_4 | C_suc_6 Integer
-- two._+_
d__'43'__8 :: Integer -> Integer -> Integer
d__'43'__8 v0 v1
  = case coe v0 of
      0 -> coe v1
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe addInt (coe (1 :: Integer)) (coe d__'43'__8 (coe v2) (coe v1))
-- two._*_
d__'42'__16 :: Integer -> Integer -> Integer
d__'42'__16 v0 v1
  = case coe v0 of
      0 -> coe (0 :: Integer)
      _ -> let v2 = subInt (coe v0) (coe (1 :: Integer)) in
           coe d__'43'__8 (coe v1) (coe d__'42'__16 (coe v2) (coe v1))
-- two._^_
d__'94'__22 :: Integer -> Integer -> Integer
d__'94'__22 v0 v1
  = case coe v1 of
      0 -> coe (1 :: Integer)
      _ -> let v2 = subInt (coe v1) (coe (1 :: Integer)) in
           coe d__'42'__16 (coe v0) (coe d__'94'__22 (coe v0) (coe v2))
-- two._-_
d__'45'__30 :: Integer -> Integer -> Integer
d__'45'__30 v0 v1
  = case coe v1 of
      0 -> coe v0
      _ -> let v2 = subInt (coe v1) (coe (1 :: Integer)) in
           case coe v0 of
             0 -> coe (0 :: Integer)
             _ -> let v3 = subInt (coe v0) (coe (1 :: Integer)) in
                  coe d__'45'__30 (coe v3) (coe v2)
