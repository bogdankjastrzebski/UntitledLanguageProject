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

import qualified Data.Text.IO as Text
-- HelloWorld.Unit
d_Unit_2 = ()
type T_Unit_2 = ()
pattern C_unit_4 = ()
check_unit_4 :: T_Unit_2
check_unit_4 = ()
cover_Unit_2 :: () -> ()
cover_Unit_2 x
  = case x of
      () -> ()
-- HelloWorld.String
type T_String_6 = Data.Text.Text
d_String_6
  = error
      "MAlonzo Runtime Error: postulate evaluated: HelloWorld.String"
-- HelloWorld.IO
type T_IO_8 a0 = IO a0
d_IO_8
  = error "MAlonzo Runtime Error: postulate evaluated: HelloWorld.IO"
-- HelloWorld.putStr
d_putStr_10 :: T_String_6 -> T_IO_8 T_Unit_2
d_putStr_10 = Text.putStr
main = coe d_main_12
-- HelloWorld.main
d_main_12 :: T_IO_8 T_Unit_2
d_main_12 = coe d_putStr_10 ("Hello, World!\n" :: Data.Text.Text)
