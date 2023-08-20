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

module MAlonzo.Code.HelloWorld where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text

-- HelloWorld._≡_
d__'8801'__6 a0 a1 a2 = ()
data T__'8801'__6 = C_refl_12
-- HelloWorld.≡-sym
d_'8801''45'sym_20 ::
  () -> AgdaAny -> AgdaAny -> T__'8801'__6 -> T__'8801'__6
d_'8801''45'sym_20 = erased
-- HelloWorld.≡-trans
d_'8801''45'trans_30 ::
  () ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> T__'8801'__6 -> T__'8801'__6 -> T__'8801'__6
d_'8801''45'trans_30 = erased
-- HelloWorld.≡-cong
d_'8801''45'cong_42 ::
  () ->
  () ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> T__'8801'__6 -> T__'8801'__6
d_'8801''45'cong_42 = erased
-- HelloWorld.≡-cong₂
d_'8801''45'cong'8322'_62 ::
  () ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> T__'8801'__6 -> T__'8801'__6 -> T__'8801'__6
d_'8801''45'cong'8322'_62 = erased
-- HelloWorld.≡-cong₃
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
-- HelloWorld.≡-cong-app
d_'8801''45'cong'45'app_102 ::
  () ->
  () ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> T__'8801'__6 -> AgdaAny -> T__'8801'__6
d_'8801''45'cong'45'app_102 = erased
-- HelloWorld.≡-subst
d_'8801''45'subst_112 ::
  () ->
  (AgdaAny -> ()) ->
  AgdaAny -> AgdaAny -> T__'8801'__6 -> AgdaAny -> AgdaAny
d_'8801''45'subst_112 ~v0 ~v1 ~v2 ~v3 ~v4 v5
  = du_'8801''45'subst_112 v5
du_'8801''45'subst_112 :: AgdaAny -> AgdaAny
du_'8801''45'subst_112 v0 = coe v0
-- HelloWorld.≡-Reasoning.begin_
d_begin__126 :: T__'8801'__6 -> T__'8801'__6
d_begin__126 = erased
-- HelloWorld.≡-Reasoning._≡⟨⟩_
d__'8801''10216''10217'__134 :: T__'8801'__6 -> T__'8801'__6
d__'8801''10216''10217'__134 = erased
-- HelloWorld.≡-Reasoning._≡⟨_⟩_
d__'8801''10216'_'10217'__146 ::
  () ->
  AgdaAny ->
  AgdaAny -> AgdaAny -> T__'8801'__6 -> T__'8801'__6 -> T__'8801'__6
d__'8801''10216'_'10217'__146 = erased
-- HelloWorld.≡-Reasoning._end
d__end_156 :: () -> AgdaAny -> T__'8801'__6
d__end_156 = erased
-- HelloWorld.ℕ
d_ℕ_160 = ()
data T_ℕ_160 = C_zero_162 | C_suc_164 T_ℕ_160
-- HelloWorld._+_
d__'43'__166 :: T_ℕ_160 -> T_ℕ_160 -> T_ℕ_160
d__'43'__166 v0 v1
  = case coe v0 of
      C_zero_162 -> coe v1
      C_suc_164 v2 -> coe C_suc_164 (coe d__'43'__166 (coe v2) (coe v1))
      _ -> MAlonzo.RTE.mazUnreachableError
-- HelloWorld.+-identity
d_'43''45'identity_176
  = error
      "MAlonzo Runtime Error: postulate evaluated: HelloWorld.+-identity"
-- HelloWorld.+-suc
d_'43''45'suc_182
  = error
      "MAlonzo Runtime Error: postulate evaluated: HelloWorld.+-suc"
-- HelloWorld.+-comm
d_'43''45'comm_188 :: T_ℕ_160 -> T_ℕ_160 -> T__'8801'__6
d_'43''45'comm_188 = erased
-- HelloWorld.fib₀
d_fib'8320'_196 :: T_ℕ_160 -> T_ℕ_160
d_fib'8320'_196 v0
  = case coe v0 of
      C_zero_162 -> coe v0
      C_suc_164 v1
        -> case coe v1 of
             C_zero_162 -> coe v0
             C_suc_164 v2
               -> coe
                    d__'43'__166 (coe d_fib'8320'_196 (coe v2))
                    (coe d_fib'8320'_196 (coe v1))
             _ -> MAlonzo.RTE.mazUnreachableError
      _ -> MAlonzo.RTE.mazUnreachableError
-- HelloWorld.fib₁-rec
d_fib'8321''45'rec_200 :: T_ℕ_160 -> T_ℕ_160 -> T_ℕ_160 -> T_ℕ_160
d_fib'8321''45'rec_200 v0 v1 v2
  = case coe v2 of
      C_zero_162 -> coe v1
      C_suc_164 v3
        -> coe
             d_fib'8321''45'rec_200 (coe v1)
             (coe d__'43'__166 (coe v0) (coe v1)) (coe v3)
      _ -> MAlonzo.RTE.mazUnreachableError
-- HelloWorld.fib₁
d_fib'8321'_212 :: T_ℕ_160 -> T_ℕ_160
d_fib'8321'_212 v0
  = coe
      d_fib'8321''45'rec_200 (coe C_suc_164 (coe C_zero_162))
      (coe C_zero_162) (coe v0)
-- HelloWorld.lemma-giant-step
d_lemma'45'giant'45'step_220 :: T_ℕ_160 -> T_ℕ_160 -> T__'8801'__6
d_lemma'45'giant'45'step_220 = erased
-- HelloWorld.theorem
d_theorem_230 :: T_ℕ_160 -> T__'8801'__6
d_theorem_230 = erased
