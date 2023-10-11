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

module MAlonzo.Code.Isomorphism where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Equivalence
import qualified MAlonzo.Code.NaturalNumbers

-- Isomorphism._∘_
d__'8728'__8 ::
  () ->
  () ->
  () ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d__'8728'__8 ~v0 ~v1 ~v2 v3 v4 v5 = du__'8728'__8 v3 v4 v5
du__'8728'__8 ::
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du__'8728'__8 v0 v1 v2 = coe v0 (coe v1 v2)
-- Isomorphism.extensionality
d_extensionality_26
  = error
      "MAlonzo Runtime Error: postulate evaluated: Isomorphism.extensionality"
-- Isomorphism._+′_
d__'43''8242'__28 ::
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2
d__'43''8242'__28 v0 v1
  = case coe v1 of
      MAlonzo.Code.NaturalNumbers.C_zero_4 -> coe v0
      MAlonzo.Code.NaturalNumbers.C_suc_6 v2
        -> coe
             MAlonzo.Code.NaturalNumbers.C_suc_6
             (coe d__'43''8242'__28 (coe v0) (coe v2))
      _ -> MAlonzo.RTE.mazUnreachableError
-- Isomorphism.same-app
d_same'45'app_40 ::
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.Equivalence.T__'8801'__6
d_same'45'app_40 = erased
-- Isomorphism._.helper
d_helper_54 ::
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.NaturalNumbers.T_ℕ_2 ->
  MAlonzo.Code.Equivalence.T__'8801'__6
d_helper_54 = erased
-- Isomorphism.same
d_same_66 :: MAlonzo.Code.Equivalence.T__'8801'__6
d_same_66 = erased
-- Isomorphism.∀-extensionality
d_'8704''45'extensionality_84
  = error
      "MAlonzo Runtime Error: postulate evaluated: Isomorphism.\8704-extensionality"
-- Isomorphism._≃_
d__'8771'__90 a0 a1 = ()
data T__'8771'__90
  = C__'8771'_'46'constructor_1645 (AgdaAny -> AgdaAny)
                                   (AgdaAny -> AgdaAny)
-- Isomorphism._≃_.to
d_to_108 :: T__'8771'__90 -> AgdaAny -> AgdaAny
d_to_108 v0
  = case coe v0 of
      C__'8771'_'46'constructor_1645 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Isomorphism._≃_.from
d_from_110 :: T__'8771'__90 -> AgdaAny -> AgdaAny
d_from_110 v0
  = case coe v0 of
      C__'8771'_'46'constructor_1645 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Isomorphism._≃_.from∘to
d_from'8728'to_114 ::
  T__'8771'__90 -> AgdaAny -> MAlonzo.Code.Equivalence.T__'8801'__6
d_from'8728'to_114 = erased
-- Isomorphism._≃_.to∘from
d_to'8728'from_118 ::
  T__'8771'__90 -> AgdaAny -> MAlonzo.Code.Equivalence.T__'8801'__6
d_to'8728'from_118 = erased
-- Isomorphism._≃′_
d__'8771''8242'__124 a0 a1 = ()
data T__'8771''8242'__124
  = C_mk'45''8771''8242'_142 (AgdaAny -> AgdaAny)
                             (AgdaAny -> AgdaAny)
-- Isomorphism.to′
d_to'8242'_148 :: T__'8771''8242'__124 -> AgdaAny -> AgdaAny
d_to'8242'_148 v0
  = case coe v0 of
      C_mk'45''8771''8242'_142 v1 v2 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Isomorphism.from′
d_from'8242'_162 :: T__'8771''8242'__124 -> AgdaAny -> AgdaAny
d_from'8242'_162 v0
  = case coe v0 of
      C_mk'45''8771''8242'_142 v1 v2 -> coe v2
      _ -> MAlonzo.RTE.mazUnreachableError
-- Isomorphism.from∘to′
d_from'8728'to'8242'_180 ::
  T__'8771''8242'__124 ->
  AgdaAny -> MAlonzo.Code.Equivalence.T__'8801'__6
d_from'8728'to'8242'_180 = erased
-- Isomorphism.to∘from′
d_to'8728'from'8242'_198 ::
  T__'8771''8242'__124 ->
  AgdaAny -> MAlonzo.Code.Equivalence.T__'8801'__6
d_to'8728'from'8242'_198 = erased
-- Isomorphism.≃-refl
d_'8771''45'refl_210 :: () -> T__'8771'__90
d_'8771''45'refl_210 ~v0 = du_'8771''45'refl_210
du_'8771''45'refl_210 :: T__'8771'__90
du_'8771''45'refl_210
  = coe C__'8771'_'46'constructor_1645 (\ v0 -> v0) (\ v0 -> v0)
-- Isomorphism.≃-sym
d_'8771''45'sym_232 :: () -> () -> T__'8771'__90 -> T__'8771'__90
d_'8771''45'sym_232 ~v0 ~v1 v2 = du_'8771''45'sym_232 v2
du_'8771''45'sym_232 :: T__'8771'__90 -> T__'8771'__90
du_'8771''45'sym_232 v0
  = coe
      C__'8771'_'46'constructor_1645 (d_from_110 (coe v0))
      (d_to_108 (coe v0))
-- Isomorphism.≃-trans
d_'8771''45'trans_242 ::
  () -> () -> () -> T__'8771'__90 -> T__'8771'__90 -> T__'8771'__90
d_'8771''45'trans_242 ~v0 ~v1 ~v2 v3 v4
  = du_'8771''45'trans_242 v3 v4
du_'8771''45'trans_242 ::
  T__'8771'__90 -> T__'8771'__90 -> T__'8771'__90
du_'8771''45'trans_242 v0 v1
  = coe
      C__'8771'_'46'constructor_1645
      (coe du__'8728'__8 (coe d_to_108 (coe v1)) (coe d_to_108 (coe v0)))
      (coe
         du__'8728'__8 (coe d_from_110 (coe v0)) (coe d_from_110 (coe v1)))
-- Isomorphism.≃-Reasoning.≃-begin_
d_'8771''45'begin__262 :: T__'8771'__90 -> T__'8771'__90
d_'8771''45'begin__262 v0 = coe v0
-- Isomorphism.≃-Reasoning._≃⟨_⟩_
d__'8771''10216'_'10217'__272 ::
  () -> () -> () -> T__'8771'__90 -> T__'8771'__90 -> T__'8771'__90
d__'8771''10216'_'10217'__272 ~v0 ~v1 ~v2 v3 v4
  = du__'8771''10216'_'10217'__272 v3 v4
du__'8771''10216'_'10217'__272 ::
  T__'8771'__90 -> T__'8771'__90 -> T__'8771'__90
du__'8771''10216'_'10217'__272 v0 v1
  = coe du_'8771''45'trans_242 (coe v0) (coe v1)
-- Isomorphism.≃-Reasoning._≃-end
d__'8771''45'end_282 :: () -> T__'8771'__90
d__'8771''45'end_282 ~v0 = du__'8771''45'end_282
du__'8771''45'end_282 :: T__'8771'__90
du__'8771''45'end_282 = coe du_'8771''45'refl_210
