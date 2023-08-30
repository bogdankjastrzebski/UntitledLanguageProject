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

module MAlonzo.Code.IO.Finite where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.IO
import qualified MAlonzo.Code.Agda.Builtin.String
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.IO.Base
import qualified MAlonzo.Code.IO.Primitive
import qualified MAlonzo.Code.IO.Primitive.Finite
import qualified MAlonzo.Code.Level

-- IO.Finite.getLine
d_getLine_6 :: MAlonzo.Code.IO.Base.T_IO_16
d_getLine_6
  = coe
      MAlonzo.Code.IO.Base.C_lift_22
      (coe MAlonzo.Code.IO.Primitive.Finite.d_getLine_6)
-- IO.Finite.readFile
d_readFile_8 ::
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.IO.Base.T_IO_16
d_readFile_8 v0
  = coe
      MAlonzo.Code.IO.Base.C_lift_22
      (coe MAlonzo.Code.IO.Primitive.Finite.d_readFile_8 v0)
-- IO.Finite.lift′
d_lift'8242'_12 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  MAlonzo.Code.Agda.Builtin.IO.T_IO_8
    AgdaAny MAlonzo.Code.Agda.Builtin.Unit.T_'8868'_6 ->
  MAlonzo.Code.IO.Base.T_IO_16
d_lift'8242'_12 v0 v1
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
-- IO.Finite.writeFile
d_writeFile_18 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.IO.Base.T_IO_16
d_writeFile_18 v0 v1 v2
  = coe
      d_lift'8242'_12 (coe v0)
      (coe MAlonzo.Code.IO.Primitive.Finite.d_writeFile_10 v1 v2)
-- IO.Finite.appendFile
d_appendFile_24 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.IO.Base.T_IO_16
d_appendFile_24 v0 v1 v2
  = coe
      d_lift'8242'_12 (coe v0)
      (coe MAlonzo.Code.IO.Primitive.Finite.d_appendFile_12 v1 v2)
-- IO.Finite.putStr
d_putStr_30 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.IO.Base.T_IO_16
d_putStr_30 v0 v1
  = coe
      d_lift'8242'_12 (coe v0)
      (coe MAlonzo.Code.IO.Primitive.Finite.d_putStr_14 v1)
-- IO.Finite.putStrLn
d_putStrLn_34 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  MAlonzo.Code.Agda.Builtin.String.T_String_6 ->
  MAlonzo.Code.IO.Base.T_IO_16
d_putStrLn_34 v0 v1
  = coe
      d_lift'8242'_12 (coe v0)
      (coe MAlonzo.Code.IO.Primitive.Finite.d_putStrLn_16 v1)
