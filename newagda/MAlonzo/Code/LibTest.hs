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

module MAlonzo.Code.LibTest where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.IO
import qualified MAlonzo.Code.IO.Base
import qualified MAlonzo.Code.IO.Finite
import qualified MAlonzo.Code.Level

-- LibTest._≤_
d__'8804'__2 a0 a1 = ()
data T__'8804'__2 = C_z'8804'n_6 | C_s'8804's_12 T__'8804'__2
main = coe d_main_14
-- LibTest.main
d_main_14 ::
  MAlonzo.Code.Agda.Builtin.IO.T_IO_8
    AgdaAny MAlonzo.Code.Level.T_Lift_8
d_main_14
  = coe
      MAlonzo.Code.IO.Base.du_run_88 (coe MAlonzo.Code.Level.d_0ℓ_22)
      (coe
         MAlonzo.Code.IO.Finite.d_putStrLn_34
         (coe MAlonzo.Code.Level.d_0ℓ_22)
         (coe ("Hello, world!" :: Data.Text.Text)))
