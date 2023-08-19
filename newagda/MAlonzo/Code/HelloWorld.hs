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
                    d__'43'__166 (coe d_fib'8320'_196 (coe v1))
                    (coe d_fib'8320'_196 (coe v2))
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
-- HelloWorld.pr
d_pr_220 :: T_ℕ_160 -> T_ℕ_160 -> T__'8801'__6
d_pr_220 = erased
-- HelloWorld.pr1
d_pr1_232 ::
  (T_ℕ_160 -> T_ℕ_160) -> T_ℕ_160 -> T_ℕ_160 -> T__'8801'__6
d_pr1_232 = erased
-- HelloWorld.pr2
d_pr2_244 :: T_ℕ_160 -> T_ℕ_160 -> T__'8801'__6
d_pr2_244 = erased
-- HelloWorld.pr4
d_pr4_252 :: T_ℕ_160 -> T__'8801'__6
d_pr4_252 = erased
-- HelloWorld.skip-cong
d_skip'45'cong_270 ::
  () ->
  () ->
  () ->
  (AgdaAny -> AgdaAny -> AgdaAny) ->
  AgdaAny -> AgdaAny -> AgdaAny -> T__'8801'__6 -> T__'8801'__6
d_skip'45'cong_270 = erased
-- HelloWorld.pr3
d_pr3_280 :: T_ℕ_160 -> T_ℕ_160 -> T__'8801'__6
d_pr3_280 = erased
-- HelloWorld.lemma₀
d_lemma'8320'_290 :: T_ℕ_160 -> T_ℕ_160 -> T__'8801'__6
d_lemma'8320'_290 = erased
-- HelloWorld._.0≡fib₀0
d_0'8801'fib'8320'0_298 :: T_ℕ_160 -> T__'8801'__6
d_0'8801'fib'8320'0_298 = erased
-- HelloWorld._.1≡fib₀1
d_1'8801'fib'8320'1_300 :: T_ℕ_160 -> T__'8801'__6
d_1'8801'fib'8320'1_300 = erased
-- HelloWorld._.m+0≡m
d_m'43'0'8801'm_302 :: T_ℕ_160 -> T__'8801'__6
d_m'43'0'8801'm_302 = erased
-- HelloWorld.lemma₁
d_lemma'8321'_310 :: T_ℕ_160 -> T__'8801'__6
d_lemma'8321'_310 = erased
-- HelloWorld.pr5
d_pr5_318 :: T_ℕ_160 -> T_ℕ_160 -> T__'8801'__6
d_pr5_318 = erased
-- HelloWorld.pr6
d_pr6_326 :: T_ℕ_160 -> T__'8801'__6
d_pr6_326 = erased
-- HelloWorld.theorem
d_theorem_332 :: T_ℕ_160 -> T__'8801'__6
d_theorem_332 = erased
