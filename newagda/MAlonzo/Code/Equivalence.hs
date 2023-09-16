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

module MAlonzo.Code.Equivalence where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text

-- Equivalence._≡_
d__'8801'__6 a0 a1 a2 = ()
data T__'8801'__6 = C_refl_12
-- Equivalence.≡-sym
d_'8801''45'sym_20 ::
  () -> AgdaAny -> AgdaAny -> T__'8801'__6 -> T__'8801'__6
d_'8801''45'sym_20 = erased
-- Equivalence.≡-trans
d_'8801''45'trans_30 ::
  () ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> T__'8801'__6 -> T__'8801'__6 -> T__'8801'__6
d_'8801''45'trans_30 = erased
-- Equivalence.≡-cong
d_'8801''45'cong_42 ::
  () ->
  () ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> T__'8801'__6 -> T__'8801'__6
d_'8801''45'cong_42 = erased
-- Equivalence.≡-cong₂
d_'8801''45'cong'8322'_62 ::
  () ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> T__'8801'__6 -> T__'8801'__6 -> T__'8801'__6
d_'8801''45'cong'8322'_62 = erased
-- Equivalence.≡-cong₃
d_'8801''45'cong'8323'_88 ::
  () ->
  () ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny ->
  T__'8801'__6 -> T__'8801'__6 -> T__'8801'__6 -> T__'8801'__6
d_'8801''45'cong'8323'_88 = erased
-- Equivalence.≡-cong-app
d_'8801''45'cong'45'app_102 ::
  () ->
  () ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> T__'8801'__6 -> AgdaAny -> T__'8801'__6
d_'8801''45'cong'45'app_102 = erased
-- Equivalence.≡-subst
d_'8801''45'subst_112 ::
  () ->
  (AgdaAny -> ()) ->
  AgdaAny -> AgdaAny -> T__'8801'__6 -> AgdaAny -> AgdaAny
d_'8801''45'subst_112 ~v0 ~v1 ~v2 ~v3 ~v4 v5
  = du_'8801''45'subst_112 v5
du_'8801''45'subst_112 :: AgdaAny -> AgdaAny
du_'8801''45'subst_112 v0 = coe v0
-- Equivalence.≡-Reasoning.begin_
d_begin__126 :: T__'8801'__6 -> T__'8801'__6
d_begin__126 = erased
-- Equivalence.≡-Reasoning._≡⟨⟩_
d__'8801''10216''10217'__134 :: T__'8801'__6 -> T__'8801'__6
d__'8801''10216''10217'__134 = erased
-- Equivalence.≡-Reasoning._≡⟨_⟩_
d__'8801''10216'_'10217'__146 ::
  () ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> T__'8801'__6 -> T__'8801'__6 -> T__'8801'__6
d__'8801''10216'_'10217'__146 = erased
-- Equivalence.≡-Reasoning._end
d__end_156 :: () -> AgdaAny -> T__'8801'__6
d__end_156 = erased
