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

module MAlonzo.Code.Inequality where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Equivalence
import qualified MAlonzo.Code.NaturalNumbers

-- Inequality._≤_
d__'8804'__2 a0 a1 = ()
data T__'8804'__2 = C_z'8804's_6 | C_s'8804's_12 T__'8804'__2
-- Inequality.z≤n-inv
d_z'8804'n'45'inv_16 ::
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  T__'8804'__2 -> MAlonzo.Code.Equivalence.T__'8801'__6
d_z'8804'n'45'inv_16 = erased
-- Inequality.s≤s-inv
d_s'8804's'45'inv_22 ::
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 -> T__'8804'__2 -> T__'8804'__2
d_s'8804's'45'inv_22 ~v0 ~v1 v2 = du_s'8804's'45'inv_22 v2
du_s'8804's'45'inv_22 :: T__'8804'__2 -> T__'8804'__2
du_s'8804's'45'inv_22 v0
  = case coe v0 of
      C_s'8804's_12 v3 -> coe v3
      _ -> MAlonzo.RTE.mazUnreachableError
-- Inequality.≤-refl
d_'8804''45'refl_28 ::
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 -> T__'8804'__2
d_'8804''45'refl_28 v0
  = case coe v0 of
      MAlonzo.Code.NaturalNumbers.C_zero_4 -> coe C_z'8804's_6
      MAlonzo.Code.NaturalNumbers.C_suc_6 v1
        -> coe C_s'8804's_12 (d_'8804''45'refl_28 (coe v1))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Inequality.≤-trans
d_'8804''45'trans_38 ::
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  T__'8804'__2 -> T__'8804'__2 -> T__'8804'__2
d_'8804''45'trans_38 v0 v1 v2 v3 v4
  = case coe v3 of
      C_z'8804's_6 -> coe C_z'8804's_6
      C_s'8804's_12 v7
        -> case coe v0 of
             MAlonzo.Code.NaturalNumbers.C_suc_6 v8
               -> case coe v1 of
                    MAlonzo.Code.NaturalNumbers.C_suc_6 v9
                      -> case coe v4 of
                           C_s'8804's_12 v12
                             -> case coe v2 of
                                  MAlonzo.Code.NaturalNumbers.C_suc_6 v13
                                    -> coe
                                         C_s'8804's_12
                                         (d_'8804''45'trans_38
                                            (coe v8) (coe v9) (coe v13) (coe v7) (coe v12))
                                  _ -> MAlonzo.RTE.mazUnreachableError
                           _ -> MAlonzo.RTE.mazUnreachableError
                    _ -> MAlonzo.RTE.mazUnreachableError
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
-- Inequality.≤-antisym
d_'8804''45'antisym_50 ::
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  T__'8804'__2 ->
  T__'8804'__2 -> MAlonzo.Code.Equivalence.T__'8801'__6
d_'8804''45'antisym_50 = erased
-- Inequality.Total
d_Total_60 a0 a1 = ()
data T_Total_60
  = C_forward_66 T__'8804'__2 | C_flipped_68 T__'8804'__2
-- Inequality.≤-total
d_'8804''45'total_74 ::
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 -> T_Total_60
d_'8804''45'total_74 v0 v1
  = case coe v0 of
      MAlonzo.Code.NaturalNumbers.C_zero_4
        -> coe C_forward_66 (coe C_z'8804's_6)
      MAlonzo.Code.NaturalNumbers.C_suc_6 v2
        -> case coe v1 of
             MAlonzo.Code.NaturalNumbers.C_zero_4
               -> coe C_flipped_68 (coe C_z'8804's_6)
             MAlonzo.Code.NaturalNumbers.C_suc_6 v3
               -> coe du_result_84 (coe d_'8804''45'total_74 (coe v2) (coe v3))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
-- Inequality._.result
d_result_84 ::
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 -> T_Total_60 -> T_Total_60
d_result_84 ~v0 ~v1 v2 = du_result_84 v2
du_result_84 :: T_Total_60 -> T_Total_60
du_result_84 v0
  = case coe v0 of
      C_forward_66 v1 -> coe C_forward_66 (coe C_s'8804's_12 v1)
      C_flipped_68 v1 -> coe C_flipped_68 (coe C_s'8804's_12 v1)
      _ -> MAlonzo.RTE.mazUnreachableError
-- Inequality.≡-to-≤
d_'8801''45'to'45''8804'_94 ::
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.Equivalence.T__'8801'__6 -> T__'8804'__2
d_'8801''45'to'45''8804'_94 v0 ~v1 ~v2
  = du_'8801''45'to'45''8804'_94 v0
du_'8801''45'to'45''8804'_94 ::
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 -> T__'8804'__2
du_'8801''45'to'45''8804'_94 v0 = coe d_'8804''45'refl_28 (coe v0)
-- Inequality.+-≤-comm
d_'43''45''8804''45'comm_102 ::
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 -> T__'8804'__2
d_'43''45''8804''45'comm_102 v0 v1
  = coe
      du_'8801''45'to'45''8804'_94
      (coe MAlonzo.Code.NaturalNumbers.d__'43'__8 (coe v0) (coe v1))
-- Inequality.+-≤-monoʳ
d_'43''45''8804''45'mono'691'_114 ::
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 -> T__'8804'__2 -> T__'8804'__2
d_'43''45''8804''45'mono'691'_114 v0 ~v1 ~v2 v3
  = du_'43''45''8804''45'mono'691'_114 v0 v3
du_'43''45''8804''45'mono'691'_114 ::
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 -> T__'8804'__2 -> T__'8804'__2
du_'43''45''8804''45'mono'691'_114 v0 v1
  = case coe v0 of
      MAlonzo.Code.NaturalNumbers.C_zero_4 -> coe v1
      MAlonzo.Code.NaturalNumbers.C_suc_6 v2
        -> coe
             C_s'8804's_12
             (coe du_'43''45''8804''45'mono'691'_114 (coe v2) (coe v1))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Inequality.+-≤-monoˡ
d_'43''45''8804''45'mono'737'_136 ::
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 -> T__'8804'__2 -> T__'8804'__2
d_'43''45''8804''45'mono'737'_136 v0 v1 v2 v3
  = coe
      d_'8804''45'trans_38
      (coe MAlonzo.Code.NaturalNumbers.d__'43'__8 (coe v1) (coe v0))
      (coe MAlonzo.Code.NaturalNumbers.d__'43'__8 (coe v0) (coe v2))
      (coe MAlonzo.Code.NaturalNumbers.d__'43'__8 (coe v2) (coe v0))
      (coe
         d_'8804''45'trans_38
         (coe MAlonzo.Code.NaturalNumbers.d__'43'__8 (coe v1) (coe v0))
         (coe MAlonzo.Code.NaturalNumbers.d__'43'__8 (coe v0) (coe v1))
         (coe MAlonzo.Code.NaturalNumbers.d__'43'__8 (coe v0) (coe v2))
         (coe d_'43''45''8804''45'comm_102 (coe v1) (coe v0))
         (coe du_'43''45''8804''45'mono'691'_114 (coe v0) (coe v3)))
      (coe d_'43''45''8804''45'comm_102 (coe v0) (coe v2))
-- Inequality.+-≤-mono
d_'43''45''8804''45'mono_154 ::
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  T__'8804'__2 -> T__'8804'__2 -> T__'8804'__2
d_'43''45''8804''45'mono_154 v0 v1 v2 v3 v4 v5
  = coe
      d_'8804''45'trans_38
      (coe MAlonzo.Code.NaturalNumbers.d__'43'__8 (coe v0) (coe v2))
      (coe MAlonzo.Code.NaturalNumbers.d__'43'__8 (coe v1) (coe v2))
      (coe MAlonzo.Code.NaturalNumbers.d__'43'__8 (coe v1) (coe v3))
      (coe
         d_'43''45''8804''45'mono'737'_136 (coe v2) (coe v0) (coe v1)
         (coe v4))
      (coe du_'43''45''8804''45'mono'691'_114 (coe v1) (coe v5))
