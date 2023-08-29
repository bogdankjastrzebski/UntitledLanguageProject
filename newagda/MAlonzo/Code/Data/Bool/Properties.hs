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

module MAlonzo.Code.Data.Bool.Properties where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text
import qualified MAlonzo.Code.Agda.Builtin.Bool
import qualified MAlonzo.Code.Agda.Builtin.Equality
import qualified MAlonzo.Code.Agda.Builtin.Sigma
import qualified MAlonzo.Code.Agda.Builtin.Unit
import qualified MAlonzo.Code.Agda.Primitive
import qualified MAlonzo.Code.Algebra.Bundles
import qualified MAlonzo.Code.Algebra.Properties.BooleanAlgebra
import qualified MAlonzo.Code.Algebra.Structures
import qualified MAlonzo.Code.Data.Bool.Base
import qualified MAlonzo.Code.Data.Empty
import qualified MAlonzo.Code.Data.Sum.Base
import qualified MAlonzo.Code.Function.Equivalence
import qualified MAlonzo.Code.Relation.Binary.Bundles
import qualified MAlonzo.Code.Relation.Binary.Definitions
import qualified MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties
import qualified MAlonzo.Code.Relation.Binary.Structures
import qualified MAlonzo.Code.Relation.Nullary

-- Data.Bool.Properties._._Absorbs_
d__Absorbs__8 ::
  (Bool -> Bool -> Bool) -> (Bool -> Bool -> Bool) -> ()
d__Absorbs__8 = erased
-- Data.Bool.Properties._._DistributesOver_
d__DistributesOver__10 ::
  (Bool -> Bool -> Bool) -> (Bool -> Bool -> Bool) -> ()
d__DistributesOver__10 = erased
-- Data.Bool.Properties._._DistributesOverʳ_
d__DistributesOver'691'__12 ::
  (Bool -> Bool -> Bool) -> (Bool -> Bool -> Bool) -> ()
d__DistributesOver'691'__12 = erased
-- Data.Bool.Properties._._DistributesOverˡ_
d__DistributesOver'737'__14 ::
  (Bool -> Bool -> Bool) -> (Bool -> Bool -> Bool) -> ()
d__DistributesOver'737'__14 = erased
-- Data.Bool.Properties._._IdempotentOn_
d__IdempotentOn__16 :: (Bool -> Bool -> Bool) -> Bool -> ()
d__IdempotentOn__16 = erased
-- Data.Bool.Properties._.Absorptive
d_Absorptive_18 ::
  (Bool -> Bool -> Bool) -> (Bool -> Bool -> Bool) -> ()
d_Absorptive_18 = erased
-- Data.Bool.Properties._.Associative
d_Associative_26 :: (Bool -> Bool -> Bool) -> ()
d_Associative_26 = erased
-- Data.Bool.Properties._.Commutative
d_Commutative_30 :: (Bool -> Bool -> Bool) -> ()
d_Commutative_30 = erased
-- Data.Bool.Properties._.Idempotent
d_Idempotent_38 :: (Bool -> Bool -> Bool) -> ()
d_Idempotent_38 = erased
-- Data.Bool.Properties._.Identity
d_Identity_42 :: Bool -> (Bool -> Bool -> Bool) -> ()
d_Identity_42 = erased
-- Data.Bool.Properties._.Inverse
d_Inverse_46 ::
  Bool -> (Bool -> Bool) -> (Bool -> Bool -> Bool) -> ()
d_Inverse_46 = erased
-- Data.Bool.Properties._.Involutive
d_Involutive_48 :: (Bool -> Bool) -> ()
d_Involutive_48 = erased
-- Data.Bool.Properties._.LeftIdentity
d_LeftIdentity_56 :: Bool -> (Bool -> Bool -> Bool) -> ()
d_LeftIdentity_56 = erased
-- Data.Bool.Properties._.LeftInverse
d_LeftInverse_58 ::
  Bool -> (Bool -> Bool) -> (Bool -> Bool -> Bool) -> ()
d_LeftInverse_58 = erased
-- Data.Bool.Properties._.LeftZero
d_LeftZero_60 :: Bool -> (Bool -> Bool -> Bool) -> ()
d_LeftZero_60 = erased
-- Data.Bool.Properties._.RightIdentity
d_RightIdentity_68 :: Bool -> (Bool -> Bool -> Bool) -> ()
d_RightIdentity_68 = erased
-- Data.Bool.Properties._.RightInverse
d_RightInverse_70 ::
  Bool -> (Bool -> Bool) -> (Bool -> Bool -> Bool) -> ()
d_RightInverse_70 = erased
-- Data.Bool.Properties._.RightZero
d_RightZero_72 :: Bool -> (Bool -> Bool -> Bool) -> ()
d_RightZero_72 = erased
-- Data.Bool.Properties._.Selective
d_Selective_74 :: (Bool -> Bool -> Bool) -> ()
d_Selective_74 = erased
-- Data.Bool.Properties._.Zero
d_Zero_76 :: Bool -> (Bool -> Bool -> Bool) -> ()
d_Zero_76 = erased
-- Data.Bool.Properties._.IsAbelianGroup
d_IsAbelianGroup_80 a0 a1 a2 = ()
-- Data.Bool.Properties._.IsBand
d_IsBand_82 a0 = ()
-- Data.Bool.Properties._.IsBooleanAlgebra
d_IsBooleanAlgebra_84 a0 a1 a2 a3 a4 = ()
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring
d_IsCancellativeCommutativeSemiring_88 a0 a1 a2 a3 = ()
-- Data.Bool.Properties._.IsCommutativeMagma
d_IsCommutativeMagma_90 a0 = ()
-- Data.Bool.Properties._.IsCommutativeMonoid
d_IsCommutativeMonoid_92 a0 a1 = ()
-- Data.Bool.Properties._.IsCommutativeRing
d_IsCommutativeRing_94 a0 a1 a2 a3 a4 = ()
-- Data.Bool.Properties._.IsCommutativeSemigroup
d_IsCommutativeSemigroup_96 a0 = ()
-- Data.Bool.Properties._.IsCommutativeSemiring
d_IsCommutativeSemiring_98 a0 a1 a2 a3 = ()
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne
d_IsCommutativeSemiringWithoutOne_100 a0 a1 a2 = ()
-- Data.Bool.Properties._.IsDistributiveLattice
d_IsDistributiveLattice_102 a0 a1 = ()
-- Data.Bool.Properties._.IsGroup
d_IsGroup_104 a0 a1 a2 = ()
-- Data.Bool.Properties._.IsIdempotentCommutativeMonoid
d_IsIdempotentCommutativeMonoid_106 a0 a1 = ()
-- Data.Bool.Properties._.IsLattice
d_IsLattice_108 a0 a1 = ()
-- Data.Bool.Properties._.IsMagma
d_IsMagma_110 a0 = ()
-- Data.Bool.Properties._.IsMonoid
d_IsMonoid_112 a0 a1 = ()
-- Data.Bool.Properties._.IsNearSemiring
d_IsNearSemiring_114 a0 a1 a2 = ()
-- Data.Bool.Properties._.IsRing
d_IsRing_116 a0 a1 a2 a3 a4 = ()
-- Data.Bool.Properties._.IsSelectiveMagma
d_IsSelectiveMagma_118 a0 = ()
-- Data.Bool.Properties._.IsSemigroup
d_IsSemigroup_120 a0 = ()
-- Data.Bool.Properties._.IsSemilattice
d_IsSemilattice_122 a0 = ()
-- Data.Bool.Properties._.IsSemiring
d_IsSemiring_124 a0 a1 a2 a3 = ()
-- Data.Bool.Properties._.IsSemiringWithoutAnnihilatingZero
d_IsSemiringWithoutAnnihilatingZero_126 a0 a1 a2 a3 = ()
-- Data.Bool.Properties._.IsSemiringWithoutOne
d_IsSemiringWithoutOne_128 a0 a1 a2 = ()
-- Data.Bool.Properties._.IsAbelianGroup.assoc
d_assoc_134 ::
  MAlonzo.Code.Algebra.Structures.T_IsAbelianGroup_662 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_134 = erased
-- Data.Bool.Properties._.IsAbelianGroup.comm
d_comm_136 ::
  MAlonzo.Code.Algebra.Structures.T_IsAbelianGroup_662 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_comm_136 = erased
-- Data.Bool.Properties._.IsAbelianGroup.identity
d_identity_138 ::
  MAlonzo.Code.Algebra.Structures.T_IsAbelianGroup_662 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_138 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_594
         (coe MAlonzo.Code.Algebra.Structures.d_isGroup_674 (coe v0)))
-- Data.Bool.Properties._.IsAbelianGroup.inverse
d_inverse_144 ::
  MAlonzo.Code.Algebra.Structures.T_IsAbelianGroup_662 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_inverse_144 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_inverse_596
      (coe MAlonzo.Code.Algebra.Structures.d_isGroup_674 (coe v0))
-- Data.Bool.Properties._.IsAbelianGroup.isEquivalence
d_isEquivalence_156 ::
  MAlonzo.Code.Algebra.Structures.T_IsAbelianGroup_662 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_156 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
            (coe
               MAlonzo.Code.Algebra.Structures.d_isMonoid_594
               (coe MAlonzo.Code.Algebra.Structures.d_isGroup_674 (coe v0)))))
-- Data.Bool.Properties._.IsAbelianGroup.isGroup
d_isGroup_158 ::
  MAlonzo.Code.Algebra.Structures.T_IsAbelianGroup_662 ->
  MAlonzo.Code.Algebra.Structures.T_IsGroup_580
d_isGroup_158 v0
  = coe MAlonzo.Code.Algebra.Structures.d_isGroup_674 (coe v0)
-- Data.Bool.Properties._.IsAbelianGroup.isMagma
d_isMagma_160 ::
  MAlonzo.Code.Algebra.Structures.T_IsAbelianGroup_662 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_160 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_isMonoid_594
            (coe MAlonzo.Code.Algebra.Structures.d_isGroup_674 (coe v0))))
-- Data.Bool.Properties._.IsAbelianGroup.isMonoid
d_isMonoid_162 ::
  MAlonzo.Code.Algebra.Structures.T_IsAbelianGroup_662 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_isMonoid_162 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMonoid_594
      (coe MAlonzo.Code.Algebra.Structures.d_isGroup_674 (coe v0))
-- Data.Bool.Properties._.IsAbelianGroup.isSemigroup
d_isSemigroup_166 ::
  MAlonzo.Code.Algebra.Structures.T_IsAbelianGroup_662 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_166 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_594
         (coe MAlonzo.Code.Algebra.Structures.d_isGroup_674 (coe v0)))
-- Data.Bool.Properties._.IsAbelianGroup.⁻¹-cong
d_'8315''185''45'cong_182 ::
  MAlonzo.Code.Algebra.Structures.T_IsAbelianGroup_662 ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8315''185''45'cong_182 = erased
-- Data.Bool.Properties._.IsAbelianGroup.∙-cong
d_'8729''45'cong_184 ::
  MAlonzo.Code.Algebra.Structures.T_IsAbelianGroup_662 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_184 = erased
-- Data.Bool.Properties._.IsBand.assoc
d_assoc_192 ::
  MAlonzo.Code.Algebra.Structures.T_IsBand_230 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_192 = erased
-- Data.Bool.Properties._.IsBand.idem
d_idem_194 ::
  MAlonzo.Code.Algebra.Structures.T_IsBand_230 ->
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_idem_194 = erased
-- Data.Bool.Properties._.IsBand.isEquivalence
d_isEquivalence_196 ::
  MAlonzo.Code.Algebra.Structures.T_IsBand_230 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_196 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe MAlonzo.Code.Algebra.Structures.d_isSemigroup_238 (coe v0)))
-- Data.Bool.Properties._.IsBand.isMagma
d_isMagma_198 ::
  MAlonzo.Code.Algebra.Structures.T_IsBand_230 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_198 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe MAlonzo.Code.Algebra.Structures.d_isSemigroup_238 (coe v0))
-- Data.Bool.Properties._.IsBand.isSemigroup
d_isSemigroup_202 ::
  MAlonzo.Code.Algebra.Structures.T_IsBand_230 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_202 v0
  = coe MAlonzo.Code.Algebra.Structures.d_isSemigroup_238 (coe v0)
-- Data.Bool.Properties._.IsBand.∙-cong
d_'8729''45'cong_214 ::
  MAlonzo.Code.Algebra.Structures.T_IsBand_230 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_214 = erased
-- Data.Bool.Properties._.IsBooleanAlgebra.absorptive
d_absorptive_222 ::
  MAlonzo.Code.Algebra.Structures.T_IsBooleanAlgebra_1864 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_absorptive_222 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_absorptive_776
      (coe
         MAlonzo.Code.Algebra.Structures.d_isLattice_824
         (coe
            MAlonzo.Code.Algebra.Structures.d_isDistributiveLattice_1884
            (coe v0)))
-- Data.Bool.Properties._.IsBooleanAlgebra.isDistributiveLattice
d_isDistributiveLattice_224 ::
  MAlonzo.Code.Algebra.Structures.T_IsBooleanAlgebra_1864 ->
  MAlonzo.Code.Algebra.Structures.T_IsDistributiveLattice_814
d_isDistributiveLattice_224 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isDistributiveLattice_1884
      (coe v0)
-- Data.Bool.Properties._.IsBooleanAlgebra.isEquivalence
d_isEquivalence_226 ::
  MAlonzo.Code.Algebra.Structures.T_IsBooleanAlgebra_1864 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_226 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_762
      (coe
         MAlonzo.Code.Algebra.Structures.d_isLattice_824
         (coe
            MAlonzo.Code.Algebra.Structures.d_isDistributiveLattice_1884
            (coe v0)))
-- Data.Bool.Properties._.IsBooleanAlgebra.isLattice
d_isLattice_228 ::
  MAlonzo.Code.Algebra.Structures.T_IsBooleanAlgebra_1864 ->
  MAlonzo.Code.Algebra.Structures.T_IsLattice_740
d_isLattice_228 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isLattice_824
      (coe
         MAlonzo.Code.Algebra.Structures.d_isDistributiveLattice_1884
         (coe v0))
-- Data.Bool.Properties._.IsBooleanAlgebra.¬-cong
d_'172''45'cong_240 ::
  MAlonzo.Code.Algebra.Structures.T_IsBooleanAlgebra_1864 ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'172''45'cong_240 = erased
-- Data.Bool.Properties._.IsBooleanAlgebra.∧-assoc
d_'8743''45'assoc_244 ::
  MAlonzo.Code.Algebra.Structures.T_IsBooleanAlgebra_1864 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'assoc_244 = erased
-- Data.Bool.Properties._.IsBooleanAlgebra.∧-comm
d_'8743''45'comm_246 ::
  MAlonzo.Code.Algebra.Structures.T_IsBooleanAlgebra_1864 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'comm_246 = erased
-- Data.Bool.Properties._.IsBooleanAlgebra.∧-complementʳ
d_'8743''45'complement'691'_248 ::
  MAlonzo.Code.Algebra.Structures.T_IsBooleanAlgebra_1864 ->
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'complement'691'_248 = erased
-- Data.Bool.Properties._.IsBooleanAlgebra.∧-cong
d_'8743''45'cong_250 ::
  MAlonzo.Code.Algebra.Structures.T_IsBooleanAlgebra_1864 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'cong_250 = erased
-- Data.Bool.Properties._.IsBooleanAlgebra.∨-assoc
d_'8744''45'assoc_258 ::
  MAlonzo.Code.Algebra.Structures.T_IsBooleanAlgebra_1864 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'assoc_258 = erased
-- Data.Bool.Properties._.IsBooleanAlgebra.∨-comm
d_'8744''45'comm_260 ::
  MAlonzo.Code.Algebra.Structures.T_IsBooleanAlgebra_1864 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'comm_260 = erased
-- Data.Bool.Properties._.IsBooleanAlgebra.∨-complementʳ
d_'8744''45'complement'691'_262 ::
  MAlonzo.Code.Algebra.Structures.T_IsBooleanAlgebra_1864 ->
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'complement'691'_262 = erased
-- Data.Bool.Properties._.IsBooleanAlgebra.∨-cong
d_'8744''45'cong_264 ::
  MAlonzo.Code.Algebra.Structures.T_IsBooleanAlgebra_1864 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'cong_264 = erased
-- Data.Bool.Properties._.IsBooleanAlgebra.∨-distribʳ-∧
d_'8744''45'distrib'691''45''8743'_270 ::
  MAlonzo.Code.Algebra.Structures.T_IsBooleanAlgebra_1864 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'distrib'691''45''8743'_270 = erased
-- Data.Bool.Properties._.IsBoundedLattice.assoc
d_assoc_276 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_276 = erased
-- Data.Bool.Properties._.IsBoundedLattice.comm
d_comm_278 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_comm_278 = erased
-- Data.Bool.Properties._.IsBoundedLattice.idem
d_idem_280 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_idem_280 = erased
-- Data.Bool.Properties._.IsBoundedLattice.identity
d_identity_282 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_282 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_416
         (coe
            MAlonzo.Code.Algebra.Structures.d_isCommutativeMonoid_474
            (coe v0)))
-- Data.Bool.Properties._.IsBoundedLattice.isCommutativeMonoid
d_isCommutativeMonoid_290 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406
d_isCommutativeMonoid_290 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isCommutativeMonoid_474 (coe v0)
-- Data.Bool.Properties._.IsBoundedLattice.isEquivalence
d_isEquivalence_294 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_294 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
            (coe
               MAlonzo.Code.Algebra.Structures.d_isMonoid_416
               (coe
                  MAlonzo.Code.Algebra.Structures.d_isCommutativeMonoid_474
                  (coe v0)))))
-- Data.Bool.Properties._.IsBoundedLattice.isMagma
d_isMagma_296 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_296 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_isMonoid_416
            (coe
               MAlonzo.Code.Algebra.Structures.d_isCommutativeMonoid_474
               (coe v0))))
-- Data.Bool.Properties._.IsBoundedLattice.isMonoid
d_isMonoid_298 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_isMonoid_298 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMonoid_416
      (coe
         MAlonzo.Code.Algebra.Structures.d_isCommutativeMonoid_474 (coe v0))
-- Data.Bool.Properties._.IsBoundedLattice.isSemigroup
d_isSemigroup_302 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_302 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_416
         (coe
            MAlonzo.Code.Algebra.Structures.d_isCommutativeMonoid_474
            (coe v0)))
-- Data.Bool.Properties._.IsBoundedLattice.∙-cong
d_'8729''45'cong_314 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_314 = erased
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.assoc
d_assoc_322 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_322 = erased
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.*-cancelˡ-nonZero
d_'42''45'cancel'737''45'nonZero_324 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  Bool ->
  Bool ->
  Bool ->
  (MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
   MAlonzo.Code.Data.Empty.T_'8869'_4) ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'42''45'cancel'737''45'nonZero_324 = erased
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.*-comm
d_'42''45'comm_326 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'42''45'comm_326 = erased
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.∙-cong
d_'8729''45'cong_328 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_328 = erased
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.identity
d_identity_334 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_334 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1160
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
            (coe
               MAlonzo.Code.Algebra.Structures.d_isSemiring_1358
               (coe
                  MAlonzo.Code.Algebra.Structures.d_isCommutativeSemiring_1476
                  (coe v0)))))
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.isMagma
d_isMagma_346 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_346 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1160
            (coe
               MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
               (coe
                  MAlonzo.Code.Algebra.Structures.d_isSemiring_1358
                  (coe
                     MAlonzo.Code.Algebra.Structures.d_isCommutativeSemiring_1476
                     (coe v0))))))
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.*-isMonoid
d_'42''45'isMonoid_348 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_'42''45'isMonoid_348 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1160
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemiring_1358
            (coe
               MAlonzo.Code.Algebra.Structures.d_isCommutativeSemiring_1476
               (coe v0))))
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.isSemigroup
d_isSemigroup_350 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_350 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1160
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
            (coe
               MAlonzo.Code.Algebra.Structures.d_isSemiring_1358
               (coe
                  MAlonzo.Code.Algebra.Structures.d_isCommutativeSemiring_1476
                  (coe v0)))))
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.assoc
d_assoc_352 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_352 = erased
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.comm
d_comm_354 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_comm_354 = erased
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.∙-cong
d_'8729''45'cong_356 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_356 = erased
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.identity
d_identity_362 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_362 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_416
         (coe
            MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
            (coe
               MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
               (coe
                  MAlonzo.Code.Algebra.Structures.d_isSemiring_1358
                  (coe
                     MAlonzo.Code.Algebra.Structures.d_isCommutativeSemiring_1476
                     (coe v0))))))
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.+-isCommutativeMonoid
d_'43''45'isCommutativeMonoid_370 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406
d_'43''45'isCommutativeMonoid_370 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemiring_1358
            (coe
               MAlonzo.Code.Algebra.Structures.d_isCommutativeSemiring_1476
               (coe v0))))
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.isMagma
d_isMagma_374 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_374 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_isMonoid_416
            (coe
               MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
               (coe
                  MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
                  (coe
                     MAlonzo.Code.Algebra.Structures.d_isSemiring_1358
                     (coe
                        MAlonzo.Code.Algebra.Structures.d_isCommutativeSemiring_1476
                        (coe v0)))))))
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.isMonoid
d_isMonoid_376 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_isMonoid_376 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMonoid_416
      (coe
         MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
            (coe
               MAlonzo.Code.Algebra.Structures.d_isSemiring_1358
               (coe
                  MAlonzo.Code.Algebra.Structures.d_isCommutativeSemiring_1476
                  (coe v0)))))
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.isSemigroup
d_isSemigroup_378 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_378 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_416
         (coe
            MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
            (coe
               MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
               (coe
                  MAlonzo.Code.Algebra.Structures.d_isSemiring_1358
                  (coe
                     MAlonzo.Code.Algebra.Structures.d_isCommutativeSemiring_1476
                     (coe v0))))))
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.distrib
d_distrib_380 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_distrib_380 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_distrib_1162
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemiring_1358
            (coe
               MAlonzo.Code.Algebra.Structures.d_isCommutativeSemiring_1476
               (coe v0))))
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.isCommutativeSemiring
d_isCommutativeSemiring_386 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344
d_isCommutativeSemiring_386 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isCommutativeSemiring_1476
      (coe v0)
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.isEquivalence
d_isEquivalence_390 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_390 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
            (coe
               MAlonzo.Code.Algebra.Structures.d_isMonoid_416
               (coe
                  MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
                  (coe
                     MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
                     (coe
                        MAlonzo.Code.Algebra.Structures.d_isSemiring_1358
                        (coe
                           MAlonzo.Code.Algebra.Structures.d_isCommutativeSemiring_1476
                           (coe v0))))))))
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.isNearSemiring
d_isNearSemiring_392 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876
d_isNearSemiring_392 ~v0 ~v1 ~v2 ~v3 v4 = du_isNearSemiring_392 v4
du_isNearSemiring_392 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876
du_isNearSemiring_392 v0
  = let v1
          = MAlonzo.Code.Algebra.Structures.d_isCommutativeSemiring_1476
              (coe v0) in
    let v2
          = MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Structures.du_isNearSemiring_990
      (coe
         MAlonzo.Code.Algebra.Structures.du_isSemiringWithoutOne_1326
         (coe v2))
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.isSemiring
d_isSemiring_396 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238
d_isSemiring_396 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemiring_1358
      (coe
         MAlonzo.Code.Algebra.Structures.d_isCommutativeSemiring_1476
         (coe v0))
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.isSemiringWithoutAnnihilatingZero
d_isSemiringWithoutAnnihilatingZero_398 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142
d_isSemiringWithoutAnnihilatingZero_398 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemiring_1358
         (coe
            MAlonzo.Code.Algebra.Structures.d_isCommutativeSemiring_1476
            (coe v0)))
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.isSemiringWithoutOne
d_isSemiringWithoutOne_400 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952
d_isSemiringWithoutOne_400 ~v0 ~v1 ~v2 ~v3 v4
  = du_isSemiringWithoutOne_400 v4
du_isSemiringWithoutOne_400 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952
du_isSemiringWithoutOne_400 v0
  = let v1
          = MAlonzo.Code.Algebra.Structures.d_isCommutativeSemiring_1476
              (coe v0) in
    coe
      MAlonzo.Code.Algebra.Structures.du_isSemiringWithoutOne_1326
      (coe MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v1))
-- Data.Bool.Properties._.IsCancellativeCommutativeSemiring.zero
d_zero_412 ::
  MAlonzo.Code.Algebra.Structures.T_IsCancellativeCommutativeSemiring_1462 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_zero_412 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_zero_1254
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemiring_1358
         (coe
            MAlonzo.Code.Algebra.Structures.d_isCommutativeSemiring_1476
            (coe v0)))
-- Data.Bool.Properties._.IsCommutativeMagma.comm
d_comm_420 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMagma_122 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_comm_420 = erased
-- Data.Bool.Properties._.IsCommutativeMagma.isEquivalence
d_isEquivalence_422 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMagma_122 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_422 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe MAlonzo.Code.Algebra.Structures.d_isMagma_130 (coe v0))
-- Data.Bool.Properties._.IsCommutativeMagma.isMagma
d_isMagma_424 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMagma_122 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_424 v0
  = coe MAlonzo.Code.Algebra.Structures.d_isMagma_130 (coe v0)
-- Data.Bool.Properties._.IsCommutativeMagma.∙-cong
d_'8729''45'cong_438 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMagma_122 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_438 = erased
-- Data.Bool.Properties._.IsCommutativeMonoid.assoc
d_assoc_446 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_446 = erased
-- Data.Bool.Properties._.IsCommutativeMonoid.comm
d_comm_448 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_comm_448 = erased
-- Data.Bool.Properties._.IsCommutativeMonoid.identity
d_identity_450 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_450 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe MAlonzo.Code.Algebra.Structures.d_isMonoid_416 (coe v0))
-- Data.Bool.Properties._.IsCommutativeMonoid.isEquivalence
d_isEquivalence_460 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_460 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
            (coe MAlonzo.Code.Algebra.Structures.d_isMonoid_416 (coe v0))))
-- Data.Bool.Properties._.IsCommutativeMonoid.isMagma
d_isMagma_462 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_462 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe MAlonzo.Code.Algebra.Structures.d_isMonoid_416 (coe v0)))
-- Data.Bool.Properties._.IsCommutativeMonoid.isMonoid
d_isMonoid_464 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_isMonoid_464 v0
  = coe MAlonzo.Code.Algebra.Structures.d_isMonoid_416 (coe v0)
-- Data.Bool.Properties._.IsCommutativeMonoid.isSemigroup
d_isSemigroup_468 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_468 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe MAlonzo.Code.Algebra.Structures.d_isMonoid_416 (coe v0))
-- Data.Bool.Properties._.IsCommutativeMonoid.∙-cong
d_'8729''45'cong_480 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_480 = erased
-- Data.Bool.Properties._.IsCommutativeRing.assoc
d_assoc_490 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_490 = erased
-- Data.Bool.Properties._.IsCommutativeRing.*-comm
d_'42''45'comm_492 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'42''45'comm_492 = erased
-- Data.Bool.Properties._.IsCommutativeRing.∙-cong
d_'8729''45'cong_494 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_494 = erased
-- Data.Bool.Properties._.IsCommutativeRing.identity
d_identity_500 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_500 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1606
         (coe MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0)))
-- Data.Bool.Properties._.IsCommutativeRing.isMagma
d_isMagma_512 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_512 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1606
            (coe MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0))))
-- Data.Bool.Properties._.IsCommutativeRing.*-isMonoid
d_'42''45'isMonoid_514 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_'42''45'isMonoid_514 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1606
      (coe MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0))
-- Data.Bool.Properties._.IsCommutativeRing.isSemigroup
d_isSemigroup_516 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_516 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1606
         (coe MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0)))
-- Data.Bool.Properties._.IsCommutativeRing.assoc
d_assoc_518 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_518 = erased
-- Data.Bool.Properties._.IsCommutativeRing.comm
d_comm_520 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_comm_520 = erased
-- Data.Bool.Properties._.IsCommutativeRing.∙-cong
d_'8729''45'cong_522 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_522 = erased
-- Data.Bool.Properties._.IsCommutativeRing.identity
d_identity_528 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_528 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_594
         (coe
            MAlonzo.Code.Algebra.Structures.d_isGroup_674
            (coe
               MAlonzo.Code.Algebra.Structures.d_'43''45'isAbelianGroup_1604
               (coe MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0)))))
-- Data.Bool.Properties._.IsCommutativeRing.+-isAbelianGroup
d_'43''45'isAbelianGroup_534 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Algebra.Structures.T_IsAbelianGroup_662
d_'43''45'isAbelianGroup_534 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'43''45'isAbelianGroup_1604
      (coe MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0))
-- Data.Bool.Properties._.IsCommutativeRing.isGroup
d_isGroup_542 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Algebra.Structures.T_IsGroup_580
d_isGroup_542 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isGroup_674
      (coe
         MAlonzo.Code.Algebra.Structures.d_'43''45'isAbelianGroup_1604
         (coe MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0)))
-- Data.Bool.Properties._.IsCommutativeRing.isMagma
d_isMagma_544 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_544 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_isMonoid_594
            (coe
               MAlonzo.Code.Algebra.Structures.d_isGroup_674
               (coe
                  MAlonzo.Code.Algebra.Structures.d_'43''45'isAbelianGroup_1604
                  (coe MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0))))))
-- Data.Bool.Properties._.IsCommutativeRing.isMonoid
d_isMonoid_546 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_isMonoid_546 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMonoid_594
      (coe
         MAlonzo.Code.Algebra.Structures.d_isGroup_674
         (coe
            MAlonzo.Code.Algebra.Structures.d_'43''45'isAbelianGroup_1604
            (coe MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0))))
-- Data.Bool.Properties._.IsCommutativeRing.isSemigroup
d_isSemigroup_548 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_548 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_594
         (coe
            MAlonzo.Code.Algebra.Structures.d_isGroup_674
            (coe
               MAlonzo.Code.Algebra.Structures.d_'43''45'isAbelianGroup_1604
               (coe MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0)))))
-- Data.Bool.Properties._.IsCommutativeRing.⁻¹-cong
d_'8315''185''45'cong_550 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8315''185''45'cong_550 = erased
-- Data.Bool.Properties._.IsCommutativeRing.inverse
d_inverse_552 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_inverse_552 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_inverse_596
      (coe
         MAlonzo.Code.Algebra.Structures.d_isGroup_674
         (coe
            MAlonzo.Code.Algebra.Structures.d_'43''45'isAbelianGroup_1604
            (coe MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0))))
-- Data.Bool.Properties._.IsCommutativeRing.distrib
d_distrib_558 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_distrib_558 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_distrib_1608
      (coe MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0))
-- Data.Bool.Properties._.IsCommutativeRing.isEquivalence
d_isEquivalence_568 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_568 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
            (coe
               MAlonzo.Code.Algebra.Structures.d_isMonoid_594
               (coe
                  MAlonzo.Code.Algebra.Structures.d_isGroup_674
                  (coe
                     MAlonzo.Code.Algebra.Structures.d_'43''45'isAbelianGroup_1604
                     (coe MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0)))))))
-- Data.Bool.Properties._.IsCommutativeRing.isNearSemiring
d_isNearSemiring_570 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool) ->
  Bool ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876
d_isNearSemiring_570 ~v0 ~v1 ~v2 ~v3 ~v4 v5
  = du_isNearSemiring_570 v5
du_isNearSemiring_570 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876
du_isNearSemiring_570 v0
  = let v1
          = MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0) in
    let v2
          = coe
              MAlonzo.Code.Algebra.Structures.du_isSemiring_1698 (coe v1) in
    coe
      MAlonzo.Code.Algebra.Structures.du_isNearSemiring_990
      (coe
         MAlonzo.Code.Algebra.Structures.du_isSemiringWithoutOne_1326
         (coe v2))
-- Data.Bool.Properties._.IsCommutativeRing.isRing
d_isRing_574 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584
d_isRing_574 v0
  = coe MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0)
-- Data.Bool.Properties._.IsCommutativeRing.isSemiring
d_isSemiring_576 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool) ->
  Bool ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238
d_isSemiring_576 ~v0 ~v1 ~v2 ~v3 ~v4 v5 = du_isSemiring_576 v5
du_isSemiring_576 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238
du_isSemiring_576 v0
  = coe
      MAlonzo.Code.Algebra.Structures.du_isSemiring_1698
      (coe MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0))
-- Data.Bool.Properties._.IsCommutativeRing.isSemiringWithoutOne
d_isSemiringWithoutOne_580 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool) ->
  Bool ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952
d_isSemiringWithoutOne_580 ~v0 ~v1 ~v2 ~v3 ~v4 v5
  = du_isSemiringWithoutOne_580 v5
du_isSemiringWithoutOne_580 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952
du_isSemiringWithoutOne_580 v0
  = let v1
          = MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0) in
    coe
      MAlonzo.Code.Algebra.Structures.du_isSemiringWithoutOne_1326
      (coe MAlonzo.Code.Algebra.Structures.du_isSemiring_1698 (coe v1))
-- Data.Bool.Properties._.IsCommutativeRing.zero
d_zero_596 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeRing_1720 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_zero_596 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_zero_1610
      (coe MAlonzo.Code.Algebra.Structures.d_isRing_1736 (coe v0))
-- Data.Bool.Properties._.IsCommutativeSemigroup.assoc
d_assoc_604 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemigroup_270 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_604 = erased
-- Data.Bool.Properties._.IsCommutativeSemigroup.comm
d_comm_606 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemigroup_270 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_comm_606 = erased
-- Data.Bool.Properties._.IsCommutativeSemigroup.isEquivalence
d_isEquivalence_610 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemigroup_270 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_610 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe MAlonzo.Code.Algebra.Structures.d_isSemigroup_278 (coe v0)))
-- Data.Bool.Properties._.IsCommutativeSemigroup.isMagma
d_isMagma_612 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemigroup_270 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_612 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe MAlonzo.Code.Algebra.Structures.d_isSemigroup_278 (coe v0))
-- Data.Bool.Properties._.IsCommutativeSemigroup.isSemigroup
d_isSemigroup_616 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemigroup_270 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_616 v0
  = coe MAlonzo.Code.Algebra.Structures.d_isSemigroup_278 (coe v0)
-- Data.Bool.Properties._.IsCommutativeSemigroup.∙-cong
d_'8729''45'cong_628 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemigroup_270 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_628 = erased
-- Data.Bool.Properties._.IsCommutativeSemiring.assoc
d_assoc_636 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_636 = erased
-- Data.Bool.Properties._.IsCommutativeSemiring.*-comm
d_'42''45'comm_638 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'42''45'comm_638 = erased
-- Data.Bool.Properties._.IsCommutativeSemiring.∙-cong
d_'8729''45'cong_640 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_640 = erased
-- Data.Bool.Properties._.IsCommutativeSemiring.identity
d_identity_646 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_646 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1160
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
            (coe MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v0))))
-- Data.Bool.Properties._.IsCommutativeSemiring.isMagma
d_isMagma_658 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_658 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1160
            (coe
               MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
               (coe MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v0)))))
-- Data.Bool.Properties._.IsCommutativeSemiring.*-isMonoid
d_'42''45'isMonoid_660 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_'42''45'isMonoid_660 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1160
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
         (coe MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v0)))
-- Data.Bool.Properties._.IsCommutativeSemiring.isSemigroup
d_isSemigroup_662 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_662 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1160
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
            (coe MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v0))))
-- Data.Bool.Properties._.IsCommutativeSemiring.assoc
d_assoc_664 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_664 = erased
-- Data.Bool.Properties._.IsCommutativeSemiring.comm
d_comm_666 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_comm_666 = erased
-- Data.Bool.Properties._.IsCommutativeSemiring.∙-cong
d_'8729''45'cong_668 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_668 = erased
-- Data.Bool.Properties._.IsCommutativeSemiring.identity
d_identity_674 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_674 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_416
         (coe
            MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
            (coe
               MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
               (coe MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v0)))))
-- Data.Bool.Properties._.IsCommutativeSemiring.+-isCommutativeMonoid
d_'43''45'isCommutativeMonoid_682 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406
d_'43''45'isCommutativeMonoid_682 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
         (coe MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v0)))
-- Data.Bool.Properties._.IsCommutativeSemiring.isMagma
d_isMagma_686 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_686 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_isMonoid_416
            (coe
               MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
               (coe
                  MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
                  (coe
                     MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v0))))))
-- Data.Bool.Properties._.IsCommutativeSemiring.isMonoid
d_isMonoid_688 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_isMonoid_688 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMonoid_416
      (coe
         MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
            (coe MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v0))))
-- Data.Bool.Properties._.IsCommutativeSemiring.isSemigroup
d_isSemigroup_690 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_690 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_416
         (coe
            MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
            (coe
               MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
               (coe MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v0)))))
-- Data.Bool.Properties._.IsCommutativeSemiring.distrib
d_distrib_692 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_distrib_692 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_distrib_1162
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
         (coe MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v0)))
-- Data.Bool.Properties._.IsCommutativeSemiring.isEquivalence
d_isEquivalence_700 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_700 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
            (coe
               MAlonzo.Code.Algebra.Structures.d_isMonoid_416
               (coe
                  MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
                  (coe
                     MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
                     (coe
                        MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v0)))))))
-- Data.Bool.Properties._.IsCommutativeSemiring.isNearSemiring
d_isNearSemiring_702 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876
d_isNearSemiring_702 ~v0 ~v1 ~v2 ~v3 v4 = du_isNearSemiring_702 v4
du_isNearSemiring_702 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876
du_isNearSemiring_702 v0
  = let v1
          = MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v0) in
    coe
      MAlonzo.Code.Algebra.Structures.du_isNearSemiring_990
      (coe
         MAlonzo.Code.Algebra.Structures.du_isSemiringWithoutOne_1326
         (coe v1))
-- Data.Bool.Properties._.IsCommutativeSemiring.isSemiring
d_isSemiring_706 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238
d_isSemiring_706 v0
  = coe MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v0)
-- Data.Bool.Properties._.IsCommutativeSemiring.isSemiringWithoutAnnihilatingZero
d_isSemiringWithoutAnnihilatingZero_708 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142
d_isSemiringWithoutAnnihilatingZero_708 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
      (coe MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v0))
-- Data.Bool.Properties._.IsCommutativeSemiring.isSemiringWithoutOne
d_isSemiringWithoutOne_710 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952
d_isSemiringWithoutOne_710 ~v0 ~v1 ~v2 ~v3 v4
  = du_isSemiringWithoutOne_710 v4
du_isSemiringWithoutOne_710 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952
du_isSemiringWithoutOne_710 v0
  = coe
      MAlonzo.Code.Algebra.Structures.du_isSemiringWithoutOne_1326
      (coe MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v0))
-- Data.Bool.Properties._.IsCommutativeSemiring.zero
d_zero_722 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_zero_722 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_zero_1254
      (coe MAlonzo.Code.Algebra.Structures.d_isSemiring_1358 (coe v0))
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.assoc
d_assoc_730 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_730 = erased
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.*-comm
d_'42''45'comm_732 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'42''45'comm_732 = erased
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.∙-cong
d_'8729''45'cong_734 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_734 = erased
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.isMagma
d_isMagma_744 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_744 ~v0 ~v1 ~v2 v3 = du_isMagma_744 v3
du_isMagma_744 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
du_isMagma_744 v0
  = let v1
          = MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutOne_1056
              (coe v0) in
    coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_'42''45'isSemigroup_970 (coe v1))
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.*-isSemigroup
d_'42''45'isSemigroup_746 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_'42''45'isSemigroup_746 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'42''45'isSemigroup_970
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutOne_1056
         (coe v0))
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.assoc
d_assoc_748 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_748 = erased
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.comm
d_comm_750 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_comm_750 = erased
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.∙-cong
d_'8729''45'cong_752 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_752 = erased
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.identity
d_identity_758 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_758 ~v0 ~v1 ~v2 v3 = du_identity_758 v3
du_identity_758 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_identity_758 v0
  = let v1
          = MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutOne_1056
              (coe v0) in
    coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_416
         (coe
            MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_968
            (coe v1)))
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.+-isCommutativeMonoid
d_'43''45'isCommutativeMonoid_766 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406
d_'43''45'isCommutativeMonoid_766 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_968
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutOne_1056
         (coe v0))
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.isMagma
d_isMagma_770 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_770 ~v0 ~v1 ~v2 v3 = du_isMagma_770 v3
du_isMagma_770 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
du_isMagma_770 v0
  = let v1
          = MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutOne_1056
              (coe v0) in
    coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_isMonoid_416
            (coe
               MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_968
               (coe v1))))
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.isMonoid
d_isMonoid_772 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_isMonoid_772 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMonoid_416
      (coe
         MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_968
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutOne_1056
            (coe v0)))
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.isSemigroup
d_isSemigroup_774 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_774 ~v0 ~v1 ~v2 v3 = du_isSemigroup_774 v3
du_isSemigroup_774 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
du_isSemigroup_774 v0
  = let v1
          = MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutOne_1056
              (coe v0) in
    coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_416
         (coe
            MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_968
            (coe v1)))
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.distrib
d_distrib_776 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_distrib_776 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_distrib_972
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutOne_1056
         (coe v0))
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.distribʳ
d_distrib'691'_778 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_distrib'691'_778 = erased
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.isEquivalence
d_isEquivalence_780 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_780 ~v0 ~v1 ~v2 v3 = du_isEquivalence_780 v3
du_isEquivalence_780 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
du_isEquivalence_780 v0
  = let v1
          = MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutOne_1056
              (coe v0) in
    coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
            (coe
               MAlonzo.Code.Algebra.Structures.d_isMonoid_416
               (coe
                  MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_968
                  (coe v1)))))
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.isNearSemiring
d_isNearSemiring_782 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876
d_isNearSemiring_782 ~v0 ~v1 ~v2 v3 = du_isNearSemiring_782 v3
du_isNearSemiring_782 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876
du_isNearSemiring_782 v0
  = coe
      MAlonzo.Code.Algebra.Structures.du_isNearSemiring_990
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutOne_1056
         (coe v0))
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.isSemiringWithoutOne
d_isSemiringWithoutOne_786 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952
d_isSemiringWithoutOne_786 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutOne_1056
      (coe v0)
-- Data.Bool.Properties._.IsCommutativeSemiringWithoutOne.zero
d_zero_798 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiringWithoutOne_1044 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_zero_798 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_zero_974
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutOne_1056
         (coe v0))
-- Data.Bool.Properties._.IsDistributiveLattice.absorptive
d_absorptive_806 ::
  MAlonzo.Code.Algebra.Structures.T_IsDistributiveLattice_814 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_absorptive_806 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_absorptive_776
      (coe MAlonzo.Code.Algebra.Structures.d_isLattice_824 (coe v0))
-- Data.Bool.Properties._.IsDistributiveLattice.isEquivalence
d_isEquivalence_808 ::
  MAlonzo.Code.Algebra.Structures.T_IsDistributiveLattice_814 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_808 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_762
      (coe MAlonzo.Code.Algebra.Structures.d_isLattice_824 (coe v0))
-- Data.Bool.Properties._.IsDistributiveLattice.isLattice
d_isLattice_810 ::
  MAlonzo.Code.Algebra.Structures.T_IsDistributiveLattice_814 ->
  MAlonzo.Code.Algebra.Structures.T_IsLattice_740
d_isLattice_810 v0
  = coe MAlonzo.Code.Algebra.Structures.d_isLattice_824 (coe v0)
-- Data.Bool.Properties._.IsDistributiveLattice.∧-assoc
d_'8743''45'assoc_824 ::
  MAlonzo.Code.Algebra.Structures.T_IsDistributiveLattice_814 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'assoc_824 = erased
-- Data.Bool.Properties._.IsDistributiveLattice.∧-comm
d_'8743''45'comm_826 ::
  MAlonzo.Code.Algebra.Structures.T_IsDistributiveLattice_814 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'comm_826 = erased
-- Data.Bool.Properties._.IsDistributiveLattice.∧-cong
d_'8743''45'cong_828 ::
  MAlonzo.Code.Algebra.Structures.T_IsDistributiveLattice_814 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'cong_828 = erased
-- Data.Bool.Properties._.IsDistributiveLattice.∨-assoc
d_'8744''45'assoc_836 ::
  MAlonzo.Code.Algebra.Structures.T_IsDistributiveLattice_814 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'assoc_836 = erased
-- Data.Bool.Properties._.IsDistributiveLattice.∨-comm
d_'8744''45'comm_838 ::
  MAlonzo.Code.Algebra.Structures.T_IsDistributiveLattice_814 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'comm_838 = erased
-- Data.Bool.Properties._.IsDistributiveLattice.∨-cong
d_'8744''45'cong_840 ::
  MAlonzo.Code.Algebra.Structures.T_IsDistributiveLattice_814 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'cong_840 = erased
-- Data.Bool.Properties._.IsDistributiveLattice.∨-distribʳ-∧
d_'8744''45'distrib'691''45''8743'_846 ::
  MAlonzo.Code.Algebra.Structures.T_IsDistributiveLattice_814 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'distrib'691''45''8743'_846 = erased
-- Data.Bool.Properties._.IsGroup.assoc
d_assoc_854 ::
  MAlonzo.Code.Algebra.Structures.T_IsGroup_580 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_854 = erased
-- Data.Bool.Properties._.IsGroup.identity
d_identity_856 ::
  MAlonzo.Code.Algebra.Structures.T_IsGroup_580 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_856 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe MAlonzo.Code.Algebra.Structures.d_isMonoid_594 (coe v0))
-- Data.Bool.Properties._.IsGroup.inverse
d_inverse_862 ::
  MAlonzo.Code.Algebra.Structures.T_IsGroup_580 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_inverse_862 v0
  = coe MAlonzo.Code.Algebra.Structures.d_inverse_596 (coe v0)
-- Data.Bool.Properties._.IsGroup.isEquivalence
d_isEquivalence_868 ::
  MAlonzo.Code.Algebra.Structures.T_IsGroup_580 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_868 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
            (coe MAlonzo.Code.Algebra.Structures.d_isMonoid_594 (coe v0))))
-- Data.Bool.Properties._.IsGroup.isMagma
d_isMagma_870 ::
  MAlonzo.Code.Algebra.Structures.T_IsGroup_580 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_870 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe MAlonzo.Code.Algebra.Structures.d_isMonoid_594 (coe v0)))
-- Data.Bool.Properties._.IsGroup.isMonoid
d_isMonoid_872 ::
  MAlonzo.Code.Algebra.Structures.T_IsGroup_580 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_isMonoid_872 v0
  = coe MAlonzo.Code.Algebra.Structures.d_isMonoid_594 (coe v0)
-- Data.Bool.Properties._.IsGroup.isSemigroup
d_isSemigroup_876 ::
  MAlonzo.Code.Algebra.Structures.T_IsGroup_580 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_876 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe MAlonzo.Code.Algebra.Structures.d_isMonoid_594 (coe v0))
-- Data.Bool.Properties._.IsGroup.⁻¹-cong
d_'8315''185''45'cong_892 ::
  MAlonzo.Code.Algebra.Structures.T_IsGroup_580 ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8315''185''45'cong_892 = erased
-- Data.Bool.Properties._.IsGroup.∙-cong
d_'8729''45'cong_894 ::
  MAlonzo.Code.Algebra.Structures.T_IsGroup_580 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_894 = erased
-- Data.Bool.Properties._.IsIdempotentCommutativeMonoid.assoc
d_assoc_902 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_902 = erased
-- Data.Bool.Properties._.IsIdempotentCommutativeMonoid.comm
d_comm_904 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_comm_904 = erased
-- Data.Bool.Properties._.IsIdempotentCommutativeMonoid.idem
d_idem_906 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_idem_906 = erased
-- Data.Bool.Properties._.IsIdempotentCommutativeMonoid.identity
d_identity_908 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_908 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_416
         (coe
            MAlonzo.Code.Algebra.Structures.d_isCommutativeMonoid_474
            (coe v0)))
-- Data.Bool.Properties._.IsIdempotentCommutativeMonoid.isCommutativeMonoid
d_isCommutativeMonoid_916 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406
d_isCommutativeMonoid_916 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isCommutativeMonoid_474 (coe v0)
-- Data.Bool.Properties._.IsIdempotentCommutativeMonoid.isEquivalence
d_isEquivalence_920 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_920 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
            (coe
               MAlonzo.Code.Algebra.Structures.d_isMonoid_416
               (coe
                  MAlonzo.Code.Algebra.Structures.d_isCommutativeMonoid_474
                  (coe v0)))))
-- Data.Bool.Properties._.IsIdempotentCommutativeMonoid.isMagma
d_isMagma_922 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_922 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_isMonoid_416
            (coe
               MAlonzo.Code.Algebra.Structures.d_isCommutativeMonoid_474
               (coe v0))))
-- Data.Bool.Properties._.IsIdempotentCommutativeMonoid.isMonoid
d_isMonoid_924 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_isMonoid_924 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMonoid_416
      (coe
         MAlonzo.Code.Algebra.Structures.d_isCommutativeMonoid_474 (coe v0))
-- Data.Bool.Properties._.IsIdempotentCommutativeMonoid.isSemigroup
d_isSemigroup_928 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_928 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_416
         (coe
            MAlonzo.Code.Algebra.Structures.d_isCommutativeMonoid_474
            (coe v0)))
-- Data.Bool.Properties._.IsIdempotentCommutativeMonoid.∙-cong
d_'8729''45'cong_940 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_940 = erased
-- Data.Bool.Properties._.IsLattice.absorptive
d_absorptive_948 ::
  MAlonzo.Code.Algebra.Structures.T_IsLattice_740 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_absorptive_948 v0
  = coe MAlonzo.Code.Algebra.Structures.d_absorptive_776 (coe v0)
-- Data.Bool.Properties._.IsLattice.isEquivalence
d_isEquivalence_950 ::
  MAlonzo.Code.Algebra.Structures.T_IsLattice_740 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_950 v0
  = coe MAlonzo.Code.Algebra.Structures.d_isEquivalence_762 (coe v0)
-- Data.Bool.Properties._.IsLattice.∧-assoc
d_'8743''45'assoc_964 ::
  MAlonzo.Code.Algebra.Structures.T_IsLattice_740 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'assoc_964 = erased
-- Data.Bool.Properties._.IsLattice.∧-comm
d_'8743''45'comm_966 ::
  MAlonzo.Code.Algebra.Structures.T_IsLattice_740 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'comm_966 = erased
-- Data.Bool.Properties._.IsLattice.∧-cong
d_'8743''45'cong_968 ::
  MAlonzo.Code.Algebra.Structures.T_IsLattice_740 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'cong_968 = erased
-- Data.Bool.Properties._.IsLattice.∨-assoc
d_'8744''45'assoc_976 ::
  MAlonzo.Code.Algebra.Structures.T_IsLattice_740 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'assoc_976 = erased
-- Data.Bool.Properties._.IsLattice.∨-comm
d_'8744''45'comm_978 ::
  MAlonzo.Code.Algebra.Structures.T_IsLattice_740 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'comm_978 = erased
-- Data.Bool.Properties._.IsLattice.∨-cong
d_'8744''45'cong_980 ::
  MAlonzo.Code.Algebra.Structures.T_IsLattice_740 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'cong_980 = erased
-- Data.Bool.Properties._.IsMagma.isEquivalence
d_isEquivalence_988 ::
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_988 v0
  = coe MAlonzo.Code.Algebra.Structures.d_isEquivalence_94 (coe v0)
-- Data.Bool.Properties._.IsMagma.∙-cong
d_'8729''45'cong_1002 ::
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_1002 = erased
-- Data.Bool.Properties._.IsMonoid.assoc
d_assoc_1010 ::
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_1010 = erased
-- Data.Bool.Properties._.IsMonoid.identity
d_identity_1012 ::
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_1012 v0
  = coe MAlonzo.Code.Algebra.Structures.d_identity_370 (coe v0)
-- Data.Bool.Properties._.IsMonoid.isEquivalence
d_isEquivalence_1018 ::
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_1018 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe MAlonzo.Code.Algebra.Structures.d_isSemigroup_368 (coe v0)))
-- Data.Bool.Properties._.IsMonoid.isMagma
d_isMagma_1020 ::
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_1020 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe MAlonzo.Code.Algebra.Structures.d_isSemigroup_368 (coe v0))
-- Data.Bool.Properties._.IsMonoid.isSemigroup
d_isSemigroup_1024 ::
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_1024 v0
  = coe MAlonzo.Code.Algebra.Structures.d_isSemigroup_368 (coe v0)
-- Data.Bool.Properties._.IsMonoid.∙-cong
d_'8729''45'cong_1036 ::
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_1036 = erased
-- Data.Bool.Properties._.IsNearSemiring.assoc
d_assoc_1044 ::
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_1044 = erased
-- Data.Bool.Properties._.IsNearSemiring.∙-cong
d_'8729''45'cong_1046 ::
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_1046 = erased
-- Data.Bool.Properties._.IsNearSemiring.isMagma
d_isMagma_1052 ::
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_1052 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_'42''45'isSemigroup_894 (coe v0))
-- Data.Bool.Properties._.IsNearSemiring.*-isSemigroup
d_'42''45'isSemigroup_1054 ::
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_'42''45'isSemigroup_1054 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'42''45'isSemigroup_894 (coe v0)
-- Data.Bool.Properties._.IsNearSemiring.assoc
d_assoc_1056 ::
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_1056 = erased
-- Data.Bool.Properties._.IsNearSemiring.∙-cong
d_'8729''45'cong_1058 ::
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_1058 = erased
-- Data.Bool.Properties._.IsNearSemiring.identity
d_identity_1064 ::
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_1064 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_'43''45'isMonoid_892 (coe v0))
-- Data.Bool.Properties._.IsNearSemiring.isMagma
d_isMagma_1070 ::
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_1070 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_'43''45'isMonoid_892 (coe v0)))
-- Data.Bool.Properties._.IsNearSemiring.+-isMonoid
d_'43''45'isMonoid_1072 ::
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_'43''45'isMonoid_1072 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'43''45'isMonoid_892 (coe v0)
-- Data.Bool.Properties._.IsNearSemiring.isSemigroup
d_isSemigroup_1074 ::
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_1074 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_'43''45'isMonoid_892 (coe v0))
-- Data.Bool.Properties._.IsNearSemiring.distribʳ
d_distrib'691'_1076 ::
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_distrib'691'_1076 = erased
-- Data.Bool.Properties._.IsNearSemiring.isEquivalence
d_isEquivalence_1078 ::
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_1078 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
            (coe
               MAlonzo.Code.Algebra.Structures.d_'43''45'isMonoid_892 (coe v0))))
-- Data.Bool.Properties._.IsNearSemiring.zeroˡ
d_zero'737'_1092 ::
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876 ->
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_zero'737'_1092 = erased
-- Data.Bool.Properties._.IsRing.assoc
d_assoc_1098 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_1098 = erased
-- Data.Bool.Properties._.IsRing.∙-cong
d_'8729''45'cong_1100 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_1100 = erased
-- Data.Bool.Properties._.IsRing.identity
d_identity_1106 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_1106 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1606 (coe v0))
-- Data.Bool.Properties._.IsRing.isMagma
d_isMagma_1112 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_1112 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1606 (coe v0)))
-- Data.Bool.Properties._.IsRing.*-isMonoid
d_'42''45'isMonoid_1114 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_'42''45'isMonoid_1114 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1606 (coe v0)
-- Data.Bool.Properties._.IsRing.isSemigroup
d_isSemigroup_1116 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_1116 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1606 (coe v0))
-- Data.Bool.Properties._.IsRing.assoc
d_assoc_1118 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_1118 = erased
-- Data.Bool.Properties._.IsRing.comm
d_comm_1120 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_comm_1120 = erased
-- Data.Bool.Properties._.IsRing.∙-cong
d_'8729''45'cong_1122 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_1122 = erased
-- Data.Bool.Properties._.IsRing.identity
d_identity_1128 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_1128 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_594
         (coe
            MAlonzo.Code.Algebra.Structures.d_isGroup_674
            (coe
               MAlonzo.Code.Algebra.Structures.d_'43''45'isAbelianGroup_1604
               (coe v0))))
-- Data.Bool.Properties._.IsRing.+-isAbelianGroup
d_'43''45'isAbelianGroup_1134 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Algebra.Structures.T_IsAbelianGroup_662
d_'43''45'isAbelianGroup_1134 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'43''45'isAbelianGroup_1604
      (coe v0)
-- Data.Bool.Properties._.IsRing.isGroup
d_isGroup_1142 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Algebra.Structures.T_IsGroup_580
d_isGroup_1142 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isGroup_674
      (coe
         MAlonzo.Code.Algebra.Structures.d_'43''45'isAbelianGroup_1604
         (coe v0))
-- Data.Bool.Properties._.IsRing.isMagma
d_isMagma_1144 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_1144 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_isMonoid_594
            (coe
               MAlonzo.Code.Algebra.Structures.d_isGroup_674
               (coe
                  MAlonzo.Code.Algebra.Structures.d_'43''45'isAbelianGroup_1604
                  (coe v0)))))
-- Data.Bool.Properties._.IsRing.isMonoid
d_isMonoid_1146 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_isMonoid_1146 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMonoid_594
      (coe
         MAlonzo.Code.Algebra.Structures.d_isGroup_674
         (coe
            MAlonzo.Code.Algebra.Structures.d_'43''45'isAbelianGroup_1604
            (coe v0)))
-- Data.Bool.Properties._.IsRing.isSemigroup
d_isSemigroup_1148 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_1148 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_594
         (coe
            MAlonzo.Code.Algebra.Structures.d_isGroup_674
            (coe
               MAlonzo.Code.Algebra.Structures.d_'43''45'isAbelianGroup_1604
               (coe v0))))
-- Data.Bool.Properties._.IsRing.⁻¹-cong
d_'8315''185''45'cong_1150 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8315''185''45'cong_1150 = erased
-- Data.Bool.Properties._.IsRing.inverse
d_inverse_1152 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_inverse_1152 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_inverse_596
      (coe
         MAlonzo.Code.Algebra.Structures.d_isGroup_674
         (coe
            MAlonzo.Code.Algebra.Structures.d_'43''45'isAbelianGroup_1604
            (coe v0)))
-- Data.Bool.Properties._.IsRing.distrib
d_distrib_1158 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_distrib_1158 v0
  = coe MAlonzo.Code.Algebra.Structures.d_distrib_1608 (coe v0)
-- Data.Bool.Properties._.IsRing.isEquivalence
d_isEquivalence_1164 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_1164 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
            (coe
               MAlonzo.Code.Algebra.Structures.d_isMonoid_594
               (coe
                  MAlonzo.Code.Algebra.Structures.d_isGroup_674
                  (coe
                     MAlonzo.Code.Algebra.Structures.d_'43''45'isAbelianGroup_1604
                     (coe v0))))))
-- Data.Bool.Properties._.IsRing.isNearSemiring
d_isNearSemiring_1166 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool) ->
  Bool ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876
d_isNearSemiring_1166 ~v0 ~v1 ~v2 ~v3 ~v4 v5
  = du_isNearSemiring_1166 v5
du_isNearSemiring_1166 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876
du_isNearSemiring_1166 v0
  = let v1
          = coe
              MAlonzo.Code.Algebra.Structures.du_isSemiring_1698 (coe v0) in
    coe
      MAlonzo.Code.Algebra.Structures.du_isNearSemiring_990
      (coe
         MAlonzo.Code.Algebra.Structures.du_isSemiringWithoutOne_1326
         (coe v1))
-- Data.Bool.Properties._.IsRing.isSemiring
d_isSemiring_1170 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool) ->
  Bool ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238
d_isSemiring_1170 v0 v1 v2 v3 v4 v5
  = coe MAlonzo.Code.Algebra.Structures.du_isSemiring_1698 v5
-- Data.Bool.Properties._.IsRing.isSemiringWithoutOne
d_isSemiringWithoutOne_1174 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool) ->
  Bool ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952
d_isSemiringWithoutOne_1174 ~v0 ~v1 ~v2 ~v3 ~v4 v5
  = du_isSemiringWithoutOne_1174 v5
du_isSemiringWithoutOne_1174 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952
du_isSemiringWithoutOne_1174 v0
  = coe
      MAlonzo.Code.Algebra.Structures.du_isSemiringWithoutOne_1326
      (coe MAlonzo.Code.Algebra.Structures.du_isSemiring_1698 (coe v0))
-- Data.Bool.Properties._.IsRing.zero
d_zero_1190 ::
  MAlonzo.Code.Algebra.Structures.T_IsRing_1584 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_zero_1190 v0
  = coe MAlonzo.Code.Algebra.Structures.d_zero_1610 (coe v0)
-- Data.Bool.Properties._.IsSelectiveMagma.isEquivalence
d_isEquivalence_1198 ::
  MAlonzo.Code.Algebra.Structures.T_IsSelectiveMagma_158 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_1198 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe MAlonzo.Code.Algebra.Structures.d_isMagma_166 (coe v0))
-- Data.Bool.Properties._.IsSelectiveMagma.isMagma
d_isMagma_1200 ::
  MAlonzo.Code.Algebra.Structures.T_IsSelectiveMagma_158 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_1200 v0
  = coe MAlonzo.Code.Algebra.Structures.d_isMagma_166 (coe v0)
-- Data.Bool.Properties._.IsSelectiveMagma.sel
d_sel_1208 ::
  MAlonzo.Code.Algebra.Structures.T_IsSelectiveMagma_158 ->
  Bool -> Bool -> MAlonzo.Code.Data.Sum.Base.T__'8846'__30
d_sel_1208 v0
  = coe MAlonzo.Code.Algebra.Structures.d_sel_168 (coe v0)
-- Data.Bool.Properties._.IsSelectiveMagma.∙-cong
d_'8729''45'cong_1216 ::
  MAlonzo.Code.Algebra.Structures.T_IsSelectiveMagma_158 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_1216 = erased
-- Data.Bool.Properties._.IsSemigroup.assoc
d_assoc_1224 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_1224 = erased
-- Data.Bool.Properties._.IsSemigroup.isEquivalence
d_isEquivalence_1226 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_1226 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe MAlonzo.Code.Algebra.Structures.d_isMagma_202 (coe v0))
-- Data.Bool.Properties._.IsSemigroup.isMagma
d_isMagma_1228 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_1228 v0
  = coe MAlonzo.Code.Algebra.Structures.d_isMagma_202 (coe v0)
-- Data.Bool.Properties._.IsSemigroup.∙-cong
d_'8729''45'cong_1242 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_1242 = erased
-- Data.Bool.Properties._.IsSemilattice.assoc
d_assoc_1250 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemilattice_312 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_1250 = erased
-- Data.Bool.Properties._.IsSemilattice.comm
d_comm_1252 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemilattice_312 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_comm_1252 = erased
-- Data.Bool.Properties._.IsSemilattice.idem
d_idem_1254 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemilattice_312 ->
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_idem_1254 = erased
-- Data.Bool.Properties._.IsSemilattice.isBand
d_isBand_1256 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemilattice_312 ->
  MAlonzo.Code.Algebra.Structures.T_IsBand_230
d_isBand_1256 v0
  = coe MAlonzo.Code.Algebra.Structures.d_isBand_320 (coe v0)
-- Data.Bool.Properties._.IsSemilattice.isEquivalence
d_isEquivalence_1258 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemilattice_312 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_1258 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemigroup_238
            (coe MAlonzo.Code.Algebra.Structures.d_isBand_320 (coe v0))))
-- Data.Bool.Properties._.IsSemilattice.isMagma
d_isMagma_1260 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemilattice_312 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_1260 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_238
         (coe MAlonzo.Code.Algebra.Structures.d_isBand_320 (coe v0)))
-- Data.Bool.Properties._.IsSemilattice.isSemigroup
d_isSemigroup_1264 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemilattice_312 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_1264 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_238
      (coe MAlonzo.Code.Algebra.Structures.d_isBand_320 (coe v0))
-- Data.Bool.Properties._.IsSemilattice.∙-cong
d_'8729''45'cong_1276 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemilattice_312 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_1276 = erased
-- Data.Bool.Properties._.IsSemiring.assoc
d_assoc_1284 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_1284 = erased
-- Data.Bool.Properties._.IsSemiring.∙-cong
d_'8729''45'cong_1286 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_1286 = erased
-- Data.Bool.Properties._.IsSemiring.identity
d_identity_1292 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_1292 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1160
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
            (coe v0)))
-- Data.Bool.Properties._.IsSemiring.isMagma
d_isMagma_1298 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_1298 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1160
            (coe
               MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
               (coe v0))))
-- Data.Bool.Properties._.IsSemiring.*-isMonoid
d_'42''45'isMonoid_1300 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_'42''45'isMonoid_1300 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1160
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
         (coe v0))
-- Data.Bool.Properties._.IsSemiring.isSemigroup
d_isSemigroup_1302 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_1302 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1160
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
            (coe v0)))
-- Data.Bool.Properties._.IsSemiring.assoc
d_assoc_1304 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_1304 = erased
-- Data.Bool.Properties._.IsSemiring.comm
d_comm_1306 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_comm_1306 = erased
-- Data.Bool.Properties._.IsSemiring.∙-cong
d_'8729''45'cong_1308 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_1308 = erased
-- Data.Bool.Properties._.IsSemiring.identity
d_identity_1314 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_1314 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_416
         (coe
            MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
            (coe
               MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
               (coe v0))))
-- Data.Bool.Properties._.IsSemiring.+-isCommutativeMonoid
d_'43''45'isCommutativeMonoid_1322 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406
d_'43''45'isCommutativeMonoid_1322 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
         (coe v0))
-- Data.Bool.Properties._.IsSemiring.isMagma
d_isMagma_1326 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_1326 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_isMonoid_416
            (coe
               MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
               (coe
                  MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
                  (coe v0)))))
-- Data.Bool.Properties._.IsSemiring.isMonoid
d_isMonoid_1328 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_isMonoid_1328 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMonoid_416
      (coe
         MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
            (coe v0)))
-- Data.Bool.Properties._.IsSemiring.isSemigroup
d_isSemigroup_1330 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_1330 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_416
         (coe
            MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
            (coe
               MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
               (coe v0))))
-- Data.Bool.Properties._.IsSemiring.distrib
d_distrib_1332 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_distrib_1332 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_distrib_1162
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
         (coe v0))
-- Data.Bool.Properties._.IsSemiring.isEquivalence
d_isEquivalence_1338 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_1338 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
            (coe
               MAlonzo.Code.Algebra.Structures.d_isMonoid_416
               (coe
                  MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
                  (coe
                     MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
                     (coe v0))))))
-- Data.Bool.Properties._.IsSemiring.isNearSemiring
d_isNearSemiring_1340 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876
d_isNearSemiring_1340 ~v0 ~v1 ~v2 ~v3 v4
  = du_isNearSemiring_1340 v4
du_isNearSemiring_1340 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876
du_isNearSemiring_1340 v0
  = coe
      MAlonzo.Code.Algebra.Structures.du_isNearSemiring_990
      (coe
         MAlonzo.Code.Algebra.Structures.du_isSemiringWithoutOne_1326
         (coe v0))
-- Data.Bool.Properties._.IsSemiring.isSemiringWithoutAnnihilatingZero
d_isSemiringWithoutAnnihilatingZero_1344 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142
d_isSemiringWithoutAnnihilatingZero_1344 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemiringWithoutAnnihilatingZero_1252
      (coe v0)
-- Data.Bool.Properties._.IsSemiring.isSemiringWithoutOne
d_isSemiringWithoutOne_1346 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952
d_isSemiringWithoutOne_1346 v0 v1 v2 v3 v4
  = coe
      MAlonzo.Code.Algebra.Structures.du_isSemiringWithoutOne_1326 v4
-- Data.Bool.Properties._.IsSemiring.zero
d_zero_1358 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_zero_1358 v0
  = coe MAlonzo.Code.Algebra.Structures.d_zero_1254 (coe v0)
-- Data.Bool.Properties._.IsSemiringWithoutAnnihilatingZero.assoc
d_assoc_1366 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_1366 = erased
-- Data.Bool.Properties._.IsSemiringWithoutAnnihilatingZero.∙-cong
d_'8729''45'cong_1368 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_1368 = erased
-- Data.Bool.Properties._.IsSemiringWithoutAnnihilatingZero.identity
d_identity_1374 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_1374 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1160 (coe v0))
-- Data.Bool.Properties._.IsSemiringWithoutAnnihilatingZero.isMagma
d_isMagma_1380 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_1380 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1160 (coe v0)))
-- Data.Bool.Properties._.IsSemiringWithoutAnnihilatingZero.*-isMonoid
d_'42''45'isMonoid_1382 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_'42''45'isMonoid_1382 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1160 (coe v0)
-- Data.Bool.Properties._.IsSemiringWithoutAnnihilatingZero.isSemigroup
d_isSemigroup_1384 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_1384 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_'42''45'isMonoid_1160 (coe v0))
-- Data.Bool.Properties._.IsSemiringWithoutAnnihilatingZero.assoc
d_assoc_1386 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_1386 = erased
-- Data.Bool.Properties._.IsSemiringWithoutAnnihilatingZero.comm
d_comm_1388 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_comm_1388 = erased
-- Data.Bool.Properties._.IsSemiringWithoutAnnihilatingZero.∙-cong
d_'8729''45'cong_1390 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_1390 = erased
-- Data.Bool.Properties._.IsSemiringWithoutAnnihilatingZero.identity
d_identity_1396 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_1396 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_416
         (coe
            MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
            (coe v0)))
-- Data.Bool.Properties._.IsSemiringWithoutAnnihilatingZero.+-isCommutativeMonoid
d_'43''45'isCommutativeMonoid_1404 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142 ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406
d_'43''45'isCommutativeMonoid_1404 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
      (coe v0)
-- Data.Bool.Properties._.IsSemiringWithoutAnnihilatingZero.isMagma
d_isMagma_1408 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_1408 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_isMonoid_416
            (coe
               MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
               (coe v0))))
-- Data.Bool.Properties._.IsSemiringWithoutAnnihilatingZero.isMonoid
d_isMonoid_1410 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_isMonoid_1410 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMonoid_416
      (coe
         MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
         (coe v0))
-- Data.Bool.Properties._.IsSemiringWithoutAnnihilatingZero.isSemigroup
d_isSemigroup_1412 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_1412 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_416
         (coe
            MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
            (coe v0)))
-- Data.Bool.Properties._.IsSemiringWithoutAnnihilatingZero.distrib
d_distrib_1414 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_distrib_1414 v0
  = coe MAlonzo.Code.Algebra.Structures.d_distrib_1162 (coe v0)
-- Data.Bool.Properties._.IsSemiringWithoutAnnihilatingZero.isEquivalence
d_isEquivalence_1420 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutAnnihilatingZero_1142 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_1420 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
            (coe
               MAlonzo.Code.Algebra.Structures.d_isMonoid_416
               (coe
                  MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_1158
                  (coe v0)))))
-- Data.Bool.Properties._.IsSemiringWithoutOne.assoc
d_assoc_1436 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_1436 = erased
-- Data.Bool.Properties._.IsSemiringWithoutOne.∙-cong
d_'8729''45'cong_1438 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_1438 = erased
-- Data.Bool.Properties._.IsSemiringWithoutOne.isMagma
d_isMagma_1444 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_1444 ~v0 ~v1 ~v2 v3 = du_isMagma_1444 v3
du_isMagma_1444 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
du_isMagma_1444 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_'42''45'isSemigroup_970 (coe v0))
-- Data.Bool.Properties._.IsSemiringWithoutOne.*-isSemigroup
d_'42''45'isSemigroup_1446 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_'42''45'isSemigroup_1446 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'42''45'isSemigroup_970 (coe v0)
-- Data.Bool.Properties._.IsSemiringWithoutOne.assoc
d_assoc_1448 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_assoc_1448 = erased
-- Data.Bool.Properties._.IsSemiringWithoutOne.comm
d_comm_1450 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_comm_1450 = erased
-- Data.Bool.Properties._.IsSemiringWithoutOne.∙-cong
d_'8729''45'cong_1452 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  Bool ->
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8729''45'cong_1452 = erased
-- Data.Bool.Properties._.IsSemiringWithoutOne.identity
d_identity_1458 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_identity_1458 ~v0 ~v1 ~v2 v3 = du_identity_1458 v3
du_identity_1458 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
du_identity_1458 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_identity_370
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_416
         (coe
            MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_968
            (coe v0)))
-- Data.Bool.Properties._.IsSemiringWithoutOne.+-isCommutativeMonoid
d_'43''45'isCommutativeMonoid_1466 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406
d_'43''45'isCommutativeMonoid_1466 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_968
      (coe v0)
-- Data.Bool.Properties._.IsSemiringWithoutOne.isMagma
d_isMagma_1470 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_isMagma_1470 ~v0 ~v1 ~v2 v3 = du_isMagma_1470 v3
du_isMagma_1470 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
du_isMagma_1470 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMagma_202
      (coe
         MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
         (coe
            MAlonzo.Code.Algebra.Structures.d_isMonoid_416
            (coe
               MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_968
               (coe v0))))
-- Data.Bool.Properties._.IsSemiringWithoutOne.isMonoid
d_isMonoid_1472 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_isMonoid_1472 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isMonoid_416
      (coe
         MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_968
         (coe v0))
-- Data.Bool.Properties._.IsSemiringWithoutOne.isSemigroup
d_isSemigroup_1474 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_isSemigroup_1474 ~v0 ~v1 ~v2 v3 = du_isSemigroup_1474 v3
du_isSemigroup_1474 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
du_isSemigroup_1474 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMonoid_416
         (coe
            MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_968
            (coe v0)))
-- Data.Bool.Properties._.IsSemiringWithoutOne.distrib
d_distrib_1476 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_distrib_1476 v0
  = coe MAlonzo.Code.Algebra.Structures.d_distrib_972 (coe v0)
-- Data.Bool.Properties._.IsSemiringWithoutOne.distribʳ
d_distrib'691'_1478 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_distrib'691'_1478 = erased
-- Data.Bool.Properties._.IsSemiringWithoutOne.isEquivalence
d_isEquivalence_1480 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
d_isEquivalence_1480 ~v0 ~v1 ~v2 v3 = du_isEquivalence_1480 v3
du_isEquivalence_1480 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  MAlonzo.Code.Relation.Binary.Structures.T_IsEquivalence_26
du_isEquivalence_1480 v0
  = coe
      MAlonzo.Code.Algebra.Structures.d_isEquivalence_94
      (coe
         MAlonzo.Code.Algebra.Structures.d_isMagma_202
         (coe
            MAlonzo.Code.Algebra.Structures.d_isSemigroup_368
            (coe
               MAlonzo.Code.Algebra.Structures.d_isMonoid_416
               (coe
                  MAlonzo.Code.Algebra.Structures.d_'43''45'isCommutativeMonoid_968
                  (coe v0)))))
-- Data.Bool.Properties._.IsSemiringWithoutOne.isNearSemiring
d_isNearSemiring_1482 ::
  (Bool -> Bool -> Bool) ->
  (Bool -> Bool -> Bool) ->
  Bool ->
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  MAlonzo.Code.Algebra.Structures.T_IsNearSemiring_876
d_isNearSemiring_1482 v0 v1 v2 v3
  = coe MAlonzo.Code.Algebra.Structures.du_isNearSemiring_990 v3
-- Data.Bool.Properties._.IsSemiringWithoutOne.zero
d_zero_1496 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiringWithoutOne_952 ->
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_zero_1496 v0
  = coe MAlonzo.Code.Algebra.Structures.d_zero_974 (coe v0)
-- Data.Bool.Properties._≟_
d__'8799'__1510 ::
  Bool -> Bool -> MAlonzo.Code.Relation.Nullary.T_Dec_32
d__'8799'__1510 v0 v1
  = if coe v0
      then if coe v1
             then coe
                    MAlonzo.Code.Relation.Nullary.C__because__46 (coe v1)
                    (coe MAlonzo.Code.Relation.Nullary.C_of'696'_22 erased)
             else coe
                    MAlonzo.Code.Relation.Nullary.C__because__46 (coe v1)
                    (coe MAlonzo.Code.Relation.Nullary.C_of'8319'_26)
      else (if coe v1
              then coe
                     MAlonzo.Code.Relation.Nullary.C__because__46 (coe v0)
                     (coe MAlonzo.Code.Relation.Nullary.C_of'8319'_26)
              else coe
                     MAlonzo.Code.Relation.Nullary.C__because__46
                     (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
                     (coe MAlonzo.Code.Relation.Nullary.C_of'696'_22 erased))
-- Data.Bool.Properties.≡-setoid
d_'8801''45'setoid_1512 ::
  MAlonzo.Code.Relation.Binary.Bundles.T_Setoid_44
d_'8801''45'setoid_1512
  = coe
      MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du_setoid_250
-- Data.Bool.Properties.≡-decSetoid
d_'8801''45'decSetoid_1514 ::
  MAlonzo.Code.Relation.Binary.Bundles.T_DecSetoid_84
d_'8801''45'decSetoid_1514
  = coe
      MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du_decSetoid_254
      (coe d__'8799'__1510)
-- Data.Bool.Properties.≤-reflexive
d_'8804''45'reflexive_1516 ::
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Data.Bool.Base.T__'8804'__10
d_'8804''45'reflexive_1516 ~v0 ~v1 ~v2
  = du_'8804''45'reflexive_1516
du_'8804''45'reflexive_1516 ::
  MAlonzo.Code.Data.Bool.Base.T__'8804'__10
du_'8804''45'reflexive_1516
  = coe MAlonzo.Code.Data.Bool.Base.C_b'8804'b_16
-- Data.Bool.Properties.≤-refl
d_'8804''45'refl_1518 ::
  Bool -> MAlonzo.Code.Data.Bool.Base.T__'8804'__10
d_'8804''45'refl_1518 ~v0 = du_'8804''45'refl_1518
du_'8804''45'refl_1518 :: MAlonzo.Code.Data.Bool.Base.T__'8804'__10
du_'8804''45'refl_1518 = coe du_'8804''45'reflexive_1516
-- Data.Bool.Properties.≤-trans
d_'8804''45'trans_1520 ::
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Data.Bool.Base.T__'8804'__10 ->
  MAlonzo.Code.Data.Bool.Base.T__'8804'__10 ->
  MAlonzo.Code.Data.Bool.Base.T__'8804'__10
d_'8804''45'trans_1520 ~v0 ~v1 ~v2 v3 v4
  = du_'8804''45'trans_1520 v3 v4
du_'8804''45'trans_1520 ::
  MAlonzo.Code.Data.Bool.Base.T__'8804'__10 ->
  MAlonzo.Code.Data.Bool.Base.T__'8804'__10 ->
  MAlonzo.Code.Data.Bool.Base.T__'8804'__10
du_'8804''45'trans_1520 v0 v1
  = case coe v0 of
      MAlonzo.Code.Data.Bool.Base.C_f'8804't_12
        -> coe seq (coe v1) (coe v0)
      MAlonzo.Code.Data.Bool.Base.C_b'8804'b_16 -> coe v1
      _ -> MAlonzo.RTE.mazUnreachableError
-- Data.Bool.Properties.≤-antisym
d_'8804''45'antisym_1524 ::
  Bool ->
  Bool ->
  MAlonzo.Code.Data.Bool.Base.T__'8804'__10 ->
  MAlonzo.Code.Data.Bool.Base.T__'8804'__10 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8804''45'antisym_1524 = erased
-- Data.Bool.Properties.≤-minimum
d_'8804''45'minimum_1526 ::
  Bool -> MAlonzo.Code.Data.Bool.Base.T__'8804'__10
d_'8804''45'minimum_1526 v0
  = if coe v0
      then coe MAlonzo.Code.Data.Bool.Base.C_f'8804't_12
      else coe MAlonzo.Code.Data.Bool.Base.C_b'8804'b_16
-- Data.Bool.Properties.≤-maximum
d_'8804''45'maximum_1528 ::
  Bool -> MAlonzo.Code.Data.Bool.Base.T__'8804'__10
d_'8804''45'maximum_1528 v0
  = if coe v0
      then coe MAlonzo.Code.Data.Bool.Base.C_b'8804'b_16
      else coe MAlonzo.Code.Data.Bool.Base.C_f'8804't_12
-- Data.Bool.Properties.≤-total
d_'8804''45'total_1530 ::
  Bool -> Bool -> MAlonzo.Code.Data.Sum.Base.T__'8846'__30
d_'8804''45'total_1530 v0 v1
  = if coe v0
      then coe
             MAlonzo.Code.Data.Sum.Base.C_inj'8322'_42
             (coe d_'8804''45'maximum_1528 (coe v1))
      else coe
             MAlonzo.Code.Data.Sum.Base.C_inj'8321'_38
             (coe d_'8804''45'minimum_1526 (coe v1))
-- Data.Bool.Properties._≤?_
d__'8804''63'__1536 ::
  Bool -> Bool -> MAlonzo.Code.Relation.Nullary.T_Dec_32
d__'8804''63'__1536 v0 v1
  = if coe v0
      then if coe v1
             then coe
                    MAlonzo.Code.Relation.Nullary.C__because__46 (coe v1)
                    (coe
                       MAlonzo.Code.Relation.Nullary.C_of'696'_22
                       (coe MAlonzo.Code.Data.Bool.Base.C_b'8804'b_16))
             else coe
                    MAlonzo.Code.Relation.Nullary.C__because__46 (coe v1)
                    (coe MAlonzo.Code.Relation.Nullary.C_of'8319'_26)
      else coe
             MAlonzo.Code.Relation.Nullary.C__because__46
             (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
             (coe
                MAlonzo.Code.Relation.Nullary.C_of'696'_22
                (coe d_'8804''45'minimum_1526 (coe v1)))
-- Data.Bool.Properties.≤-irrelevant
d_'8804''45'irrelevant_1540 ::
  Bool ->
  Bool ->
  MAlonzo.Code.Data.Bool.Base.T__'8804'__10 ->
  MAlonzo.Code.Data.Bool.Base.T__'8804'__10 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8804''45'irrelevant_1540 = erased
-- Data.Bool.Properties.≤-isPreorder
d_'8804''45'isPreorder_1542 ::
  MAlonzo.Code.Relation.Binary.Structures.T_IsPreorder_70
d_'8804''45'isPreorder_1542
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C_IsPreorder'46'constructor_3993
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du_isEquivalence_242)
      (\ v0 v1 v2 -> coe du_'8804''45'reflexive_1516)
      (\ v0 v1 v2 v3 v4 -> coe du_'8804''45'trans_1520 v3 v4)
-- Data.Bool.Properties.≤-isPartialOrder
d_'8804''45'isPartialOrder_1544 ::
  MAlonzo.Code.Relation.Binary.Structures.T_IsPartialOrder_162
d_'8804''45'isPartialOrder_1544
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C_IsPartialOrder'46'constructor_9297
      (coe d_'8804''45'isPreorder_1542) erased
-- Data.Bool.Properties.≤-isTotalOrder
d_'8804''45'isTotalOrder_1546 ::
  MAlonzo.Code.Relation.Binary.Structures.T_IsTotalOrder_384
d_'8804''45'isTotalOrder_1546
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C_IsTotalOrder'46'constructor_19815
      (coe d_'8804''45'isPartialOrder_1544) (coe d_'8804''45'total_1530)
-- Data.Bool.Properties.≤-isDecTotalOrder
d_'8804''45'isDecTotalOrder_1548 ::
  MAlonzo.Code.Relation.Binary.Structures.T_IsDecTotalOrder_434
d_'8804''45'isDecTotalOrder_1548
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C_IsDecTotalOrder'46'constructor_21785
      (coe d_'8804''45'isTotalOrder_1546) (coe d__'8799'__1510)
      (coe d__'8804''63'__1536)
-- Data.Bool.Properties.≤-poset
d_'8804''45'poset_1550 ::
  MAlonzo.Code.Relation.Binary.Bundles.T_Poset_282
d_'8804''45'poset_1550
  = coe
      MAlonzo.Code.Relation.Binary.Bundles.C_Poset'46'constructor_5189
      d_'8804''45'isPartialOrder_1544
-- Data.Bool.Properties.≤-preorder
d_'8804''45'preorder_1552 ::
  MAlonzo.Code.Relation.Binary.Bundles.T_Preorder_132
d_'8804''45'preorder_1552
  = coe
      MAlonzo.Code.Relation.Binary.Bundles.C_Preorder'46'constructor_2251
      d_'8804''45'isPreorder_1542
-- Data.Bool.Properties.≤-totalOrder
d_'8804''45'totalOrder_1554 ::
  MAlonzo.Code.Relation.Binary.Bundles.T_TotalOrder_652
d_'8804''45'totalOrder_1554
  = coe
      MAlonzo.Code.Relation.Binary.Bundles.C_TotalOrder'46'constructor_12435
      d_'8804''45'isTotalOrder_1546
-- Data.Bool.Properties.≤-decTotalOrder
d_'8804''45'decTotalOrder_1556 ::
  MAlonzo.Code.Relation.Binary.Bundles.T_DecTotalOrder_740
d_'8804''45'decTotalOrder_1556
  = coe
      MAlonzo.Code.Relation.Binary.Bundles.C_DecTotalOrder'46'constructor_14277
      d_'8804''45'isDecTotalOrder_1548
-- Data.Bool.Properties.<-irrefl
d_'60''45'irrefl_1558 ::
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Data.Bool.Base.T__'60'__18 ->
  MAlonzo.Code.Data.Empty.T_'8869'_4
d_'60''45'irrefl_1558 = erased
-- Data.Bool.Properties.<-asym
d_'60''45'asym_1560 ::
  Bool ->
  Bool ->
  MAlonzo.Code.Data.Bool.Base.T__'60'__18 ->
  MAlonzo.Code.Data.Bool.Base.T__'60'__18 ->
  MAlonzo.Code.Data.Empty.T_'8869'_4
d_'60''45'asym_1560 = erased
-- Data.Bool.Properties.<-trans
d_'60''45'trans_1562 ::
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Data.Bool.Base.T__'60'__18 ->
  MAlonzo.Code.Data.Bool.Base.T__'60'__18 ->
  MAlonzo.Code.Data.Bool.Base.T__'60'__18
d_'60''45'trans_1562 = erased
-- Data.Bool.Properties.<-transʳ
d_'60''45'trans'691'_1564 ::
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Data.Bool.Base.T__'8804'__10 ->
  MAlonzo.Code.Data.Bool.Base.T__'60'__18 ->
  MAlonzo.Code.Data.Bool.Base.T__'60'__18
d_'60''45'trans'691'_1564 = erased
-- Data.Bool.Properties.<-transˡ
d_'60''45'trans'737'_1566 ::
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Data.Bool.Base.T__'60'__18 ->
  MAlonzo.Code.Data.Bool.Base.T__'8804'__10 ->
  MAlonzo.Code.Data.Bool.Base.T__'60'__18
d_'60''45'trans'737'_1566 = erased
-- Data.Bool.Properties.<-cmp
d_'60''45'cmp_1568 ::
  Bool -> Bool -> MAlonzo.Code.Relation.Binary.Definitions.T_Tri_136
d_'60''45'cmp_1568 v0 v1
  = if coe v0
      then if coe v1
             then coe
                    MAlonzo.Code.Relation.Binary.Definitions.C_tri'8776'_158 erased
             else coe
                    MAlonzo.Code.Relation.Binary.Definitions.C_tri'62'_166 erased
      else (if coe v1
              then coe
                     MAlonzo.Code.Relation.Binary.Definitions.C_tri'60'_150 erased
              else coe
                     MAlonzo.Code.Relation.Binary.Definitions.C_tri'8776'_158 erased)
-- Data.Bool.Properties._<?_
d__'60''63'__1570 ::
  Bool -> Bool -> MAlonzo.Code.Relation.Nullary.T_Dec_32
d__'60''63'__1570 v0 v1
  = if coe v0
      then coe
             MAlonzo.Code.Relation.Nullary.C__because__46
             (coe MAlonzo.Code.Agda.Builtin.Bool.C_false_8)
             (coe MAlonzo.Code.Relation.Nullary.C_of'8319'_26)
      else (if coe v1
              then coe
                     MAlonzo.Code.Relation.Nullary.C__because__46 (coe v1)
                     (coe MAlonzo.Code.Relation.Nullary.C_of'696'_22 erased)
              else coe
                     MAlonzo.Code.Relation.Nullary.C__because__46 (coe v1)
                     (coe MAlonzo.Code.Relation.Nullary.C_of'8319'_26))
-- Data.Bool.Properties.<-resp₂-≡
d_'60''45'resp'8322''45''8801'_1572 ::
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_'60''45'resp'8322''45''8801'_1572
  = coe
      MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
      (coe (\ v0 v1 v2 v3 v4 -> v4)) (coe (\ v0 v1 v2 v3 v4 -> v4))
-- Data.Bool.Properties.<-irrelevant
d_'60''45'irrelevant_1578 ::
  Bool ->
  Bool ->
  MAlonzo.Code.Data.Bool.Base.T__'60'__18 ->
  MAlonzo.Code.Data.Bool.Base.T__'60'__18 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'60''45'irrelevant_1578 = erased
-- Data.Bool.Properties.<-isStrictPartialOrder
d_'60''45'isStrictPartialOrder_1580 ::
  MAlonzo.Code.Relation.Binary.Structures.T_IsStrictPartialOrder_266
d_'60''45'isStrictPartialOrder_1580
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C_IsStrictPartialOrder'46'constructor_13145
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du_isEquivalence_242)
      erased d_'60''45'resp'8322''45''8801'_1572
-- Data.Bool.Properties.<-isStrictTotalOrder
d_'60''45'isStrictTotalOrder_1582 ::
  MAlonzo.Code.Relation.Binary.Structures.T_IsStrictTotalOrder_502
d_'60''45'isStrictTotalOrder_1582
  = coe
      MAlonzo.Code.Relation.Binary.Structures.C_IsStrictTotalOrder'46'constructor_23999
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du_isEquivalence_242)
      erased (coe d_'60''45'cmp_1568)
-- Data.Bool.Properties.<-strictPartialOrder
d_'60''45'strictPartialOrder_1584 ::
  MAlonzo.Code.Relation.Binary.Bundles.T_StrictPartialOrder_472
d_'60''45'strictPartialOrder_1584
  = coe
      MAlonzo.Code.Relation.Binary.Bundles.C_StrictPartialOrder'46'constructor_8915
      d_'60''45'isStrictPartialOrder_1580
-- Data.Bool.Properties.<-strictTotalOrder
d_'60''45'strictTotalOrder_1586 ::
  MAlonzo.Code.Relation.Binary.Bundles.T_StrictTotalOrder_864
d_'60''45'strictTotalOrder_1586
  = coe
      MAlonzo.Code.Relation.Binary.Bundles.C_StrictTotalOrder'46'constructor_16673
      d_'60''45'isStrictTotalOrder_1582
-- Data.Bool.Properties.∨-assoc
d_'8744''45'assoc_1588 ::
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'assoc_1588 = erased
-- Data.Bool.Properties.∨-comm
d_'8744''45'comm_1598 ::
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'comm_1598 = erased
-- Data.Bool.Properties.∨-identityˡ
d_'8744''45'identity'737'_1600 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'identity'737'_1600 = erased
-- Data.Bool.Properties.∨-identityʳ
d_'8744''45'identity'691'_1602 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'identity'691'_1602 = erased
-- Data.Bool.Properties.∨-identity
d_'8744''45'identity_1604 :: MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_'8744''45'identity_1604
  = coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 erased erased
-- Data.Bool.Properties.∨-zeroˡ
d_'8744''45'zero'737'_1606 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'zero'737'_1606 = erased
-- Data.Bool.Properties.∨-zeroʳ
d_'8744''45'zero'691'_1608 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'zero'691'_1608 = erased
-- Data.Bool.Properties.∨-zero
d_'8744''45'zero_1610 :: MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_'8744''45'zero_1610
  = coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 erased erased
-- Data.Bool.Properties.∨-inverseˡ
d_'8744''45'inverse'737'_1612 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'inverse'737'_1612 = erased
-- Data.Bool.Properties.∨-inverseʳ
d_'8744''45'inverse'691'_1614 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'inverse'691'_1614 = erased
-- Data.Bool.Properties.∨-inverse
d_'8744''45'inverse_1618 :: MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_'8744''45'inverse_1618
  = coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 erased erased
-- Data.Bool.Properties.∨-idem
d_'8744''45'idem_1620 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'idem_1620 = erased
-- Data.Bool.Properties.∨-sel
d_'8744''45'sel_1622 ::
  Bool -> Bool -> MAlonzo.Code.Data.Sum.Base.T__'8846'__30
d_'8744''45'sel_1622 v0 ~v1 = du_'8744''45'sel_1622 v0
du_'8744''45'sel_1622 ::
  Bool -> MAlonzo.Code.Data.Sum.Base.T__'8846'__30
du_'8744''45'sel_1622 v0
  = if coe v0
      then coe MAlonzo.Code.Data.Sum.Base.C_inj'8321'_38 erased
      else coe MAlonzo.Code.Data.Sum.Base.C_inj'8322'_42 erased
-- Data.Bool.Properties.∨-isMagma
d_'8744''45'isMagma_1628 ::
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_'8744''45'isMagma_1628
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsMagma'46'constructor_553
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du_isEquivalence_242)
      erased
-- Data.Bool.Properties.∨-magma
d_'8744''45'magma_1630 :: MAlonzo.Code.Algebra.Bundles.T_Magma_36
d_'8744''45'magma_1630
  = coe
      MAlonzo.Code.Algebra.Bundles.C_Magma'46'constructor_573
      MAlonzo.Code.Data.Bool.Base.d__'8744'__30 d_'8744''45'isMagma_1628
-- Data.Bool.Properties.∨-isSemigroup
d_'8744''45'isSemigroup_1632 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_'8744''45'isSemigroup_1632
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsSemigroup'46'constructor_4001
      (coe d_'8744''45'isMagma_1628) erased
-- Data.Bool.Properties.∨-semigroup
d_'8744''45'semigroup_1634 ::
  MAlonzo.Code.Algebra.Bundles.T_Semigroup_206
d_'8744''45'semigroup_1634
  = coe
      MAlonzo.Code.Algebra.Bundles.C_Semigroup'46'constructor_3643
      MAlonzo.Code.Data.Bool.Base.d__'8744'__30
      d_'8744''45'isSemigroup_1632
-- Data.Bool.Properties.∨-isBand
d_'8744''45'isBand_1636 ::
  MAlonzo.Code.Algebra.Structures.T_IsBand_230
d_'8744''45'isBand_1636
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsBand'46'constructor_4787
      (coe d_'8744''45'isSemigroup_1632) erased
-- Data.Bool.Properties.∨-band
d_'8744''45'band_1638 :: MAlonzo.Code.Algebra.Bundles.T_Band_266
d_'8744''45'band_1638
  = coe
      MAlonzo.Code.Algebra.Bundles.C_Band'46'constructor_4713
      MAlonzo.Code.Data.Bool.Base.d__'8744'__30 d_'8744''45'isBand_1636
-- Data.Bool.Properties.∨-isSemilattice
d_'8744''45'isSemilattice_1640 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemilattice_312
d_'8744''45'isSemilattice_1640
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsSemilattice'46'constructor_6687
      (coe d_'8744''45'isBand_1636) erased
-- Data.Bool.Properties.∨-semilattice
d_'8744''45'semilattice_1642 ::
  MAlonzo.Code.Algebra.Bundles.T_Semilattice_402
d_'8744''45'semilattice_1642
  = coe
      MAlonzo.Code.Algebra.Bundles.C_Semilattice'46'constructor_7161
      MAlonzo.Code.Data.Bool.Base.d__'8744'__30
      d_'8744''45'isSemilattice_1640
-- Data.Bool.Properties.∨-isMonoid
d_'8744''45'isMonoid_1644 ::
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_'8744''45'isMonoid_1644
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsMonoid'46'constructor_7687
      (coe d_'8744''45'isSemigroup_1632) (coe d_'8744''45'identity_1604)
-- Data.Bool.Properties.∨-isCommutativeMonoid
d_'8744''45'isCommutativeMonoid_1646 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406
d_'8744''45'isCommutativeMonoid_1646
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsCommutativeMonoid'46'constructor_9361
      (coe d_'8744''45'isMonoid_1644) erased
-- Data.Bool.Properties.∨-commutativeMonoid
d_'8744''45'commutativeMonoid_1648 ::
  MAlonzo.Code.Algebra.Bundles.T_CommutativeMonoid_582
d_'8744''45'commutativeMonoid_1648
  = coe
      MAlonzo.Code.Algebra.Bundles.C_CommutativeMonoid'46'constructor_10281
      MAlonzo.Code.Data.Bool.Base.d__'8744'__30
      (coe MAlonzo.Code.Agda.Builtin.Bool.C_false_8)
      d_'8744''45'isCommutativeMonoid_1646
-- Data.Bool.Properties.∨-isIdempotentCommutativeMonoid
d_'8744''45'isIdempotentCommutativeMonoid_1650 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464
d_'8744''45'isIdempotentCommutativeMonoid_1650
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsIdempotentCommutativeMonoid'46'constructor_10859
      (coe d_'8744''45'isCommutativeMonoid_1646) erased
-- Data.Bool.Properties.∨-idempotentCommutativeMonoid
d_'8744''45'idempotentCommutativeMonoid_1652 ::
  MAlonzo.Code.Algebra.Bundles.T_IdempotentCommutativeMonoid_674
d_'8744''45'idempotentCommutativeMonoid_1652
  = coe
      MAlonzo.Code.Algebra.Bundles.C_IdempotentCommutativeMonoid'46'constructor_12039
      MAlonzo.Code.Data.Bool.Base.d__'8744'__30
      (coe MAlonzo.Code.Agda.Builtin.Bool.C_false_8)
      d_'8744''45'isIdempotentCommutativeMonoid_1650
-- Data.Bool.Properties.∧-assoc
d_'8743''45'assoc_1654 ::
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'assoc_1654 = erased
-- Data.Bool.Properties.∧-comm
d_'8743''45'comm_1664 ::
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'comm_1664 = erased
-- Data.Bool.Properties.∧-identityˡ
d_'8743''45'identity'737'_1666 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'identity'737'_1666 = erased
-- Data.Bool.Properties.∧-identityʳ
d_'8743''45'identity'691'_1668 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'identity'691'_1668 = erased
-- Data.Bool.Properties.∧-identity
d_'8743''45'identity_1670 :: MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_'8743''45'identity_1670
  = coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 erased erased
-- Data.Bool.Properties.∧-zeroˡ
d_'8743''45'zero'737'_1672 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'zero'737'_1672 = erased
-- Data.Bool.Properties.∧-zeroʳ
d_'8743''45'zero'691'_1674 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'zero'691'_1674 = erased
-- Data.Bool.Properties.∧-zero
d_'8743''45'zero_1676 :: MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_'8743''45'zero_1676
  = coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 erased erased
-- Data.Bool.Properties.∧-inverseˡ
d_'8743''45'inverse'737'_1678 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'inverse'737'_1678 = erased
-- Data.Bool.Properties.∧-inverseʳ
d_'8743''45'inverse'691'_1680 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'inverse'691'_1680 = erased
-- Data.Bool.Properties.∧-inverse
d_'8743''45'inverse_1684 :: MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_'8743''45'inverse_1684
  = coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 erased erased
-- Data.Bool.Properties.∧-idem
d_'8743''45'idem_1686 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'idem_1686 = erased
-- Data.Bool.Properties.∧-sel
d_'8743''45'sel_1688 ::
  Bool -> Bool -> MAlonzo.Code.Data.Sum.Base.T__'8846'__30
d_'8743''45'sel_1688 v0 ~v1 = du_'8743''45'sel_1688 v0
du_'8743''45'sel_1688 ::
  Bool -> MAlonzo.Code.Data.Sum.Base.T__'8846'__30
du_'8743''45'sel_1688 v0
  = if coe v0
      then coe MAlonzo.Code.Data.Sum.Base.C_inj'8322'_42 erased
      else coe MAlonzo.Code.Data.Sum.Base.C_inj'8321'_38 erased
-- Data.Bool.Properties.∧-distribˡ-∨
d_'8743''45'distrib'737''45''8744'_1694 ::
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'distrib'737''45''8744'_1694 = erased
-- Data.Bool.Properties.∧-distribʳ-∨
d_'8743''45'distrib'691''45''8744'_1704 ::
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'distrib'691''45''8744'_1704 = erased
-- Data.Bool.Properties.∧-distrib-∨
d_'8743''45'distrib'45''8744'_1712 ::
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_'8743''45'distrib'45''8744'_1712
  = coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 erased erased
-- Data.Bool.Properties.∨-distribˡ-∧
d_'8744''45'distrib'737''45''8743'_1714 ::
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'distrib'737''45''8743'_1714 = erased
-- Data.Bool.Properties.∨-distribʳ-∧
d_'8744''45'distrib'691''45''8743'_1724 ::
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'distrib'691''45''8743'_1724 = erased
-- Data.Bool.Properties.∨-distrib-∧
d_'8744''45'distrib'45''8743'_1732 ::
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_'8744''45'distrib'45''8743'_1732
  = coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 erased erased
-- Data.Bool.Properties.∧-abs-∨
d_'8743''45'abs'45''8744'_1734 ::
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45'abs'45''8744'_1734 = erased
-- Data.Bool.Properties.∨-abs-∧
d_'8744''45'abs'45''8743'_1740 ::
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45'abs'45''8743'_1740 = erased
-- Data.Bool.Properties.∨-∧-absorptive
d_'8744''45''8743''45'absorptive_1746 ::
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_'8744''45''8743''45'absorptive_1746
  = coe MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32 erased erased
-- Data.Bool.Properties.∧-isMagma
d_'8743''45'isMagma_1748 ::
  MAlonzo.Code.Algebra.Structures.T_IsMagma_86
d_'8743''45'isMagma_1748
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsMagma'46'constructor_553
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du_isEquivalence_242)
      erased
-- Data.Bool.Properties.∧-magma
d_'8743''45'magma_1750 :: MAlonzo.Code.Algebra.Bundles.T_Magma_36
d_'8743''45'magma_1750
  = coe
      MAlonzo.Code.Algebra.Bundles.C_Magma'46'constructor_573
      MAlonzo.Code.Data.Bool.Base.d__'8743'__24 d_'8743''45'isMagma_1748
-- Data.Bool.Properties.∧-isSemigroup
d_'8743''45'isSemigroup_1752 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemigroup_194
d_'8743''45'isSemigroup_1752
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsSemigroup'46'constructor_4001
      (coe d_'8743''45'isMagma_1748) erased
-- Data.Bool.Properties.∧-semigroup
d_'8743''45'semigroup_1754 ::
  MAlonzo.Code.Algebra.Bundles.T_Semigroup_206
d_'8743''45'semigroup_1754
  = coe
      MAlonzo.Code.Algebra.Bundles.C_Semigroup'46'constructor_3643
      MAlonzo.Code.Data.Bool.Base.d__'8743'__24
      d_'8743''45'isSemigroup_1752
-- Data.Bool.Properties.∧-isBand
d_'8743''45'isBand_1756 ::
  MAlonzo.Code.Algebra.Structures.T_IsBand_230
d_'8743''45'isBand_1756
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsBand'46'constructor_4787
      (coe d_'8743''45'isSemigroup_1752) erased
-- Data.Bool.Properties.∧-band
d_'8743''45'band_1758 :: MAlonzo.Code.Algebra.Bundles.T_Band_266
d_'8743''45'band_1758
  = coe
      MAlonzo.Code.Algebra.Bundles.C_Band'46'constructor_4713
      MAlonzo.Code.Data.Bool.Base.d__'8743'__24 d_'8743''45'isBand_1756
-- Data.Bool.Properties.∧-isSemilattice
d_'8743''45'isSemilattice_1760 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemilattice_312
d_'8743''45'isSemilattice_1760
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsSemilattice'46'constructor_6687
      (coe d_'8743''45'isBand_1756) erased
-- Data.Bool.Properties.∧-semilattice
d_'8743''45'semilattice_1762 ::
  MAlonzo.Code.Algebra.Bundles.T_Semilattice_402
d_'8743''45'semilattice_1762
  = coe
      MAlonzo.Code.Algebra.Bundles.C_Semilattice'46'constructor_7161
      MAlonzo.Code.Data.Bool.Base.d__'8743'__24
      d_'8743''45'isSemilattice_1760
-- Data.Bool.Properties.∧-isMonoid
d_'8743''45'isMonoid_1764 ::
  MAlonzo.Code.Algebra.Structures.T_IsMonoid_358
d_'8743''45'isMonoid_1764
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsMonoid'46'constructor_7687
      (coe d_'8743''45'isSemigroup_1752) (coe d_'8743''45'identity_1670)
-- Data.Bool.Properties.∧-isCommutativeMonoid
d_'8743''45'isCommutativeMonoid_1766 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeMonoid_406
d_'8743''45'isCommutativeMonoid_1766
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsCommutativeMonoid'46'constructor_9361
      (coe d_'8743''45'isMonoid_1764) erased
-- Data.Bool.Properties.∧-commutativeMonoid
d_'8743''45'commutativeMonoid_1768 ::
  MAlonzo.Code.Algebra.Bundles.T_CommutativeMonoid_582
d_'8743''45'commutativeMonoid_1768
  = coe
      MAlonzo.Code.Algebra.Bundles.C_CommutativeMonoid'46'constructor_10281
      MAlonzo.Code.Data.Bool.Base.d__'8743'__24
      (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
      d_'8743''45'isCommutativeMonoid_1766
-- Data.Bool.Properties.∧-isIdempotentCommutativeMonoid
d_'8743''45'isIdempotentCommutativeMonoid_1770 ::
  MAlonzo.Code.Algebra.Structures.T_IsIdempotentCommutativeMonoid_464
d_'8743''45'isIdempotentCommutativeMonoid_1770
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsIdempotentCommutativeMonoid'46'constructor_10859
      (coe d_'8743''45'isCommutativeMonoid_1766) erased
-- Data.Bool.Properties.∧-idempotentCommutativeMonoid
d_'8743''45'idempotentCommutativeMonoid_1772 ::
  MAlonzo.Code.Algebra.Bundles.T_IdempotentCommutativeMonoid_674
d_'8743''45'idempotentCommutativeMonoid_1772
  = coe
      MAlonzo.Code.Algebra.Bundles.C_IdempotentCommutativeMonoid'46'constructor_12039
      MAlonzo.Code.Data.Bool.Base.d__'8743'__24
      (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
      d_'8743''45'isIdempotentCommutativeMonoid_1770
-- Data.Bool.Properties.∨-∧-isSemiring
d_'8744''45''8743''45'isSemiring_1774 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238
d_'8744''45''8743''45'isSemiring_1774
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsSemiring'46'constructor_37205
      (coe
         MAlonzo.Code.Algebra.Structures.C_IsSemiringWithoutAnnihilatingZero'46'constructor_33695
         (coe d_'8744''45'isCommutativeMonoid_1646)
         (coe d_'8743''45'isMonoid_1764)
         (coe d_'8743''45'distrib'45''8744'_1712))
      (coe d_'8743''45'zero_1676)
-- Data.Bool.Properties.∨-∧-isCommutativeSemiring
d_'8744''45''8743''45'isCommutativeSemiring_1776 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344
d_'8744''45''8743''45'isCommutativeSemiring_1776
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsCommutativeSemiring'46'constructor_40667
      (coe d_'8744''45''8743''45'isSemiring_1774) erased
-- Data.Bool.Properties.∨-∧-commutativeSemiring
d_'8744''45''8743''45'commutativeSemiring_1778 ::
  MAlonzo.Code.Algebra.Bundles.T_CommutativeSemiring_2094
d_'8744''45''8743''45'commutativeSemiring_1778
  = coe
      MAlonzo.Code.Algebra.Bundles.C_CommutativeSemiring'46'constructor_36333
      MAlonzo.Code.Data.Bool.Base.d__'8744'__30
      MAlonzo.Code.Data.Bool.Base.d__'8743'__24
      (coe MAlonzo.Code.Agda.Builtin.Bool.C_false_8)
      (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
      d_'8744''45''8743''45'isCommutativeSemiring_1776
-- Data.Bool.Properties.∧-∨-isSemiring
d_'8743''45''8744''45'isSemiring_1780 ::
  MAlonzo.Code.Algebra.Structures.T_IsSemiring_1238
d_'8743''45''8744''45'isSemiring_1780
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsSemiring'46'constructor_37205
      (coe
         MAlonzo.Code.Algebra.Structures.C_IsSemiringWithoutAnnihilatingZero'46'constructor_33695
         (coe d_'8743''45'isCommutativeMonoid_1766)
         (coe d_'8744''45'isMonoid_1644)
         (coe d_'8744''45'distrib'45''8743'_1732))
      (coe d_'8744''45'zero_1610)
-- Data.Bool.Properties.∧-∨-isCommutativeSemiring
d_'8743''45''8744''45'isCommutativeSemiring_1782 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344
d_'8743''45''8744''45'isCommutativeSemiring_1782
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsCommutativeSemiring'46'constructor_40667
      (coe d_'8743''45''8744''45'isSemiring_1780) erased
-- Data.Bool.Properties.∧-∨-commutativeSemiring
d_'8743''45''8744''45'commutativeSemiring_1784 ::
  MAlonzo.Code.Algebra.Bundles.T_CommutativeSemiring_2094
d_'8743''45''8744''45'commutativeSemiring_1784
  = coe
      MAlonzo.Code.Algebra.Bundles.C_CommutativeSemiring'46'constructor_36333
      MAlonzo.Code.Data.Bool.Base.d__'8743'__24
      MAlonzo.Code.Data.Bool.Base.d__'8744'__30
      (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
      (coe MAlonzo.Code.Agda.Builtin.Bool.C_false_8)
      d_'8743''45''8744''45'isCommutativeSemiring_1782
-- Data.Bool.Properties.∨-∧-isLattice
d_'8744''45''8743''45'isLattice_1786 ::
  MAlonzo.Code.Algebra.Structures.T_IsLattice_740
d_'8744''45''8743''45'isLattice_1786
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsLattice'46'constructor_20019
      (coe
         MAlonzo.Code.Relation.Binary.PropositionalEquality.Properties.du_isEquivalence_242)
      erased erased erased erased erased erased
      (coe d_'8744''45''8743''45'absorptive_1746)
-- Data.Bool.Properties.∨-∧-lattice
d_'8744''45''8743''45'lattice_1788 ::
  MAlonzo.Code.Algebra.Bundles.T_Lattice_1144
d_'8744''45''8743''45'lattice_1788
  = coe
      MAlonzo.Code.Algebra.Bundles.C_Lattice'46'constructor_19207
      MAlonzo.Code.Data.Bool.Base.d__'8744'__30
      MAlonzo.Code.Data.Bool.Base.d__'8743'__24
      d_'8744''45''8743''45'isLattice_1786
-- Data.Bool.Properties.∨-∧-isDistributiveLattice
d_'8744''45''8743''45'isDistributiveLattice_1790 ::
  MAlonzo.Code.Algebra.Structures.T_IsDistributiveLattice_814
d_'8744''45''8743''45'isDistributiveLattice_1790
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsDistributiveLattice'46'constructor_24089
      (coe d_'8744''45''8743''45'isLattice_1786) erased
-- Data.Bool.Properties.∨-∧-distributiveLattice
d_'8744''45''8743''45'distributiveLattice_1792 ::
  MAlonzo.Code.Algebra.Bundles.T_DistributiveLattice_1228
d_'8744''45''8743''45'distributiveLattice_1792
  = coe
      MAlonzo.Code.Algebra.Bundles.C_DistributiveLattice'46'constructor_20829
      MAlonzo.Code.Data.Bool.Base.d__'8744'__30
      MAlonzo.Code.Data.Bool.Base.d__'8743'__24
      d_'8744''45''8743''45'isDistributiveLattice_1790
-- Data.Bool.Properties.∨-∧-isBooleanAlgebra
d_'8744''45''8743''45'isBooleanAlgebra_1794 ::
  MAlonzo.Code.Algebra.Structures.T_IsBooleanAlgebra_1864
d_'8744''45''8743''45'isBooleanAlgebra_1794
  = coe
      MAlonzo.Code.Algebra.Structures.C_IsBooleanAlgebra'46'constructor_59329
      (coe d_'8744''45''8743''45'isDistributiveLattice_1790) erased
      erased erased
-- Data.Bool.Properties.∨-∧-booleanAlgebra
d_'8744''45''8743''45'booleanAlgebra_1796 ::
  MAlonzo.Code.Algebra.Bundles.T_BooleanAlgebra_2920
d_'8744''45''8743''45'booleanAlgebra_1796
  = coe
      MAlonzo.Code.Algebra.Bundles.C_BooleanAlgebra'46'constructor_50469
      MAlonzo.Code.Data.Bool.Base.d__'8744'__30
      MAlonzo.Code.Data.Bool.Base.d__'8743'__24
      MAlonzo.Code.Data.Bool.Base.d_not_22
      (coe MAlonzo.Code.Agda.Builtin.Bool.C_true_10)
      (coe MAlonzo.Code.Agda.Builtin.Bool.C_false_8)
      d_'8744''45''8743''45'isBooleanAlgebra_1794
-- Data.Bool.Properties.xor-is-ok
d_xor'45'is'45'ok_1802 ::
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_xor'45'is'45'ok_1802 = erased
-- Data.Bool.Properties.xor-∧-commutativeRing
d_xor'45''8743''45'commutativeRing_1808 ::
  MAlonzo.Code.Algebra.Bundles.T_CommutativeRing_2704
d_xor'45''8743''45'commutativeRing_1808
  = coe
      MAlonzo.Code.Algebra.Properties.BooleanAlgebra.du_commutativeRing_2050
      (coe d_'8744''45''8743''45'booleanAlgebra_1796)
      (coe MAlonzo.Code.Data.Bool.Base.d__xor__36) erased
-- Data.Bool.Properties.not-involutive
d_not'45'involutive_2140 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_not'45'involutive_2140 = erased
-- Data.Bool.Properties.not-injective
d_not'45'injective_2146 ::
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_not'45'injective_2146 = erased
-- Data.Bool.Properties.not-¬
d_not'45''172'_2156 ::
  Bool ->
  Bool ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
  MAlonzo.Code.Data.Empty.T_'8869'_4
d_not'45''172'_2156 = erased
-- Data.Bool.Properties.¬-not
d_'172''45'not_2162 ::
  Bool ->
  Bool ->
  (MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12 ->
   MAlonzo.Code.Data.Empty.T_'8869'_4) ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'172''45'not_2162 = erased
-- Data.Bool.Properties.⇔→≡
d_'8660''8594''8801'_2174 ::
  Bool ->
  Bool ->
  Bool ->
  MAlonzo.Code.Function.Equivalence.T_Equivalence_16 ->
  MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8660''8594''8801'_2174 = erased
-- Data.Bool.Properties.T-≡
d_T'45''8801'_2190 ::
  Bool -> MAlonzo.Code.Function.Equivalence.T_Equivalence_16
d_T'45''8801'_2190 v0
  = if coe v0
      then coe
             MAlonzo.Code.Function.Equivalence.du_equivalence_56 erased
             (let v1 = coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8 in
              coe (\ v2 -> v1))
      else coe
             MAlonzo.Code.Function.Equivalence.du_equivalence_56 erased erased
-- Data.Bool.Properties.T-not-≡
d_T'45'not'45''8801'_2194 ::
  Bool -> MAlonzo.Code.Function.Equivalence.T_Equivalence_16
d_T'45'not'45''8801'_2194 v0
  = if coe v0
      then coe
             MAlonzo.Code.Function.Equivalence.du_equivalence_56 erased erased
      else coe
             MAlonzo.Code.Function.Equivalence.du_equivalence_56 erased
             (let v1 = coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8 in
              coe (\ v2 -> v1))
-- Data.Bool.Properties.T-∧
d_T'45''8743'_2200 ::
  Bool -> Bool -> MAlonzo.Code.Function.Equivalence.T_Equivalence_16
d_T'45''8743'_2200 v0 v1
  = if coe v0
      then if coe v1
             then coe
                    MAlonzo.Code.Function.Equivalence.du_equivalence_56
                    (let v2
                           = coe
                               MAlonzo.Code.Agda.Builtin.Sigma.C__'44'__32
                               (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
                               (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8) in
                     coe (\ v3 -> v2))
                    (let v2 = coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8 in
                     coe (\ v3 -> v2))
             else coe
                    MAlonzo.Code.Function.Equivalence.du_equivalence_56 erased
                    (coe (\ v2 -> MAlonzo.Code.Agda.Builtin.Sigma.d_snd_30 (coe v2)))
      else coe
             MAlonzo.Code.Function.Equivalence.du_equivalence_56 erased
             (coe (\ v2 -> MAlonzo.Code.Agda.Builtin.Sigma.d_fst_28 (coe v2)))
-- Data.Bool.Properties.T-∨
d_T'45''8744'_2206 ::
  Bool -> Bool -> MAlonzo.Code.Function.Equivalence.T_Equivalence_16
d_T'45''8744'_2206 v0 v1
  = if coe v0
      then coe
             MAlonzo.Code.Function.Equivalence.du_equivalence_56
             (coe MAlonzo.Code.Data.Sum.Base.C_inj'8321'_38)
             (let v2 = coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8 in
              coe (\ v3 -> v2))
      else (if coe v1
              then coe
                     MAlonzo.Code.Function.Equivalence.du_equivalence_56
                     (coe MAlonzo.Code.Data.Sum.Base.C_inj'8322'_42)
                     (let v2 = coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8 in
                      coe (\ v3 -> v2))
              else coe
                     MAlonzo.Code.Function.Equivalence.du_equivalence_56
                     (coe MAlonzo.Code.Data.Sum.Base.C_inj'8321'_38)
                     (coe
                        MAlonzo.Code.Data.Sum.Base.du_'91'_'44'_'93'_52 (coe (\ v2 -> v2))
                        (coe (\ v2 -> v2))))
-- Data.Bool.Properties.T-irrelevant
d_T'45'irrelevant_2208 ::
  Bool ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_T'45'irrelevant_2208 = erased
-- Data.Bool.Properties.T?
d_T'63'_2210 :: Bool -> MAlonzo.Code.Relation.Nullary.T_Dec_32
d_T'63'_2210 v0
  = coe
      MAlonzo.Code.Relation.Nullary.C__because__46 (coe v0)
      (if coe v0
         then coe
                MAlonzo.Code.Relation.Nullary.C_of'696'_22
                (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
         else coe MAlonzo.Code.Relation.Nullary.C_of'8319'_26)
-- Data.Bool.Properties.T?-diag
d_T'63''45'diag_2216 :: Bool -> AgdaAny -> AgdaAny
d_T'63''45'diag_2216 v0 ~v1 = du_T'63''45'diag_2216 v0
du_T'63''45'diag_2216 :: Bool -> AgdaAny
du_T'63''45'diag_2216 v0
  = coe seq (coe v0) (coe MAlonzo.Code.Agda.Builtin.Unit.C_tt_8)
-- Data.Bool.Properties.push-function-into-if
d_push'45'function'45'into'45'if_2226 ::
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  () ->
  MAlonzo.Code.Agda.Primitive.T_Level_14 ->
  () ->
  (AgdaAny -> AgdaAny) ->
  Bool ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_push'45'function'45'into'45'if_2226 = erased
-- Data.Bool.Properties.∧-∨-distˡ
d_'8743''45''8744''45'dist'737'_2228 ::
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45''8744''45'dist'737'_2228 = erased
-- Data.Bool.Properties.∧-∨-distʳ
d_'8743''45''8744''45'dist'691'_2230 ::
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45''8744''45'dist'691'_2230 = erased
-- Data.Bool.Properties.distrib-∧-∨
d_distrib'45''8743''45''8744'_2232 ::
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_distrib'45''8743''45''8744'_2232
  = coe d_'8743''45'distrib'45''8744'_1712
-- Data.Bool.Properties.∨-∧-distˡ
d_'8744''45''8743''45'dist'737'_2234 ::
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45''8743''45'dist'737'_2234 = erased
-- Data.Bool.Properties.∨-∧-distʳ
d_'8744''45''8743''45'dist'691'_2236 ::
  Bool ->
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45''8743''45'dist'691'_2236 = erased
-- Data.Bool.Properties.∨-∧-distrib
d_'8744''45''8743''45'distrib_2238 ::
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_'8744''45''8743''45'distrib_2238
  = coe d_'8744''45'distrib'45''8743'_1732
-- Data.Bool.Properties.∨-∧-abs
d_'8744''45''8743''45'abs_2240 ::
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8744''45''8743''45'abs_2240 = erased
-- Data.Bool.Properties.∧-∨-abs
d_'8743''45''8744''45'abs_2242 ::
  Bool -> Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_'8743''45''8744''45'abs_2242 = erased
-- Data.Bool.Properties.not-∧-inverseˡ
d_not'45''8743''45'inverse'737'_2244 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_not'45''8743''45'inverse'737'_2244 = erased
-- Data.Bool.Properties.not-∧-inverseʳ
d_not'45''8743''45'inverse'691'_2246 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_not'45''8743''45'inverse'691'_2246 = erased
-- Data.Bool.Properties.not-∧-inverse
d_not'45''8743''45'inverse_2248 ::
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_not'45''8743''45'inverse_2248 = coe d_'8743''45'inverse_1684
-- Data.Bool.Properties.not-∨-inverseˡ
d_not'45''8744''45'inverse'737'_2250 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_not'45''8744''45'inverse'737'_2250 = erased
-- Data.Bool.Properties.not-∨-inverseʳ
d_not'45''8744''45'inverse'691'_2252 ::
  Bool -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_not'45''8744''45'inverse'691'_2252 = erased
-- Data.Bool.Properties.not-∨-inverse
d_not'45''8744''45'inverse_2254 ::
  MAlonzo.Code.Agda.Builtin.Sigma.T_Σ_14
d_not'45''8744''45'inverse_2254 = coe d_'8744''45'inverse_1618
-- Data.Bool.Properties.isCommutativeSemiring-∨-∧
d_isCommutativeSemiring'45''8744''45''8743'_2256 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344
d_isCommutativeSemiring'45''8744''45''8743'_2256
  = coe d_'8744''45''8743''45'isCommutativeSemiring_1776
-- Data.Bool.Properties.commutativeSemiring-∨-∧
d_commutativeSemiring'45''8744''45''8743'_2258 ::
  MAlonzo.Code.Algebra.Bundles.T_CommutativeSemiring_2094
d_commutativeSemiring'45''8744''45''8743'_2258
  = coe d_'8744''45''8743''45'commutativeSemiring_1778
-- Data.Bool.Properties.isCommutativeSemiring-∧-∨
d_isCommutativeSemiring'45''8743''45''8744'_2260 ::
  MAlonzo.Code.Algebra.Structures.T_IsCommutativeSemiring_1344
d_isCommutativeSemiring'45''8743''45''8744'_2260
  = coe d_'8743''45''8744''45'isCommutativeSemiring_1782
-- Data.Bool.Properties.commutativeSemiring-∧-∨
d_commutativeSemiring'45''8743''45''8744'_2262 ::
  MAlonzo.Code.Algebra.Bundles.T_CommutativeSemiring_2094
d_commutativeSemiring'45''8743''45''8744'_2262
  = coe d_'8743''45''8744''45'commutativeSemiring_1784
-- Data.Bool.Properties.isBooleanAlgebra
d_isBooleanAlgebra_2264 ::
  MAlonzo.Code.Algebra.Structures.T_IsBooleanAlgebra_1864
d_isBooleanAlgebra_2264
  = coe d_'8744''45''8743''45'isBooleanAlgebra_1794
-- Data.Bool.Properties.booleanAlgebra
d_booleanAlgebra_2266 ::
  MAlonzo.Code.Algebra.Bundles.T_BooleanAlgebra_2920
d_booleanAlgebra_2266
  = coe d_'8744''45''8743''45'booleanAlgebra_1796
-- Data.Bool.Properties.commutativeRing-xor-∧
d_commutativeRing'45'xor'45''8743'_2268 ::
  MAlonzo.Code.Algebra.Bundles.T_CommutativeRing_2704
d_commutativeRing'45'xor'45''8743'_2268
  = coe d_xor'45''8743''45'commutativeRing_1808
-- Data.Bool.Properties.proof-irrelevance
d_proof'45'irrelevance_2270 ::
  Bool ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_proof'45'irrelevance_2270 = erased
-- Data.Bool.Properties.T-irrelevance
d_T'45'irrelevance_2272 ::
  Bool ->
  AgdaAny ->
  AgdaAny -> MAlonzo.Code.Agda.Builtin.Equality.T__'8801'__12
d_T'45'irrelevance_2272 = erased
