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

module MAlonzo.Code.NaturalNumbers where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Equivalence

-- NaturalNumbers.ℕ
d_ℕ_2 = ()
data T_ℕ_2 = C_zero_4 | C_suc_6 T_ℕ_2
-- NaturalNumbers._+_
d__'43'__8 :: T_ℕ_2 -> T_ℕ_2 -> T_ℕ_2
d__'43'__8 v0 v1
  = case coe v0 of
      C_zero_4 -> coe v1
      C_suc_6 v2 -> coe C_suc_6 (coe d__'43'__8 (coe v2) (coe v1))
      _ -> MAlonzo.RTE.mazUnreachableError
-- NaturalNumbers.+-assoc
d_'43''45'assoc_22 ::
  T_ℕ_2 -> T_ℕ_2 -> T_ℕ_2 -> MAlonzo.Code.Equivalence.T__'8801'__6
d_'43''45'assoc_22 = erased
-- NaturalNumbers.+-identity
d_'43''45'identity_36 ::
  T_ℕ_2 -> MAlonzo.Code.Equivalence.T__'8801'__6
d_'43''45'identity_36 = erased
-- NaturalNumbers.+-suc
d_'43''45'suc_44 ::
  T_ℕ_2 -> T_ℕ_2 -> MAlonzo.Code.Equivalence.T__'8801'__6
d_'43''45'suc_44 = erased
-- NaturalNumbers.+-comm
d_'43''45'comm_56 ::
  T_ℕ_2 -> T_ℕ_2 -> MAlonzo.Code.Equivalence.T__'8801'__6
d_'43''45'comm_56 = erased
-- NaturalNumbers._*_
d__'42'__64 :: T_ℕ_2 -> T_ℕ_2 -> T_ℕ_2
d__'42'__64 v0 v1
  = case coe v0 of
      C_zero_4 -> coe v0
      C_suc_6 v2
        -> coe d__'43'__8 (coe v1) (coe d__'42'__64 (coe v2) (coe v1))
      _ -> MAlonzo.RTE.mazUnreachableError
