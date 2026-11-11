import RHFormal.D1_MirrorGram
import RHFormal.C1_ResamplingGamma2
import RHFormal.OnePositiveDirection
import RHFormal.LemmaA_FibreClasses
import RHFormal.LemmaC_ConeTensor
import RHFormal.B56_BorderedIdentity
import RHFormal.B25_Folding
import RHFormal.B32_NegativeSubspaceDim
import RHFormal.HankelPowerSums
import RHFormal.T45_FirstOrderCaps
import RHFormal.T26_ParityDecomposition
import RHFormal.T32_InertiaRankOne
import RHFormal.T50_FibreClassesCount
import RHFormal.T27_KappaInequalities
import RHFormal.B2_BochnerPathForm
import RHFormal.B3_ThreeWaySplit
import RHFormal.T33_MarginSign
import RHFormal.T44_InteriorUnderGap
import RHFormal.T35_MonotoneGroundState
import RHFormal.T75_TwoSidedMirrorBound
import RHFormal.T63_GroundStateTransform
import RHFormal.Perron_GroundState
import RHFormal.LemmaB_PerronStep
import RHFormal.LemmaB_TrickleInequality
import RHFormal.N2_RankOnePush
import RHFormal.SignatureBridge
import RHFormal.CB_L1_Squarefull
import RHFormal.CB_L2_KernelCopies
import RHFormal.CB_L3_GramLowerBound
import RHFormal.CB_L4_AmplifierArithmetic
import RHFormal.CB_L5_CharacterOrthogonality

/-!
# Axiom audit

For every main theorem of the library this file prints the axioms its proof depends on. The full build
shows the lists. Expected for every line: a subset of `[propext, Classical.choice, Quot.sound]`, the
three standard axioms of Lean 4 / mathlib. `sorryAx` in a list would mean a hidden `sorry`; any other
name would mean an added axiom. (`native_decide` would show as `Lean.ofReduceBool` / `Lean.trustCompiler`.)
-/

#print axioms RHFormal.D1.mirror_form_eq_sum_squares
#print axioms RHFormal.D1.mirror_form_eq_sum_squares_unweighted
#print axioms RHFormal.D1.mirror_form_eq_sum_primes
#print axioms RHFormal.D1.mirror_form_nonneg
#print axioms RHFormal.C1.gamma2_resample
#print axioms RHFormal.C1.gamma2_sub_carre_resample
#print axioms RHFormal.C1.gamma2_ge_resample
#print axioms RHFormal.C1.gamma2_eq_resample_single
#print axioms RHFormal.atMostOnePos_iff_reverse_cauchy_schwarz
#print axioms RHFormal.AtMostOnePos.reverse_cauchy_schwarz
#print axioms RHFormal.atMostOnePos_iff_exists_ker
#print axioms RHFormal.LemmaA.weil_nonneg_iff_atMostOnePos
#print axioms RHFormal.LemmaC.coneT_contract
#print axioms RHFormal.LemmaC.coneT_slice_atMostOnePos
#print axioms RHFormal.B56.bordered_eq_shift
#print axioms RHFormal.B56.rankOne_value
#print axioms RHFormal.B56.rankOne_nondegenerate
#print axioms RHFormal.B25.quad_even_sub_odd
#print axioms RHFormal.B25.quad_even_add_odd
#print axioms RHFormal.B32.finrank_le_of_negDef
#print axioms RHFormal.Hankel.hankelForm_eq
#print axioms RHFormal.Hankel.hankelForm_nonneg_iff
#print axioms RHFormal.T45.cap_upper_sqrt
#print axioms RHFormal.T45.cap_lower_sqrt
#print axioms RHFormal.T45.support_shift
#print axioms RHFormal.T26.form_eq_even_add_odd
#print axioms RHFormal.T26.pole_eq
#print axioms RHFormal.T32.even_le
#print axioms RHFormal.T32.even_gt
#print axioms RHFormal.T32.odd_gt
#print axioms RHFormal.T32.odd_le
#print axioms RHFormal.T50.negDim_weil_iff_posDim_Ntilde
#print axioms RHFormal.T27.full
#print axioms RHFormal.B2.path_form
#print axioms RHFormal.B3.three_way_split
#print axioms RHFormal.T33.odd_margin_mem
#print axioms RHFormal.T33.even_margin_counterexample
#print axioms RHFormal.T44.perturbed_nonneg
#print axioms RHFormal.T35.sInf_antitone
#print axioms RHFormal.T75.even_block_iff
#print axioms RHFormal.T75.odd_block_iff
#print axioms RHFormal.T63.ground_state_identity
#print axioms RHFormal.T63.atMostOnePos_iff_poincare
#print axioms RHFormal.Perron.form_abs_le
#print axioms RHFormal.Perron.ground_sign
#print axioms RHFormal.Perron.ground_unique
#print axioms RHFormal.LemmaB.perron_step
#print axioms RHFormal.LemmaB.trickle_inequality
#print axioms RHFormal.N2.push_iff
#print axioms RHFormal.N2.push_unique
#print axioms RHFormal.SignatureBridge.posDim_iff_le_sigPos
#print axioms RHFormal.SignatureBridge.negDim_iff_le_sigNeg
#print axioms RHFormal.CB.L1.squarefull_decomp
#print axioms RHFormal.CB.L1.card_squarefull_le_three
#print axioms RHFormal.CB.L1.card_squarefull_le_tsum
#print axioms RHFormal.CB.L1.tsum_eq_zeta
#print axioms RHFormal.CB.L1.card_squarefull_le_zeta
#print axioms RHFormal.CB.L2.kernel_lemma
#print axioms RHFormal.CB.L2.squarefull_of_copy
#print axioms RHFormal.CB.L2.card_copies_le_three
#print axioms RHFormal.CB.L2.card_copies_le_zeta
#print axioms RHFormal.CB.L2.copy_decomp
#print axioms RHFormal.CB.L2.card_copies_le_euler
#print axioms RHFormal.CB.L3.delta_ge_of_test
#print axioms RHFormal.CB.L3.opNorm_sq_ge
#print axioms RHFormal.CB.L3.exact_copy_sum_ge
#print axioms RHFormal.CB.L3.near_copy_re_sum_ge
#print axioms RHFormal.CB.L3.theorem1
#print axioms RHFormal.CB.L3.theorem1_exact
#print axioms RHFormal.CB.L4.amplifier_floor
#print axioms RHFormal.CB.L4.exponent_floor
#print axioms RHFormal.CB.L4.exponent_floor_attained
#print axioms RHFormal.CB.L4.delta_floor
#print axioms RHFormal.CB.L5.sum_char_mul_conj
#print axioms RHFormal.CB.L5.sum_norm_sq_eq
