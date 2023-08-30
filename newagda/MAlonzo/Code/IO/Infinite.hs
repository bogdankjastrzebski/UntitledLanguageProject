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

module MAlonzo.Code.IO.Infinite where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Char
import qualified MAlonzo.Code.Agda.Builtin.IO
import qualified MAlonzo.Code.Agda.Builtin.String
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Codata.Musical.Colist.Base
import qualified MAlonzo.Code.IO.Base
import qualified MAlonzo.Code.IO.Primitive
import qualified MAlonzo.Code.IO.Primitive.Infinite
import qualified MAlonzo.Code.Level

-- IO.Infinite.getContents
d_getContents_6 :: MAlonzo.Code.IO.Base.T_IO_16
d_getContents_6
  = coe
      MAlonzo.Code.IO.Base.C_lift_22
      (coe MAlonzo.Code.IO.Primitive.Infinite.d_getContents_6)
-- IO.Infinite.lift′
d_lift'8242'_8 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  MAlonzo.Code.Agda.Builtin.IO.T_IO_8
    AgdaAny MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6 ->
  MAlonzo.Code.IO.Base.T_IO_16
d_lift'8242'_8 v0 v1
  = coe
      MAlonzo.Code.IO.Base.C_lift_22
      (coe
         MAlonzo.Code.IO.Primitive.d__'62''62''61'__18 () v0 erased erased
         v1
         (\ v2 ->
            coe
              MAlonzo.Code.IO.Primitive.d_return_8 v0 erased
              (coe
                 MAlonzo.Code.Level.C_lift_20
                 (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8))))
-- IO.Infinite.writeFile
d_writeFile_14 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Codata.Musical.Colist.Base.T_Colist_20
    AgdaAny MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
  MAlonzo.Code.IO.Base.T_IO_16
d_writeFile_14 v0 v1 v2
  = coe
      d_lift'8242'_8 (coe v0)
      (coe MAlonzo.Code.IO.Primitive.Infinite.d_writeFile_10 v1 v2)
-- IO.Infinite.appendFile
d_appendFile_20 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Codata.Musical.Colist.Base.T_Colist_20
    AgdaAny MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
  MAlonzo.Code.IO.Base.T_IO_16
d_appendFile_20 v0 v1 v2
  = coe
      d_lift'8242'_8 (coe v0)
      (coe MAlonzo.Code.IO.Primitive.Infinite.d_appendFile_12 v1 v2)
-- IO.Infinite.putStr
d_putStr_26 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  MAlonzo.Code.Codata.Musical.Colist.Base.T_Colist_20
    AgdaAny MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
  MAlonzo.Code.IO.Base.T_IO_16
d_putStr_26 v0 v1
  = coe
      d_lift'8242'_8 (coe v0)
      (coe MAlonzo.Code.IO.Primitive.Infinite.d_putStr_14 v1)
-- IO.Infinite.putStrLn
d_putStrLn_30 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  MAlonzo.Code.Codata.Musical.Colist.Base.T_Colist_20
    AgdaAny MAlonzo.Code.Agda.Builtin.Char.T_Char_6 ->
  MAlonzo.Code.IO.Base.T_IO_16
d_putStrLn_30 v0 v1
  = coe
      d_lift'8242'_8 (coe v0)
      (coe MAlonzo.Code.IO.Primitive.Infinite.d_putStrLn_16 v1)
