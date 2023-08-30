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

module MAlonzo.Code.IO.Base where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Coinduction
import qualified MAlonzo.Code.Agda.Builtin.IO
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.IO.Primitive
import qualified MAlonzo.Code.Level

-- IO.Base.IO
d_IO_16 a0 a1 = ()
data T_IO_16
  = C_lift_22 (MAlonzo.Code.Agda.Builtin.IO.T_IO_8 AgdaAny AgdaAny) |
    C_return_26 AgdaAny |
    C_bind_36 (MAlonzo.RTE.Infinity AgdaAny T_IO_16)
              (AgdaAny -> MAlonzo.RTE.Infinity AgdaAny T_IO_16) |
    C_seq_44 (MAlonzo.RTE.Infinity AgdaAny T_IO_16)
             (MAlonzo.RTE.Infinity AgdaAny T_IO_16)
-- IO.Base.pure
d_pure_46 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 -> () -> AgdaAny -> T_IO_16
d_pure_46 ~v0 ~v1 = du_pure_46
du_pure_46 :: AgdaAny -> T_IO_16
du_pure_46 = coe C_return_26
-- IO.Base._._<*>_
d__'60''42''62'__58 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  () -> () -> T_IO_16 -> T_IO_16 -> T_IO_16
d__'60''42''62'__58 ~v0 ~v1 ~v2 v3 v4 = du__'60''42''62'__58 v3 v4
du__'60''42''62'__58 :: T_IO_16 -> T_IO_16 -> T_IO_16
du__'60''42''62'__58 v0 v1
  = coe
      C_bind_36 (coe du_'9839''45'0_1039 (coe v0))
      (coe du_'9839''45'1_1263 (coe v1))
-- IO.Base._._<$>_
d__'60''36''62'__68 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  () -> () -> (AgdaAny -> AgdaAny) -> T_IO_16 -> T_IO_16
d__'60''36''62'__68 ~v0 ~v1 ~v2 v3 v4 = du__'60''36''62'__68 v3 v4
du__'60''36''62'__68 :: (AgdaAny -> AgdaAny) -> T_IO_16 -> T_IO_16
du__'60''36''62'__68 v0 v1
  = coe du__'60''42''62'__58 (coe du_pure_46 v0) (coe v1)
-- IO.Base._._>>=_
d__'62''62''61'__74 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  () -> () -> T_IO_16 -> (AgdaAny -> T_IO_16) -> T_IO_16
d__'62''62''61'__74 ~v0 ~v1 ~v2 v3 v4 = du__'62''62''61'__74 v3 v4
du__'62''62''61'__74 :: T_IO_16 -> (AgdaAny -> T_IO_16) -> T_IO_16
du__'62''62''61'__74 v0 v1
  = coe
      C_bind_36 (coe du_'9839''45'4_2745 (coe v0))
      (coe du_'9839''45'5_2969 (coe v1))
-- IO.Base._._>>_
d__'62''62'__82 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  () -> () -> T_IO_16 -> T_IO_16 -> T_IO_16
d__'62''62'__82 ~v0 ~v1 ~v2 v3 v4 = du__'62''62'__82 v3 v4
du__'62''62'__82 :: T_IO_16 -> T_IO_16 -> T_IO_16
du__'62''62'__82 v0 v1
  = coe
      C_seq_44 (coe du_'9839''45'6_3427 (coe v0))
      (coe du_'9839''45'7_3641 (coe v1))
-- IO.Base.run
d_run_88 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  () ->
  T_IO_16 -> MAlonzo.Code.Agda.Builtin.IO.T_IO_8 AgdaAny AgdaAny
d_run_88 v0 ~v1 v2 = du_run_88 v0 v2
du_run_88 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  T_IO_16 -> MAlonzo.Code.Agda.Builtin.IO.T_IO_8 AgdaAny AgdaAny
du_run_88 v0 v1
  = case coe v1 of
      C_lift_22 v2 -> coe v2
      C_return_26 v2
        -> coe MAlonzo.Code.IO.Primitive.d_return_8 v0 erased v2
      C_bind_36 v3 v4
        -> coe
             MAlonzo.Code.IO.Primitive.d__'62''62''61'__18 v0 v0 erased erased
             (coe
                du_run_88 (coe v0)
                (coe MAlonzo.Code.Agda.Builtin.Coinduction.d_'9837'_22 (coe v3)))
             (\ v5 ->
                coe
                  du_run_88 (coe v0)
                  (coe
                     MAlonzo.Code.Agda.Builtin.Coinduction.d_'9837'_22 (coe v4 v5)))
      C_seq_44 v3 v4
        -> coe
             MAlonzo.Code.IO.Primitive.d__'62''62''61'__18 v0 v0 erased erased
             (coe
                du_run_88 (coe v0)
                (coe MAlonzo.Code.Agda.Builtin.Coinduction.d_'9837'_22 (coe v3)))
             (\ v5 ->
                coe
                  du_run_88 (coe v0)
                  (coe MAlonzo.Code.Agda.Builtin.Coinduction.d_'9837'_22 (coe v4)))
      _ -> MAlonzo.RTE.mazUnreachableError
-- IO.Base.Main
d_Main_106 :: ()
d_Main_106 = erased
-- IO.Base.ignore
d_ignore_108 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 -> () -> T_IO_16 -> T_IO_16
d_ignore_108 ~v0 ~v1 v2 = du_ignore_108 v2
du_ignore_108 :: T_IO_16 -> T_IO_16
du_ignore_108 v0
  = coe
      du__'62''62'__82 (coe v0)
      (coe
         C_return_26
         (coe
            MAlonzo.Code.Level.C_lift_20
            (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)))
-- IO.Base._._.♯-0
d_'9839''45'0_1039 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  () ->
  () -> T_IO_16 -> T_IO_16 -> MAlonzo.RTE.Infinity AgdaAny T_IO_16
d_'9839''45'0_1039 ~v0 ~v1 ~v2 v3 ~v4 = du_'9839''45'0_1039 v3
du_'9839''45'0_1039 ::
  T_IO_16 -> MAlonzo.RTE.Infinity AgdaAny T_IO_16
du_'9839''45'0_1039 v0
  = coe MAlonzo.Code.Agda.Builtin.Coinduction.C_'9839'__16 (coe v0)
-- IO.Base._._.♯-1
d_'9839''45'1_1263 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  () ->
  () ->
  T_IO_16 ->
  T_IO_16 ->
  (AgdaAny -> AgdaAny) -> MAlonzo.RTE.Infinity AgdaAny T_IO_16
d_'9839''45'1_1263 ~v0 ~v1 ~v2 ~v3 v4 v5
  = du_'9839''45'1_1263 v4 v5
du_'9839''45'1_1263 ::
  T_IO_16 ->
  (AgdaAny -> AgdaAny) -> MAlonzo.RTE.Infinity AgdaAny T_IO_16
du_'9839''45'1_1263 v0 v1
  = coe
      MAlonzo.Code.Agda.Builtin.Coinduction.C_'9839'__16
      (coe
         C_bind_36 (coe du_'9839''45'2_1523 (coe v0))
         (coe du_'9839''45'3_1825 (coe v1)))
-- IO.Base._._._.♯-2
d_'9839''45'2_1523 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  () ->
  () ->
  T_IO_16 ->
  T_IO_16 ->
  (AgdaAny -> AgdaAny) -> MAlonzo.RTE.Infinity AgdaAny T_IO_16
d_'9839''45'2_1523 ~v0 ~v1 ~v2 ~v3 v4 ~v5 = du_'9839''45'2_1523 v4
du_'9839''45'2_1523 ::
  T_IO_16 -> MAlonzo.RTE.Infinity AgdaAny T_IO_16
du_'9839''45'2_1523 v0
  = coe MAlonzo.Code.Agda.Builtin.Coinduction.C_'9839'__16 (coe v0)
-- IO.Base._._._.♯-3
d_'9839''45'3_1825 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  () ->
  () ->
  T_IO_16 ->
  T_IO_16 ->
  (AgdaAny -> AgdaAny) ->
  AgdaAny -> MAlonzo.RTE.Infinity AgdaAny T_IO_16
d_'9839''45'3_1825 ~v0 ~v1 ~v2 ~v3 ~v4 v5 v6
  = du_'9839''45'3_1825 v5 v6
du_'9839''45'3_1825 ::
  (AgdaAny -> AgdaAny) ->
  AgdaAny -> MAlonzo.RTE.Infinity AgdaAny T_IO_16
du_'9839''45'3_1825 v0 v1
  = coe
      MAlonzo.Code.Agda.Builtin.Coinduction.C_'9839'__16
      (coe du_pure_46 (coe v0 v1))
-- IO.Base._._.♯-4
d_'9839''45'4_2745 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  () ->
  () ->
  T_IO_16 ->
  (AgdaAny -> T_IO_16) -> MAlonzo.RTE.Infinity AgdaAny T_IO_16
d_'9839''45'4_2745 ~v0 ~v1 ~v2 v3 ~v4 = du_'9839''45'4_2745 v3
du_'9839''45'4_2745 ::
  T_IO_16 -> MAlonzo.RTE.Infinity AgdaAny T_IO_16
du_'9839''45'4_2745 v0
  = coe MAlonzo.Code.Agda.Builtin.Coinduction.C_'9839'__16 (coe v0)
-- IO.Base._._.♯-5
d_'9839''45'5_2969 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  () ->
  () ->
  T_IO_16 ->
  (AgdaAny -> T_IO_16) ->
  AgdaAny -> MAlonzo.RTE.Infinity AgdaAny T_IO_16
d_'9839''45'5_2969 ~v0 ~v1 ~v2 ~v3 v4 v5
  = du_'9839''45'5_2969 v4 v5
du_'9839''45'5_2969 ::
  (AgdaAny -> T_IO_16) ->
  AgdaAny -> MAlonzo.RTE.Infinity AgdaAny T_IO_16
du_'9839''45'5_2969 v0 v1
  = coe
      MAlonzo.Code.Agda.Builtin.Coinduction.C_'9839'__16 (coe v0 v1)
-- IO.Base._._.♯-6
d_'9839''45'6_3427 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  () ->
  () -> T_IO_16 -> T_IO_16 -> MAlonzo.RTE.Infinity AgdaAny T_IO_16
d_'9839''45'6_3427 ~v0 ~v1 ~v2 v3 ~v4 = du_'9839''45'6_3427 v3
du_'9839''45'6_3427 ::
  T_IO_16 -> MAlonzo.RTE.Infinity AgdaAny T_IO_16
du_'9839''45'6_3427 v0
  = coe MAlonzo.Code.Agda.Builtin.Coinduction.C_'9839'__16 (coe v0)
-- IO.Base._._.♯-7
d_'9839''45'7_3641 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  () ->
  () -> T_IO_16 -> T_IO_16 -> MAlonzo.RTE.Infinity AgdaAny T_IO_16
d_'9839''45'7_3641 ~v0 ~v1 ~v2 ~v3 v4 = du_'9839''45'7_3641 v4
du_'9839''45'7_3641 ::
  T_IO_16 -> MAlonzo.RTE.Infinity AgdaAny T_IO_16
du_'9839''45'7_3641 v0
  = coe MAlonzo.Code.Agda.Builtin.Coinduction.C_'9839'__16 (coe v0)
