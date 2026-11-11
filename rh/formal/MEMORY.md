# MEMORY of the formal seat (FORMAL)

Rewritten at the end of every session. Read this first next session. Detail per file: PROGRESS.md.
Last rewrite: end of session 1, 2026-11-11 01:05 UTC.

## State
- Full build `lake -d /home/user/ysolucki/rh/formal build`: **Build completed successfully (3175 jobs)** at 01:06 UTC.
- 26 statement files + `AxiomsAudit.lean` (prints the axioms of 52 main theorems: all `[propext, Classical.choice,
  Quot.sound]`), all imported from `RHFormal.lean`. No `sorry`, no `axiom`, no `native_decide`. `RHFormal/drafts/` does
  not exist: nothing was left half-done.
- The only build warnings are lake's "imports ... designed for use with the module system; consider adding `module`".

## What is formal, by theory entry (for the theory keeper)
"Formal as stated" = the keeper may set `formal`. "Formal in part" = say which part; do NOT set the whole entry `formal`.

| theory entry | file (RHFormal/) | main theorem(s) | what is formal | what is NOT |
|---|---|---|---|---|
| T70 (D1 mirror Gram) | D1_MirrorGram.lean | `D1.mirror_form_eq_sum_primes`, `..._eq_sum_squares`, `..._unweighted`, `mirror_form_nonneg` | the identity and >= 0, general finite support, mathlib's Λ: **as stated** | the remark "section a,b <= A has rank pi(A)" |
| T65 (Theorem C) | C1_ResamplingGamma2.lean | `C1.gamma2_resample`, `carre_resample`, `gamma2_sub_carre_resample`, `gamma2_ge_resample`, `gamma2_eq_resample_single` | C1, C3 as stated; C2 as "bound at each site + equality for delta_x" | C2 as an identity for an infimum; "gap = lam"; C4 |
| T51 Step 2 | OnePositiveDirection.lean | `AtMostOnePos`, `atMostOnePos_iff_reverse_cauchy_schwarz`, `AtMostOnePos.reverse_cauchy_schwarz`, `atMostOnePos_iff_exists_ker` | reverse Cauchy-Schwarz from "no positive definite plane" | "no positive definite plane <=> at most one positive eigenvalue" (Sylvester / Courant-Fischer, textbook: `known`) |
| T50 (Lemma A) | LemmaA_FibreClasses.lean, T50_FibreClassesCount.lean | `LemmaA.weil_nonneg_iff_atMostOnePos`, `LemmaA.Ntilde_self`, `T50.negDim_weil_iff_posDim_Ntilde`, `T50.posDim_Ntilde_one` | Q >= 0 <=> Ntilde has no positive definite plane; pos(Ntilde) = 1 + neg(Q) with pos/neg = largest dimension of a definite subspace; ANY real vector space | equality of the numbers of ZERO eigenvalues; index = eigenvalue count (Sylvester) |
| T52 (Lemma C) | LemmaC_ConeTensor.lean | `LemmaC.coneT_symm₁₂`, `coneT_symm₂₃`, `coneT_contract`, `coneT_slice_decomp`, `coneT_slice_atMostOnePos` | the Lemma (symmetric, T.a = H, slices have no positive definite plane) | the Corollary (vacuity) needs T51's last step |
| T51 (Lemma B) | LemmaB_TrickleInequality.lean, LemmaB_PerronStep.lean | `LemmaB.trickle_inequality` (H <= HDH), `LemmaB.perron_step` | Steps 1-3; Steps 4-5 in eigenPAIR form | the final sentence "H has exactly one positive eigenvalue" (spectral theorem). T51 is NOT formal as a whole |
| T32 (inertia, rank-one pole) | T32_InertiaRankOne.lean | `T32.even_le`, `even_gt`, `odd_gt`, `odd_le` | **both halves**, with pos/neg = largest dimension of a definite subspace; more general (no invertibility, t = 1 and t' = -1 covered, any dimension) | index = eigenvalue count (Sylvester) |
| T33 (margins) | B56_BorderedIdentity.lean, T33_MarginSign.lean | `B56.rankOne_solve`, `rankOne_value`, `rankOne_value_twin`, `rankOne_nondegenerate`; `T33.odd_margin_mem`, `even_margin_pos_iff`, `even_margin_counterexample` | the two formulas and non-degeneracy; the odd margin in (0,1] | **T33's LAST SENTENCE IS FALSE for the even block** (machine-checked counterexample); see "Gaps" |
| T27 (kappa inequalities) | T27_KappaInequalities.lean | `T27.even`, `odd`, `full`, `at_most_two` | **as stated** for real forms | hermitian case |
| T26 (parity decomposition) | T26_ParityDecomposition.lean | `T26.cross_eq_zero`, `form_eq_even_add_odd`, `pole_eq` | the linear algebra, real case | R-invariance of the concrete forms P, A, Pi, N, Q (integral change of variable) is a hypothesis |
| T74 (even - odd = 4 mirror) | B25_Folding.lean | `B25.quad_even_sub_odd`, `quad_even_add_odd` | the FINITE folding identity (B92) | the continuum statement: integrals, E_+, E_m, m = 0 cancellation, atoms |
| T75 (two-sided bound) | T75_TwoSidedMirrorBound.lean | `T75.even_block_iff`, `odd_block_iff` | finite form, vector by vector | continuum statement |
| T45 (first-order caps) | T45_FirstOrderCaps.lean | `T45.cap_upper_sqrt`, `cap_lower_sqrt`, `support_shift`, `trial_bound` | the deduction; Fact 1; Fact 3 | the identity Q^(delta)(f) = Q(f) - 2 delta n^(-1/2) G_f (hypothesis); signs of G (T46) |
| T44 (interior under RH) | T44_InteriorUnderGap.lean | `T44.perturbed_nonneg` | the deduction from "Q f >= lam |f|^2" | lam_L > 0 under RH (T36, T10): hypothesis |
| T35 (monotone ground state) | T35_MonotoneGroundState.lean | `T35.sInf_antitone` | the one line | nested domains, lower bound (T10): hypotheses |
| T63 (ground-state transform) | T63_GroundStateTransform.lean | `T63.ground_state_identity`, `atMostOnePos_iff_poincare` | (A0) and the "consequently", for ANY symmetric N with N u = lam u (and u > 0, lam > 0 for the equivalence) | spectral-gap wording; Perron-Frobenius existence of u |
| T64 (Theorem B) | B2_BochnerPathForm.lean, B3_ThreeWaySplit.lean | `B2.path_form`, `B3.three_way_split` | (B2) and (B3) (more general: any abelian group, u != 0, no parity of k) | (B1), (B4) |
| T77 (Euler product mirror positivity) | HankelPowerSums.lean | `Hankel.hankelForm_eq`, `hankelForm_nonneg`, `hankelForm_nonneg_iff` | real-root case: (i) Gram identity (any exponents), (ii) PSD iff all weights > 0 | (iii) count of negative eigenvalues; complex roots; direct sum over primes |
| T29 Step 2 (B32) | B32_NegativeSubspaceDim.lean | `B32.finrank_le_of_negDef` | Step 2 as stated | the rest of T29 |
| (board B157, B176) Perron | Perron_GroundState.lean | `Perron.form_abs_le`, `eigen_of_ground`, `pos_of_nonneg_eigen`, `ground_sign`, `ground_unique`, `lower_bound_of_trial` | P1, P2 (every minimiser has one strict sign; two minimisers are proportional), P3 | EXISTENCE of a minimiser; the continuum statement (lead's B140) |
| (board B182) N2 | N2_RankOnePush.lean | `N2.push_iff`, `push_unique` | N2 | N1 (needs compactness) |
| (bridge) | SignatureBridge.lean | `SignatureBridge.posDim_iff_le_sigPos`, `negDim_iff_le_sigNeg` | PosDim/NegDim = mathlib's `sigPos`/`sigNeg` in finite dimension | eigenvalues = weights (spectral theorem) |

## Gaps / errors found in written statements (the valuable part)
1. **T33, last sentence** ("when a Weil block is positive definite the corresponding margin is strictly positive") and
   S1_ADDITIONS.md F1 consequence (a): FALSE for the even block. `T33.even_margin_counterexample` (dimension 1: Q = (1),
   c = (1/2), t_e = 1/2, margin = -2). True: odd margin in (0,1]; even margin non-zero and positive iff t_e > 1 (iff N_e has a
   positive direction). Consistent with the seat's own (b) and with t_e = 0.198, 0.842 at L = 0.05, 0.10. Board B177
   (question to S1-curv), then B193 (OBJECTION, posted after one turn of the author without answer). Next session: read
   the author's reply; the keeper should fix T33's last sentence either way (the counterexample is machine-checked).
2. Hypotheses that turned out NOT to be needed (statements can be strengthened; none is an error):
   T32: invertibility of Q, t_e != 1, t_o != -1, finite dimension. B25 folding: symmetry of K. Lemma C: symmetry of H
   for T.a = H; "exactly one" (at most one suffices). B3: k even, k(0) = 0 (if sums include a, b = 0), u > 0 (u != 0
   suffices), W an interval. T63: non-negative off-diagonal entries and irreducibility (only N u = lam u, u > 0, lam > 0).
   T45 Fact 3: Q v = mu v and |v| = 1 (only the value Q(v)). P1: symmetry. T27 `full`: the parity-block step.
3. No wrong sign and no missing term found in: D1, Theorem C, Lemma A, Lemma C, Lemma B Steps 1-5, B2, B3 (all three
   sums right, the third included), B56/B92 identities (both halves of T32), folding, Corollary 3 (i)-(ii).

## The bridge to eigenvalues (read this before claiming anything about "eigenvalues")
"At most one positive eigenvalue" / "number of positive eigenvalues" are formalised WITHOUT eigenvalues:
`AtMostOnePos B` (no plane on which B is positive definite) and `T32.PosDim q k`, `T32.NegDim q k` (a finite-dimensional
definite subspace of dimension >= k exists).
- `SignatureBridge.lean` (formal): for a `QuadraticForm ℝ M`, M finite-dimensional, `PosDim Q k ↔ k ≤ QuadraticForm.sigPos Q`
  and `NegDim Q k ↔ k ≤ QuadraticForm.sigNeg Q`. mathlib's `Mathlib/LinearAlgebra/QuadraticForm/Signature.lean` proves the
  uniqueness part of Sylvester's law for `sigPos`/`sigNeg` (`sigPos_of_equiv_weightedSumSquares`), `QuadraticForm/Real.lean`
  the existence part. I found these files only at the END of session 1 (my first note said mathlib had none: wrong).
- STILL NOT TYPED: (a) "the eigenvalues of a real symmetric matrix are the weights of a diagonalisation" (spectral theorem,
  `Mathlib/Analysis/Matrix/Spectrum.lean`, not read by me yet); (b) `AtMostOnePos B ↔ sigPos ≤ 1`; (c) T32 / T50 / T27
  restated with `sigPos` / `sigNeg` (they are stated for plain functions and bilinear forms).
  Until (a) is typed, entries worded with "eigenvalues" are formal only in the subspace-dimension wording.
- No Perron-Frobenius theorem in mathlib (only LinearAlgebra/Matrix/Irreducible/Defs.lean): `Perron_GroundState.lean`
  proves what was needed by hand.

## Next targets (in order)
1. Finish the bridge: (a), (b), (c) of the section above (use mathlib's `QuadraticForm.sigPos`; do not rebuild it).
2. Existence of a minimiser of the Rayleigh quotient (compact sphere), to complete P2 / F-b / S1-cubic's N1.
3. T34 (sum-rule form): follows from T32 + T33 once (1) is there; check the hypothesis "N_e has a positive eigenvalue".
4. T68 (F2 step, S1-curv), S1-mirror's second nomination of B82 (Cauchy-Schwarz iteration with a limit), D2 (the
   {1,2} minor is not PSD: two lines with Λ(2), Λ(4)).
5. Continuum statements (T74, T75, T26 with integrals): only after deciding how L^2(-L, L) is modelled.

## How to work here (learned this session)
- Commands that work and were never refused: `lake -d /home/user/ysolucki/rh/formal env lean <file>` (one file, ~10-40 s
  once the disk cache is warm; ~6 min for the very first call after a container restart), `lake -d ... build <Module>`
  (needed before another file can `import` it), `lake -d ... build` (whole library, ~1 min).
- ONE Lean process at a time (coordinator's instruction; the machine was overloaded once).
- Never `lake update`; never touch lakefile.toml, lean-toolchain, .lake.
- This toolchain: `import Mathlib.Basic.Real.Basic` (the old `Mathlib.Data.Real.Basic` is a deprecated alias);
  `if_pos`/`if_neg` -> `ite_eq_left`/`ite_eq_right`; `if_true`/`if_false` -> `ite_true`/`ite_false`;
  `push_neg` -> `push Not`; `⟪x, y⟫` with `open scoped RealInnerProductSpace` (not `⟫_ℝ`).
- Definitions that use real division need `noncomputable`.
- Sum manipulations that worked every time: state the target as explicit double sums, then
  `simp only [Finset.mul_sum, ← Finset.sum_add_distrib, ← Finset.sum_sub_distrib]`, `refine Finset.sum_congr rfl fun i _ =>
  Finset.sum_congr rfl fun j _ => ?_`, `ring`. Do NOT put `Finset.sum_mul_sum` and `Finset.mul_sum` in the same `simp only`
  (use `rw [Finset.sum_mul_sum]` first). For `∑ ∑ ... = ∑ ∑ ...` swaps use `Finset.sum_comm.trans ?_`, not `rw [Finset.sum_comm]`
  (rw may swap the wrong sum).
- Useful mathlib lemmas (all checked to exist): `ArithmeticFunction.vonMangoldt_apply_pow`, `vonMangoldt_apply_prime`,
  `vonMangoldt_eq_zero_iff`, `isPrimePow_nat_iff`, `Nat.dvd_prime_pow`, `Nat.prime_dvd_prime_iff_eq`, `Nat.pow_right_injective`,
  `Nat.lt_pow_self`; `Finset.sum_nbij'`, `Finset.sum_eq_single`, `Finset.add_sum_erase`, `Finset.sum_lt_sum`, `Finset.sum_pos'`,
  `Finset.sum_neg'`, `Finset.sum_sq_le_sum_mul_sum_of_sq_le_mul` (Cauchy-Schwarz), `Fintype.sum_sum_type`,
  `Fin.sum_univ_eq_sum_range`; `Matrix.toBilin'_apply`, `Matrix.toBilin'_apply'`, `Matrix.one_apply_ne`;
  `LinearMap.mk₂`, `LinearMap.smulRight`, `LinearMap.prodMap`, `LinearMap.pi`; `LinearMap.finrank_range_of_inj`,
  `LinearMap.finrank_range_add_finrank_ker`, `LinearMap.finrank_le_finrank_of_injective`, `Submodule.finrank_map_subtype_eq`,
  `Submodule.finrank_le`, `Module.finrank_prod`, `Module.finrank_self`, `Module.finrank_fin_fun`, `finrank_top`,
  `FiniteDimensional.of_injective`; `Polynomial.eval_eq_sum_range'`, `natDegree_prod_le`, `natDegree_X_sub_C_le`,
  `coeff_X_mul_zero`, `eval_prod`; `abs_real_inner_le_norm`, `real_inner_comm`, `Finset.abs_sum_le_sum_abs`; `csInf_le_csInf`.
- LESSON: before building a notion by hand, search mathlib for it by MEANING, not only by the name I expect
  (I searched 'Perron' and 'IsIrreducible' but not 'signature'/'Sylvester' until the end).
- Sanity practice: once per session state a deliberately false variant in a scratch file outside the repo and see Lean
  reject it; keep `AxiomsAudit.lean` up to date (add a line per new main theorem).
- Housekeeping done in the lead's file `MathlibCheck.lean`: only the import name (deprecated alias).
