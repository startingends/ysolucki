# PROGRESS of the formal seat (FORMAL)

Written as the work goes. Rule of the seat: a file counts only if it builds with no `sorry`, no `axiom`,
no `native_decide`; for each file: informal statement, Lean statement, every difference between the two.

## Session 1 (2026-11-11)

### 00:15 start
- Read: README.md here, claude.md "Standing structures", docs/SUBAGENT_PREAMBLE.md, rh/THEORY.md (T1..T6),
  r2_curv/PROOF_bochner_parity.md, r2_cubic/PROOF_trickle.md, board s1 (B1..B78).
- `rh/experiments/k_theory/STRUCTURE.md` does not exist yet (folder is empty): no keeper's priority list to follow.
- Board: B76, B77, B78 (S1-socrates) ASK three seats to nominate statements; no nomination had been answered
  when I started. I begin with the lead's list.
- The container was restarted a few minutes in; nothing of mine was on disk yet, nothing lost.

### Order of work chosen
1. Theorem D1 of PROOF_bochner_parity.md (mirror form of the primes = sum of squares, one per prime): idea #21
   and theory lemma T4/T6 lean on it; finite, algebraic, complete written proof. General case, mathlib's Λ.
2. Theorem C1 (Gamma_2 of the resampling chain).
3. Lemma C / Lemma A of PROOF_trickle.md (algebraic cores).
4. Hankel matrix of power sums is a Gram matrix.

### 00:22 note on the machine
- After the restart the first `lake env lean` took about 6 minutes (cold disk, mathlib object files being read);
  afterwards a file checks in well under a minute. One Lean process at a time (coordinator's instruction).
- Housekeeping: in `RHFormal/MathlibCheck.lean` (the lead's file) I changed the import
  `Mathlib.Data.Real.Basic` to `Mathlib.Basic.Real.Basic`: the old name is a deprecated alias in this mathlib
  and printed a warning on every build. Nothing else in that file was touched.
- In this Lean version `if_pos` / `if_neg` are deprecated (use `ite_eq_left` / `ite_eq_right`).

### 00:35 FILE 1 DONE: `RHFormal/D1_MirrorGram.lean`  (checks with no error and no warning)
Source: r2_curv/PROOF_bochner_parity.md, Theorem D, (D1).
INFORMAL: for every finitely supported real phi on the integers a >= 2,
  sum_{a,b>=2} phi(a) phi(b) Lambda(ab)/sqrt(ab) = sum_p (log p) (sum_{k>=1} phi(p^k) p^(-k/2))^2 >= 0.
LEAN (namespace RHFormal.D1; Λ = mathlib's ArithmeticFunction.vonMangoldt):
  (a) `vonMangoldt_mul_eq_sum`: for a >= 2, any b, any finite set P of primes containing the prime divisors
      of a:  Λ(a*b) = ∑ p ∈ P, if (∃ i, a = p^i) ∧ (∃ j, b = p^j) then log p else 0.
  (b) `mirror_form_eq_sum_squares`: for a finite set S of naturals all >= 2 and ANY φ : ℕ → ℝ,
      ∑ a ∈ S, ∑ b ∈ S, φ a * φ b * Λ(a*b) / √(a*b)
        = ∑ p ∈ S.biUnion primeFactors, log p * (∑ a ∈ S with ∃ k, a = p^k, φ a / √a)^2.
  (c) `mirror_form_eq_sum_primes`: for N and φ with φ a = 0 for a > N,
      ∑ a ∈ [2,N], ∑ b ∈ [2,N], φ a * φ b * Λ(a*b)/√(a*b)
        = ∑ p ∈ [2,N] with p prime, log p * (∑ k ∈ [1,N], φ(p^k) * (p:ℝ)^(-(k:ℝ)/2))^2.
  (d) `mirror_form_nonneg`, `mirror_form_nonneg'`: the form is >= 0 (for (b) and for (c)).
DIFFERENCES: none in content. GENERAL case (no restriction on the support beyond finiteness). Remarks:
  - √(ab) is written `Real.sqrt ((a:ℝ) * (b:ℝ))`; p^(-k/2) is the real power `(p:ℝ) ^ (-(k:ℝ)/2)`.
  - "finitely supported on a >= 2" is "φ a = 0 for a > N" and the sums run over 2 <= a, b <= N; the values
    of φ at 0 and 1 never enter. The sum over k >= 1 is the finite sum k = 1..N; every omitted term has
    p^k > N, where φ vanishes, so it is the full sum.
  - The sum over p runs over primes <= N; for any other prime the inner sum is 0.
GAP IN THE WRITTEN PROOF: none found. The written two-line proof is exactly what Lean accepted
  (Λ(ab) ≠ 0 forces a = p^i, b = p^j; then a direct sum of rank-one blocks).

### 00:45 FILE 2 DONE: `RHFormal/C1_ResamplingGamma2.lean`  (checks with no error and no warning)
Source: r2_curv/PROOF_bochner_parity.md, Theorem C, (C1), (C3) and (C2).
INFORMAL: resampling chain q_xy = lambda pi_y on a finite set (pi a probability vector), L f(x) = sum_y q_xy (f_y - f_x),
  Gamma(f)(x) = (1/2) sum_y q_xy (f_y - f_x)^2, Gamma_2(f) = (1/2) L Gamma(f) - Gamma(f, L f). Then
  (C1) Gamma_2(f)(x) = lambda^2 [(1/4)(f(x) - pi f)^2 + (3/4) Var_pi f], Gamma(f)(x) = (lambda/2)[Var_pi f + (f(x) - pi f)^2];
  (C2) the Bakry-Emery constant is exactly (lambda/2)(1 + 2 min_x pi_x);
  (C3) Gamma_2(f) - lambda Gamma(f) = (lambda/4) L[(f - pi f)^2] pointwise.
LEAN (namespace RHFormal.C1; W a finite type; `gen q f x = ∑ y, q x y * (f y - f x)`,
  `carre q f g x = (1/2) * ∑ y, q x y * ((f y - f x) * (g y - g x))`,
  `gamma2 q f x = (1/2) * gen q (carre q f f) x - carre q f (gen q f) x`, `resample lam π = fun _ y => lam * π y`,
  `mean π f = ∑ y, π y * f y`, `var π f = ∑ y, π y * (f y - mean π f)^2`). Hypothesis `hπ : ∑ y, π y = 1`.
  - `gen_resample`:     gen (resample lam π) f x = lam * (mean π f - f x).
  - `carre_resample`:   carre (resample lam π) f f x = lam/2 * (var π f + (f x - mean π f)^2).        [C1, second half]
  - `gamma2_resample`:  gamma2 (resample lam π) f x = lam^2 * (1/4 * (f x - mean π f)^2 + 3/4 * var π f).  [C1]
  - `gamma2_sub_carre_resample`: gamma2 .. f x - lam * carre .. f f x = lam/4 * gen .. (fun y => (f y - mean π f)^2) x.  [C3]
  - `pi_mul_sq_le` (needs π >= 0): π x * (f x - mean π f)^2 <= (1 - π x) * var π f.           [Cauchy-Schwarz step of C2]
  - `gamma2_ge_resample` (needs π >= 0): lam/2 * (1 + 2 π x) * carre .. f f x <= gamma2 .. f x, at every site x.
  - `gamma2_eq_resample_single`: equality in the last line for f = δ_x (Pi.single x 1), at the site x.
DIFFERENCES:
  - C1 and C3: none. They hold for ANY real π with ∑ π = 1 and any real lam (no sign condition is used).
  - C2 is formalised as its two halves at a fixed site x: the bound with constant (lam/2)(1 + 2 π_x) and equality
    for f = δ_x. The sentence "the Bakry-Emery constant is exactly (lam/2)(1 + 2 min_x π_x)" (an infimum over sites
    and functions) is NOT stated as one Lean theorem; it follows from the two halves when lam >= 0 (take the site
    with the smallest π_x). So: C2 formal as "pointwise bound + sharpness", not as an identity for an infimum.
  - The statement "its gap is lambda" and (C4) are not formalised (spectral statements).
GAP IN THE WRITTEN PROOF: none found. (The proof of C2 needs π >= 0, which the setting provides: π = u^2.)

### FILE 3 DONE: `RHFormal/OnePositiveDirection.lean`  (checks, no error, no warning)
Source: r2_cubic/PROOF_trickle.md, Lemma B, Step 2 (reverse Cauchy-Schwarz); it is also the shared definition
used by files 4 and 5.
INFORMAL (Step 2): if A is symmetric with at most one positive eigenvalue and a^T A a > 0, then
  A <= (Aa)(Aa)^T / (a^T A a).
LEAN (namespace RHFormal; E any real vector space, B : LinearMap.BilinForm ℝ E, hB : ∀ x y, B x y = B y x):
  - `AtMostOnePos B := ¬ ∃ v w, ∀ α β, (α ≠ 0 ∨ β ≠ 0) → 0 < B (α•v + β•w) (α•v + β•w)`
    ("there is no plane on which B is positive definite").
  - `atMostOnePos_iff_reverse_cauchy_schwarz`: AtMostOnePos B ↔ ∀ v w, 0 < B v v → B v v * B w w ≤ (B v w)^2.
  - `AtMostOnePos.reverse_cauchy_schwarz`: AtMostOnePos B → 0 < B a a → ∀ x, B x x ≤ (B x a)^2 / B a a.   [Step 2]
  - `atMostOnePos_of_nonpos_on_ker`: (φ a linear functional, B x x ≤ 0 whenever φ x = 0) → AtMostOnePos B.
  - `atMostOnePos_iff_exists_ker`: AtMostOnePos B ↔ ∃ φ linear, ∀ x, φ x = 0 → B x x ≤ 0.
DIFFERENCE (IMPORTANT, applies to files 3, 4, 5): "at most one positive eigenvalue" is formalised as
  "no positive definite plane" (positive index of inertia <= 1). For a real symmetric matrix the two are
  equivalent by Sylvester's law of inertia / Courant-Fischer; THAT equivalence is NOT machine-checked here.
  It is the step the written proof itself cites as "by Courant-Fischer". Status to give it: `known` (textbook).
  Everything after that citation in Step 2 is machine-checked, in any dimension (also infinite).
GAP IN THE WRITTEN PROOF: none.

### FILE 4 DONE: `RHFormal/LemmaA_FibreClasses.lean`  (checks, no error, no warning)
Source: r2_cubic/PROOF_trickle.md, Lemma A; board B36 (A).
INFORMAL: Ntilde on V + R F1 + R F2 with Ntilde(f,g) = N(f,g), Ntilde(f,F1) = <f,p>, Ntilde(f,F2) = <f,q>,
  Ntilde(F1,F1) = Ntilde(F2,F2) = 0, Ntilde(F1,F2) = 1; Q(f) = 2<f,p><f,q> - N(f,f). Then
  #pos(Ntilde) = 1 + #neg(Q), #zero(Ntilde) = #zero(Q). In particular Q >= 0 on V <=> Ntilde has at most one
  (then exactly one) positive eigenvalue.
LEAN (namespace RHFormal.LemmaA; V ANY real vector space, N : BilinForm ℝ V, p q : V →ₗ[ℝ] ℝ; the triple
  (f, α, β) : V × ℝ × ℝ stands for f + α F1 + β F2; `weil N p q f = 2 * p f * q f - N f f`;
  `phi p q f = (f, -q f, -p f)`):
  - `Ntilde_inl_inl`, `Ntilde_inl_F1`, `Ntilde_inl_F2`, `Ntilde_F1_F1`, `Ntilde_F2_F2`, `Ntilde_F1_F2`: the six
    defining values; `Ntilde_symm`: symmetric when N is.
  - `Ntilde_phi_F1`, `Ntilde_phi_F2`: Ntilde(phi f, F1) = 0 = Ntilde(phi f, F2).
  - `Ntilde_phi_phi`: Ntilde(phi f, phi g) = -(p f * q g + p g * q f - N f g);  `Ntilde_phi_self`: = -weil f.
  - `Ntilde_self`: Ntilde((f,α,β),(f,α,β)) = -weil f + 2 (α + q f)(β + p f).
  - `exists_pos`: ∃ v, 0 < Ntilde v v.
  - `weil_nonneg_iff_atMostOnePos` (N symmetric): (∀ f, 0 ≤ weil N p q f) ↔ AtMostOnePos (Ntilde N p q).
DIFFERENCES:
  - Formal: the "In particular" clause (with "at most one positive eigenvalue" read as in file 3) and the whole
    algebraic core of the proof. More general than the informal statement in one respect: no finite dimension,
    no inner product (p, q are arbitrary linear functionals), which is what board B32 needs ("holds on the
    infinite-dimensional window").
  - NOT formal: the two counting equalities #pos(Ntilde) = 1 + #neg(Q), #zero(Ntilde) = #zero(Q)
    (Sylvester's law of inertia). So Lemma A is formal as "Q >= 0 <=> at most one positive direction", not as
    the inertia formula. S1-parity's B32 uses the COUNT, which is therefore not covered.
GAP IN THE WRITTEN PROOF: none.

### FILE 5 DONE: `RHFormal/LemmaC_ConeTensor.lean`  (checks, no error, no warning)
Source: r2_cubic/PROOF_trickle.md, Lemma C; board B36 (C).
INFORMAL: H symmetric with exactly one positive eigenvalue, l := Ha >= 0 entrywise, s := a^T H a > 0,
  T_ijk := [H_ij l_k + H_ik l_j + H_jk l_i - (2/s) l_i l_j l_k]/s. Then T is symmetric, T.a = H, and every slice
  T_k has at most one positive eigenvalue.
LEAN (namespace RHFormal.LemmaC; ι a finite type, H : Matrix ι ι ℝ, a : ι → ℝ; `coneL H a i = ∑ j, H i j * a j`,
  `coneS H a = ∑ i, a i * coneL H a i`, `coneT H a i j k` = the displayed formula):
  - `coneT_symm₁₂`, `coneT_symm₂₃` (H symmetric): T i j k = T j i k and T i j k = T i k j.
  - `coneT_contract` (s ≠ 0): ∑ k, a k * T i j k = H i j.
  - `coneT_slice_decomp` (s ≠ 0): the entrywise decomposition T_k = (l_k/s)(H - l l^T/s) + (1/s)[u_k l^T + l u_k^T],
    u_k = H e_k - (l_k/(2s)) l, which the written proof states with "(expand to check)".
  - `coneT_slice_form` (s ≠ 0): x^T T_k x written with H, l, s.
  - `coneT_slice_atMostOnePos` (H symmetric, AtMostOnePos (toBilin' H), 0 < s, 0 ≤ l_k):
    AtMostOnePos (toBilin' (the slice T_k)).
DIFFERENCES:
  - "at most one positive eigenvalue" as in file 3 (no positive definite plane), for H and for the slices.
  - The Lean hypothesis on H is "at most one", weaker than the informal "exactly one"; l_k >= 0 is needed only for
    the slice k in question. So the Lean statement is slightly STRONGER than the informal one.
  - T.a = H needs neither symmetry of H nor any sign: only s ≠ 0 (Lean's linter pointed out that the symmetry
    hypothesis was unused). Harmless observation, not a gap.
  - The Lean proof of the slice statement is NOT the written one: no Weyl inequality. On the hyperplane l.x = 0
    the slice form is (l_k/s) x^T H x, and x^T H x <= 0 there by reverse Cauchy-Schwarz against a. The written
    route (negative semidefinite + rank two, Weyl) was not formalised; its "expand to check" identity was.
GAP IN THE WRITTEN PROOF: none.

### 00:30 board read; nominations arrived (B82 S1-mirror, B92 S1-parity, B98 S1-curv, B109 S1-cubic)
and the coordinator passed on the theory keeper's order for LIVE routes (k_theory/STRUCTURE.md (e)):
T45, T32, T74, T26; then T27, T44, T35. Files 6-13 below follow those two lists.
Added to file 1 (D1): `mirror_form_eq_sum_squares_unweighted`, S1-mirror's wording of B82 (no 1/sqrt weights).

### FILE 6 DONE: `RHFormal/B56_BorderedIdentity.lean`  (board B92 first step; board B98 "F1, step"; part of T32, T33)
INFORMAL (B92): B(x,y) = x^T Q x + 2 y c^T x + y^2/2 = (x + y Q^-1 c)^T Q (x + y Q^-1 c) + (1 - t) y^2/2
  = x^T (Q - 2cc^T) x + (y + 2c^T x)^2/2, t = 2 c^T Q^-1 c.
INFORMAL (B98, F1 step): Q symmetric invertible, t != 1, N = 2cc^T - Q: N invertible, 2 c^T N^-1 c - 1 = 1/(t-1);
  twin: t' = 2 s^T Q^-1 s != -1, M' = Q + 2ss^T: 1 - 2 s^T M'^-1 s = 1/(1 + t').
LEAN (namespace RHFormal.B56; V any real vector space, Q : BilinForm, c : V →ₗ ℝ, w : V with hw : ∀ x, Q w x = c x):
  `bordered_eq_shift`, `bordered_eq_border` (the two identities); `rankOne_solve` (N(w/(t-1), z) = c z),
  `rankOne_value` (2 c(w/(t-1)) - 1 = 1/(t-1)), `rankOne_solve_twin`, `rankOne_value_twin`,
  `rankOne_nondegenerate` (Q non-degenerate, t != 1 => N non-degenerate), `nonpos_of_nonneg` (Q >= 0, t <= 1 => N <= 0).
DIFFERENCES: coordinate-free; "Q^-1 c" is "a vector w with Q(w, .) = c" (for an invertible matrix: w = Q^-1 c, unique);
  "N^-1 c = w/(t-1)" is stated as "N(w/(t-1), .) = c"; "N invertible" as "N non-degenerate" (same thing in finite
  dimension). No finite dimension used. GAP: none.

### FILE 7 DONE: `RHFormal/B25_Folding.lean`  (board B92 "B25: the folding identity"; finite form of T74 / D5; step of F3, F4)
INFORMAL: K real symmetric on {-n..-1} u {1..n} with K(i,j) = K(-i,-j); f_e(+-i) = phi_i, f_o(+-i) = +-phi_i. Then
  f_e^T K f_e - f_o^T K f_o = 4 sum_{i,j>0} phi_i phi_j K(i,-j), f_e^T K f_e + f_o^T K f_o = 4 sum_{i,j>0} phi_i phi_j K(i,j).
LEAN (namespace RHFormal.B25; index set ι ⊕ ι, inl i = +i, inr i = -i; hK : ∀ a b, K (swap a) (swap b) = K a b):
  `quad_even`, `quad_odd`, `quad_even_sub_odd`, `quad_even_add_odd`.
DIFFERENCES: symmetry of K is NOT a hypothesis (not needed). This is the FINITE (matrix) form of T74; the continuum
  statement of T74 (integrals over (0, L], the exponential sums E_+, E_m, the m = 0 cancellation, the prime atoms)
  is NOT formalised. GAP: none.

### FILE 8 DONE: `RHFormal/B32_NegativeSubspaceDim.lean`  (board B92, Step 2 of Theorem 4 of PROOF_parity_index.md; part of T29)
INFORMAL: on a real vector space, if Q = Q+ + sum_{i=1..nu} m_i (a_i^2 - b_i^2), Q+ >= 0, m_i > 0, a_i, b_i linear, then
  every subspace on which Q is negative definite has dimension <= nu.
LEAN (namespace RHFormal.B32): `finrank_le_of_negDef`: ... (W : Submodule ℝ V) (hW : ∀ x ∈ W, x ≠ 0 → Q x < 0) :
  FiniteDimensional ℝ W ∧ Module.finrank ℝ W ≤ ν;  `b_injective`: x ↦ (b_i x)_i is injective on W.
DIFFERENCES: none in content; Q+ is any non-negative FUNCTION (no quadratic structure needed); any dimension. GAP: none.

### FILE 9 DONE: `RHFormal/HankelPowerSums.lean`  (lead's list; board B82 (b); Corollary 3 of PROOF_mirror_criterion.md; part of T77)
INFORMAL: alpha_1..alpha_r distinct non-zero reals, m_j non-zero reals, s_k = sum_j m_j alpha_j^k, n >= r, H = [s_(i+j)]_{i,j=1..n}:
  (i) x^T H x = sum_j m_j P_x(alpha_j)^2, P_x(z) = sum_i x_i z^i; (ii) H >= 0 iff every m_j > 0; (iii) #negative eigenvalues = #{m_j < 0}.
LEAN (namespace RHFormal.Hankel; `powerSum m α k = ∑ j, m j * α j ^ k`, `genPoly e x z = ∑ i, x i * z ^ e i`,
  `hankelForm m α e x = ∑ i, ∑ j, x i * powerSum m α (e i + e j) * x j`):
  `hankelForm_eq` (i) for ANY finite index types and ANY exponent map e : ι → ℕ, any reals m, α;
  `hankelForm_nonneg` (m >= 0 => form >= 0: "the Hankel matrix of power sums of real roots is a Gram matrix");
  `exists_interp` (interpolation, exponents 1..n); `nonneg_of_hankelForm_nonneg`; `hankelForm_nonneg_iff` (ii).
DIFFERENCES: (i) and the Gram direction are MORE general (any exponents, no distinctness). (ii) exactly as stated
  (exponents i+1, i : Fin n). NOT formal: (iii), the complex-root clause of T77, the direct-sum-over-primes clause of T77
  (that part is file 1). GAP: none.

### FILE 10 DONE: `RHFormal/T45_FirstOrderCaps.lean`  (T45; board B58 Fact 1, Fact 3; live route #9)
INFORMAL: see THEORY.md T45. Q^(delta)(f) = Q(f) - 2 delta n^(-1/2) G_f; if Q^(delta) >= 0 on a parity class and f in it
  has Q(f) = mu and G_f > 0 (resp. < 0) then delta <= mu sqrt(n)/(2 G_f) (resp. delta >= -mu sqrt(n)/(2|G_f|)).
  Fact 1: phi supported in (0, L], u >= L => phi(x) phi(x+u) = 0.
LEAN (namespace RHFormal.T45): `trial_bound`, `cap_upper`, `cap_lower` (with a weight w > 0), `cap_upper_sqrt`,
  `cap_lower_sqrt` (w = 1/√n), `support_shift` (Fact 1).
DIFFERENCES: only the DEDUCTION is formal. The identity Q^(delta)(f) = Q(f) - 2 delta n^(-1/2) G_f is the hypothesis
  (it is the definition of the perturbed form); trial vectors are an arbitrary set with a subclass S ("even", "odd").
  Neither "Q v = mu v" nor "|v| = 1" is needed, only the value Q(f) = mu. The signs of G (T46) are hypotheses. GAP: none.

### FILE 11 DONE: `RHFormal/T26_ParityDecomposition.lean`  (T26; PROOF_parity_index.md Lemma 1; live routes #8, #9)
INFORMAL: R f(x) = f(-x). (i) q(Rf, Rh) = q(f, h) => q(f_e, h_o) = 0 and q(f) = q(f_e) + q(f_o).
  (ii) P(f) = 2<f_e,c>^2 - 2<f_o,s>^2 for real f (P(f) = 2<f,e^{x/2}><f,e^{-x/2}>, c = cosh(x/2), s = sinh(x/2)).
LEAN (namespace RHFormal.T26; V real vector space, R : V →ₗ V with hR : ∀ f, R (R f) = f, evenPart = (f + Rf)/2,
  oddPart = (f - Rf)/2): `evenPart_add_oddPart`, `R_evenPart`, `R_oddPart`, `cross_eq_zero`, `cross_eq_zero'`,
  `form_eq_even_add_odd`, `pole_eq` (2 p(f) p(Rf) = 2 c(f_e)^2 - 2 s(f_o)^2 with c = (p + p∘R)/2, s = (p - p∘R)/2),
  `cosh_sinh_parts`.
DIFFERENCES: linear algebra only. That the concrete forms P, A, Pi, N, Q are R-invariant, and that
  <f, e^{-x/2}> = <Rf, e^{x/2}>, are hypotheses (integral changes of variable, not formalised). Real case only. GAP: none.

### FILE 12 DONE: `RHFormal/T32_InertiaRankOne.lean`  (T32; board B56, B92; live route #9; nominated by S1-parity)
INFORMAL: see THEORY.md T32: pos(N_e) = neg(Q_e) + [t_e > 1], pos(N_o) = neg(Q_o) - [t_o < -1], for Q blocks invertible,
  t_e != 1, t_o != -1, N_e = 2cc^T - Q_e, N_o = -2ss^T - Q_o.
LEAN (namespace RHFormal.T32):
  `NegDim q k := ∃ W : Submodule ℝ V, FiniteDimensional ℝ W ∧ k ≤ finrank ℝ W ∧ ∀ x ∈ W, x ≠ 0 → q x < 0`  ("neg(q) >= k"),
  `PosDim q k` likewise with 0 < q x.  With Q symmetric bilinear, c linear, w with Q(w,.) = c, t = 2 c(w):
  `even_le` (t ≤ 1): ∀ k, NegDim (Q x x) k ↔ PosDim (2 c(x)^2 - Q x x) k
  `even_gt` (t > 1): ∀ k, NegDim (Q x x) k ↔ PosDim (2 c(x)^2 - Q x x) (k+1)
  `odd_gt` (t > -1): ∀ k, NegDim (Q x x) k ↔ PosDim (-2 c(x)^2 - Q x x) k
  `odd_le` (t ≤ -1): ∀ k, NegDim (Q x x) (k+1) ↔ PosDim (-2 c(x)^2 - Q x x) k
  plus the tools: `negDim_of_map`, `negDim_of_pullback`, `negDim_sumForm_of_nonneg`, `negDim_sumForm_of_neg`
  (adding a 1-dimensional form d y^2 changes neg by [d < 0]), `negDim_congruence`.
DIFFERENCES:
  - indices = largest dimension of a definite subspace (S1-parity's formulation of B92), not eigenvalue counts; the
    identification with eigenvalue counts in finite dimension is Sylvester's law (`known`, not formalised).
  - MORE GENERAL than T32: any dimension; invertibility of Q NOT assumed (only existence of w with Q w = c);
    the excluded cases t_e = 1 and t_o = -1 ARE covered (t_e = 1 behaves like t_e < 1, t_o = -1 like t_o < -1).
  - both halves (even AND odd) are machine-checked; the keeper noted the odd half had been written out only by K-theory.
  - the parity structure is not in the file (apply it to each block).
GAP IN THE WRITTEN PROOF: none. (Remark for the keeper: T32's hypotheses "invertible", "t_e != 1", "t_o != -1" can be
  weakened as above.)

### FILE 13 DONE: `RHFormal/T50_FibreClassesCount.lean`  (T50 = Lemma A, the COUNT; what B32 / T61 use)
INFORMAL: (number of positive eigenvalues of Ntilde) = 1 + (number of negative eigenvalues of Q).
LEAN (namespace RHFormal.T50): `negDim_weil_iff_posDim_Ntilde`: ∀ k, NegDim (weil N p q) k ↔ PosDim (fun x => Ntilde N p q x x) (k+1);
  `posDim_Ntilde_one`: PosDim Ntilde 1.  (V any real vector space; no symmetry of N needed for this statement.)
DIFFERENCES: indices as in file 12. NOT formal: the equality of the numbers of ZERO eigenvalues. GAP: none.

### FILE 14 DONE: `RHFormal/T27_KappaInequalities.lean`  (T27; PROOF_parity_index.md Prop. 3 (b), (c))
INFORMAL: kappa_-(Q_even) <= kappa_+(N_even); kappa_-(Q_odd) <= kappa_+(N_odd) + 1; kappa_-(Q) <= kappa_+(N) + 1;
  'kappa_+(N) <= 1' implies kappa_-(Q) <= 2.
LEAN (namespace RHFormal.T27; Q, N : V → ℝ any functions, c, s linear functionals):
  `even` (N = 2c^2 - Q): NegDim Q k → PosDim N k;  `odd` (N = -2s^2 - Q): NegDim Q (k+1) → PosDim N k;
  `full` (Q = 2c^2 - 2s^2 - N): NegDim Q (k+1) → PosDim N k;  `at_most_two`: ¬ PosDim N 2 → ¬ NegDim Q 3.
DIFFERENCES: real forms (not hermitian); kappa >= k witnessed by a finite-dimensional definite subspace. The Lean
  proof of `full` cuts by the one functional s and does not use the parity blocks, so the step the checker called
  "unwritten" (kappa_-(Q) <= kappa_-(Q_e) + kappa_-(Q_o)) is not needed. GAP: none.

### 00:43 sanity check of the pipeline
A scratch file (outside the repo) stating `even_gt` WITHOUT the +1 was rejected by Lean (type mismatch), and
`#print axioms RHFormal.T32.even_gt` gives [propext, Classical.choice, Quot.sound] (the three standard axioms of
Lean/mathlib; no `sorryAx`, no extra axiom).

### FILE 15 DONE: `RHFormal/B2_BochnerPathForm.lean`  (Theorem B (B2) of PROOF_bochner_parity.md; part of T64)
INFORMAL: for any chain with constant total rate,
  Gamma_2(f)(x) = (1/2)(Lf(x))^2 + (1/2) sum_{y,z} q_xy q_yz [(f_z - f_y)^2 - (1/2)(f_z - f_x)^2].
LEAN (namespace RHFormal.B2; W a Finset of sites in any type G, q : G → G → ℝ any real rates;
  `genOn W q f x = ∑ y ∈ W, q x y * (f y - f x)`, `carreOn W q f g x = (1/2) * ∑ y ∈ W, q x y * ((f y - f x) * (g y - g x))`,
  `gamma2On W q f x = (1/2) * genOn W q (carreOn W q f f) x - carreOn W q f (genOn W q f) x`):
  `path_form`: (hR : ∀ x ∈ W, ∑ y ∈ W, q x y = R) → x ∈ W → gamma2On W q f x = (1/2) * (genOn W q f x)^2
     + (1/2) * ∑ y ∈ W, ∑ z ∈ W, q x y * q y z * ((f z - f y)^2 - (1/2) * (f z - f x)^2).
DIFFERENCES: none. No sign or symmetry of q is used; the total rate includes the self-jump q x x. GAP: none.

### FILE 16 DONE: `RHFormal/B3_ThreeWaySplit.lean`  (Theorem B (B3); S1-curv's FIRST nomination, board B98; part of T64)
INFORMAL (B98): W = {0..M-1}; k even, k(0) = 0; u > 0 on W; q(x,y) = k(y-x)u(y)/u(x); sum_y q(x,y) = R for all x. Then
  Gamma_2(f)(x) = (1/4) sum_{x+a,x+b,x+a+b in W} k(a)k(b) rho (f(x+a+b)-f(x+a)-f(x+b)+f(x))^2
   + (1/2) sum_{x+a,x+b in W} k(a)k(b) [u(x+a)u(x+b)/u(x)^2 - rho 1(x+a+b in W)] (f(x+a)-f(x))(f(x+b)-f(x))
   + (1/2) sum_{x+a,x+a+b in W, x+b not in W} k(a)k(b) rho [(f(x+a+b)-f(x+a))^2 - (1/2)(f(x+a+b)-f(x))^2],  rho = u(x+a+b)/u(x).
LEAN (namespace RHFormal.B3; G any additive commutative group, W A : Finset G with hA : ∀ x ∈ W, ∀ y ∈ W, y - x ∈ A,
  `rate k u x y = k (y - x) * u y / u x`; `sqTerm`, `hessTerm`, `openTerm` = the three summands with their conditions as `if`):
  `three_way_split`: (hu : ∀ x ∈ W, u x ≠ 0) → (hR : ∀ x ∈ W, ∑ y ∈ W, rate k u x y = R) → x ∈ W →
     gamma2On W (rate k u) f x = (1/4) * ∑ a ∈ A, ∑ b ∈ A, sqTerm W k u f x a b
        + (1/2) * ∑ a ∈ A, ∑ b ∈ A, hessTerm W k u f x a b + (1/2) * ∑ a ∈ A, ∑ b ∈ A, openTerm W k u f x a b.
  Steps: `sum_shift` (re-indexing by shifts), `gen_shift`, `gen_sq_shift`, `path_shift`, `pathTerm_eq` (closed + open),
  `closedTerm_symm` (the symmetrisation a <-> b of closed paths).
DIFFERENCES (all in the direction of generality):
  - W any finite subset of any abelian group, A any finite set of shifts containing W - W;
  - u ≠ 0 on W instead of u > 0; evenness of k NOT used; k(0) = 0 NOT used, because the sums include a = 0 and b = 0
    (with k(0) = 0 those terms vanish and the sums are the informal sums over a, b ≠ 0);
  - the total rate includes the term y = x.
RESULT FOR THE SEAT: the three sums are right, INCLUDING the third (open-path) sum the seat says it missed in its
  first draft. No gap in the written derivation from (B2).

### 00:52 intermediate FULL BUILD (16 files): `Build completed successfully (3157 jobs).`  no error, no `sorry`;
the only warnings are lake's "imports ... which is designed for use with the module system; consider adding `module`"
(one per import line, 52 of them; harmless, they concern the new module system and not the proofs).

### FILE 17 DONE: `RHFormal/T33_MarginSign.lean`   *** A FALSE SENTENCE FOUND IN A `checked` ENTRY (T33) ***
The FORMULAS of T33 / F1 are formal in file 6 (`rankOne_value`: 2 c^T N_e^-1 c - 1 = 1/(t_e - 1);
`rankOne_value_twin`: 1 - 2 s^T (-N_o)^-1 s = 1/(1 + t_o); `rankOne_nondegenerate`).
STATEMENT UNDER TEST (THEORY.md T33, last sentence): "In particular, when a Weil block is positive definite the
  corresponding margin is strictly positive: the sum rules are never exactly saturated on such a window."
  Same claim in s1_seminar/curv/S1_ADDITIONS.md F1, consequence (a): "On a window where the Weil block is strictly
  positive both margins are STRICTLY positive resp. in (0,1)".
WHAT LEAN PROVES:
  - odd block: TRUE. `odd_margin_mem`: Q >= 0, Q w = s  =>  0 < 1/(1 + t_o) <= 1.
  - even block: FALSE as worded. `even_margin_pos_iff`: 0 < 1/(t_e - 1) <=> t_e > 1.
    `even_margin_counterexample`: V = R, Q(x,y) = xy (positive definite), c(x) = x/2, w = 1/2: t_e = 1/2, N_e = -1/2,
    even margin 2 c^T N_e^-1 c - 1 = -2 < 0.
    True instead: `even_margin_ne_zero` (the margin is never 0 when t_e != 1) and positivity exactly when t_e > 1,
    i.e. (by T32 = file 12) exactly when N_e has a positive direction.
  - This is not only abstract: the numbers recorded under T32 are t_e = 0.198 and 0.842 at L = 0.05 and 0.10, where
    the even Weil block is positive definite; so for zeta the even margin is NEGATIVE on those windows (-1.2468 and
    -6.2291 in the seat's own log), contradicting the sentence.
  - The seat's file contradicts itself here: consequence (b) of the same F1 says "Even margin > 0 iff t_e > 1 iff
    lambda_1 > 0 (given Q_e > 0). For lambda_1 < 0 (zeta: L <= 0.10) ... 1/(t_e - 1) < 0". So (b) is right, (a) is
    wrong for the even block, and T33 copied (a).
CONSEQUENCE: nothing downstream breaks that I can see (T34 (A1) already carries the hypothesis "N_e has at least one
  positive eigenvalue"). The fix is one clause: in T33 replace "the corresponding margin is strictly positive" by
  "the odd margin lies in (0, 1]; the even margin is non-zero, and positive iff t_e > 1 (iff N_e has a positive
  direction)". Posted on the board as a QUESTION to S1-curv (author of F1); to be raised as an objection if it stands.

### FILE 18 DONE: `RHFormal/T44_InteriorUnderGap.lean`  (T44, the DEDUCTION only; live route #9)
INFORMAL: assume RH, fix L; for every atomic D = sum_j d_j (delta_{u_j} + delta_{-u_j}) with 2 sum |d_j| <= lambda_L:
  Q(f) + sum_j d_j (g_f(u_j) + g_f(-u_j)) >= 0 on Dom_L.
LEAN (namespace RHFormal.T44; E a real inner product space): `atom_bound`: ‖U f‖ ≤ ‖f‖ → |d * (⟪f, U f⟫ + ⟪U f, f⟫)| ≤ 2 |d| ‖f‖^2;
  `perturbed_nonneg`: (∀ j f, ‖U j f‖ ≤ ‖f‖) → (∀ f, lam * ‖f‖^2 ≤ Q f) → 2 * ∑ j ∈ s, |d j| ≤ lam →
     0 ≤ Q f + ∑ j ∈ s, d j * (⟪f, U j f⟫ + ⟪U j f, f⟫).
DIFFERENCES: the two analytic inputs are HYPOTHESES: (1) Q f >= lam ‖f‖^2 (under RH with lam = lambda_L > 0: T10, T36,
  not formalisable soon); (2) g_f(u) = <f, S_u f> with S_u norm non-increasing. So T44 itself stays conditional on
  T36/T10; what is formal is that nothing else is needed. GAP: none.

### FILE 19 DONE: `RHFormal/T35_MonotoneGroundState.lean`  (T35, the one line; live route #8)
INFORMAL: lambda_a = inf{Q(v)/||v||^2 : v in Dom_a, v != 0} is non-increasing in a.
LEAN (namespace RHFormal.T35): `sInf_antitone`: D increasing in a, F bounded below on each F '' D b, D a non-empty,
  a ≤ b → sInf (F '' D b) ≤ sInf (F '' D a).
DIFFERENCES: the nestedness Dom_a ⊆ Dom_b and the lower bound of the form are hypotheses (T10, `known`). GAP: none.

### FILE 20 DONE: `RHFormal/T75_TwoSidedMirrorBound.lean`  (T75 in FINITE form; depends on file 7)
INFORMAL: [N(f) <= 2<f,c>^2 for all even f] <=> [H(phi) <= 4c^2 - T(phi) for all phi]; [N(f) <= -2<f,s>^2 for all odd f]
  <=> [H(phi) >= 4s^2 + T(phi) for all phi].
LEAN (namespace RHFormal.T75; setting of file 7; `shiftForm K φ = ∑ φ_i φ_j K(i,j)`, `mirrorForm K φ = ∑ φ_i φ_j K(i,-j)`):
  `quad_even_eq`: N(f_e) = 2 (T + H); `quad_odd_eq`: N(f_o) = 2 (T - H); `pair_even`: <f_e, C> = 2 ∑ φ_i C(i) for even C;
  `pair_odd`: <f_o, S> = 2 ∑ φ_i S(i) for odd S; `even_block_iff`, `odd_block_iff`: the two equivalences, for each φ.
DIFFERENCES: finite (matrix) form only, stated vector by vector; the continuum statement (L^2(0, L], integrals, atoms) is
  not formalised. GAP: none.

### FILE 21 DONE: `RHFormal/T63_GroundStateTransform.lean`  (T63; Theorem A (A0) of PROOF_bochner_parity.md)
INFORMAL: N symmetric, N_xy >= 0 off the diagonal, irreducible, u > 0 the Perron vector, N u = lambda_1 u:
  <uh, N uh> = lambda_1 ||h||_pi^2 - E(h), E(h) = (1/2) sum_{x != y} N_xy u_x u_y (h_x - h_y)^2; consequently N has at most
  one positive eigenvalue iff E(h) >= lambda_1 ||h||_pi^2 for all h of pi-mean zero.
LEAN (namespace RHFormal.T63; N : Matrix W W ℝ symmetric, hu : ∀ x, ∑ y, N x y * u y = lam * u x):
  `ground_state_sum`, `ground_state_identity`: toBilin' N (u*h) (u*h) = lam * ∑ x, u x^2 * h x^2 - dirichlet N u h;
  `atMostOnePos_iff_poincare` (u > 0, lam > 0): AtMostOnePos (toBilin' N) ↔
     ∀ h, ∑ x, u x^2 * h x = 0 → lam * ∑ x, u x^2 * h x^2 ≤ dirichlet N u h.
DIFFERENCES: MORE general: the identity uses only symmetry and N u = lam u (any eigenpair, no signs, no irreducibility,
  no normalisation); the equivalence needs only u > 0 and lam > 0 in addition. "At most one positive eigenvalue" is
  `AtMostOnePos`. E is the sum over all pairs (the diagonal pairs contribute 0). The clause about the spectral gap of the
  jump process is not formalised. GAP: none.

### 00:56 board: question B157 (S1-socrates -> FORMAL) and nominations B176 (S1-mirror), B182 (S1-cubic)
Answered B157 in B187: mathlib v4.35.0 has NO Perron-Frobenius theorem (only LinearAlgebra/Matrix/Irreducible/Defs.lean:
definitions of irreducible / primitive non-negative matrices and "irreducible iff some power has a positive entry").

### FILE 22 DONE: `RHFormal/Perron_GroundState.lean`  (board B157 P1, P2, P3; B176 F-a, F-b, F-c; the Perron step of B109, B140)
INFORMAL (B157): (P1) M symmetric, M_ij <= 0 off the diagonal: x^T M x >= |x|^T M |x|. (P2) if moreover the graph of the
  non-zero off-diagonal entries is connected, every minimiser of x^T M x on the unit sphere has all entries of one strict
  sign, and the lowest eigenvalue is simple. (P3) psi > 0, psi^T M psi < 0, P >= 0 entrywise: M - tP is not PSD for t >= 0,
  and M + tP PSD forces t >= -psi^T M psi / psi^T P psi.
LEAN (namespace RHFormal.Perron; W a finite type, `form M x = ∑ i, ∑ j, x i * M i j * x j`, `normSq x = ∑ i, x i^2`):
  `form_abs_le` (P1): (∀ i j, i ≠ j → M i j ≤ 0) → form M |x| ≤ form M x.
  `psd_null`: B symmetric bilinear, B ≥ 0, B x x = 0 → B x y = 0 for all y.
  `eigen_of_ground`: M symmetric, (∀ y, lam * normSq y ≤ form M y), form M x = lam * normSq x → ∀ i, ∑ j, M i j * x j = lam * x i.
  `pos_of_nonneg_eigen`: off-diagonal ≤ 0, cut-connected, v ≥ 0, v ≠ 0, M v = lam v → ∀ i, 0 < v i.
  `ground_sign` (P2, first half): M symmetric, off-diagonal ≤ 0, cut-connected, lam a lower bound of the Rayleigh quotient,
     x ≠ 0 with form M x = lam * normSq x → (∀ i, 0 < x i) ∨ (∀ i, x i < 0).
  `ground_unique` (P2, second half): under the same hypotheses any minimiser y satisfies y = c x.
  `neg_of_trial`, `lower_bound_of_trial`, `form_nonneg_of_nonneg`, `form_pos_of_pos` (P3, F-c).
  cut-connected := ∀ S : Finset W, S.Nonempty → S ≠ univ → ∃ i ∈ S, ∃ j, j ∉ S ∧ M i j ≠ 0.
DIFFERENCES / HYPOTHESES LEAN MADE EXPLICIT:
  - P1 does not need symmetry of M. P2 does (minimiser => eigenvector).
  - "minimiser on the unit sphere" = a lower bound lam of y^T M y / |y|^2 that is attained at x ≠ 0. EXISTENCE of a
    minimiser (compactness) is NOT proved; the statements are about every minimiser. "The lowest eigenvalue is simple"
    is "any two minimisers are proportional".
  - connectedness is used in cut form (equivalent to connectedness of the graph of non-zero off-diagonal entries).
  - P3 is stated on the trial vector: psi^T M psi - t psi^T P psi < 0, and -psi^T M psi / psi^T P psi ≤ t; symmetry of
    P not needed.
  - S1-mirror's F-a is P1 for A = D - K - ss^T; F-b is P2 for that A (all s_i > 0 gives cut-connectedness); F-c is
    `lower_bound_of_trial` + `form_pos_of_pos`. These specialisations are NOT typed as separate theorems.
  - S1-cubic's step ('M symmetric, off-diagonal >= 0, irreducible, v > 0, M v = v, M^2 - M PSD => every eigenvalue other
    than the simple eigenvalue 1 is <= 0') is NOT yet typed; its ingredients are here (uniqueness of the ground state of
    I - M) and in file 21 (M <= I from the ground-state identity).
GAP: none found in the informal statements; the continuum versions (B140: nodeless ground state of the odd block on the
  no-prime window) need in addition existence of a minimiser and a continuum Perron argument, not formalised.

### FILE 23 DONE: `RHFormal/LemmaB_PerronStep.lean`  (Lemma B, Steps 4-5 of PROOF_trickle.md; part of T51; board B109)
INFORMAL (B109): 'M real symmetric, off-diagonal entries >= 0, irreducible, v > 0 entrywise with M v = v, and M^2 - M PSD
  => every eigenvalue of M other than the simple eigenvalue 1 is <= 0.'
LEAN (namespace RHFormal.LemmaB): `form_one_sub`; `form_le_normSq`: M symmetric, off-diagonal ≥ 0, M v = v, v > 0 →
  form M y ≤ normSq y (M ≤ I);  `perron_step`: in addition cut-irreducible and (∀ y, form M y ≤ ∑ i, (∑ j, M i j * y j)^2):
  for x ≠ 0 with M x = μ x:  μ ≤ 0 ∨ (μ = 1 ∧ ∃ c, ∀ i, x i = c * v i).
DIFFERENCES: eigenPAIR form (no list of eigenvalues with multiplicity); "M^2 - M PSD" written as y^T M y ≤ |M y|^2;
  "irreducible" in cut form. No Perron-Frobenius theorem is used (mathlib has none): M ≤ I comes from the ground-state
  identity (file 21), uniqueness from file 22. NOT formal: the last step of Lemma B ("so H has exactly one positive
  eigenvalue"), which needs the spectral theorem for symmetric matrices and Sylvester's law. GAP: none.

### FILE 24 DONE: `RHFormal/LemmaB_TrickleInequality.lean`  (Lemma B, Steps 1-3; part of T51)
INFORMAL: T symmetric 3-tensor, a > 0, H = sum_k a_k T_k, l_k = H e_k, s_k = (Ha)_k > 0, every slice with at most one
  positive eigenvalue => H <= H D H, D = diag(a_k/s_k).
LEAN (namespace RHFormal.LemmaB; `contract T a i j = ∑ k, a k * T i j k`, `slice T k = Matrix.of fun i j => T i j k`):
  `slice_apply_a` (Step 1), `slice_symm`, `slice_le` (Step 3 for one slice), `contract_form` (x^T H x = ∑ a_k x^T T_k x),
  `trickle_inequality`: T i j k = T j i k = T i k j, a ≥ 0, (∀ k, 0 < ∑ i, a i * H i k), every slice AtMostOnePos →
     ∑ i, ∑ j, x i * H i j * x j ≤ ∑ k, a k / (∑ i, a i * H i k) * (∑ i, x i * H i k)^2.
DIFFERENCES: a ≥ 0 suffices (not a > 0); s_k is written a^T T_k a = ∑_i a_i H_ik (equal to (Ha)_k by symmetry);
  "at most one positive eigenvalue" = AtMostOnePos. Hypothesis (B1) is not used here, as the written proof says. GAP: none.
STATE OF LEMMA B (T51) AS A WHOLE: Steps 1-3 formal (file 24), Step 2 formal (file 3), Steps 4-5 formal in eigenpair
  form (file 23); the final sentence "H has exactly one positive eigenvalue" is NOT formal (spectral theorem). So T51 is
  formal except for that last textbook step; do not mark it `formal` as a whole.

### FILE 25 DONE: `RHFormal/N2_RankOnePush.lean`  (board B182, S1-cubic's (N2))
INFORMAL: N symmetric, N + mu I invertible, B = -N: (B + t cc^T) psi = mu psi for some psi with c.psi != 0 <=>
  t c^T (N + mu I)^-1 c = 1, and then psi is a multiple of (N + mu I)^-1 c.
LEAN (namespace RHFormal.N2; A a bilinear form standing for N + mu I, non-degenerate in the first argument, w with A(w,.) = c):
  `push_iff`: (∃ ψ, c ψ ≠ 0 ∧ ∀ z, A ψ z = t * c ψ * c z) ↔ t * c w = 1;  `push_unique`: such ψ = (t * c ψ) • w.
DIFFERENCES: coordinate-free; symmetry not needed. S1-cubic's (N1) (edge form of interlacing) is NOT done: it needs
  existence of minimisers (compactness). GAP: none.

### FILE 26: `RHFormal/AxiomsAudit.lean`  (no mathematics: `#print axioms` for 50 main theorems; imported last)

### 01:04 FINAL FULL BUILD  `lake -d /home/user/ysolucki/rh/formal build`
Last lines of the output (lake's "consider adding `module`" warnings filtered out; they are the only warnings):
```
info: RHFormal/AxiomsAudit.lean:82:0: 'RHFormal.LemmaB.perron_step' depends on axioms: [propext, Classical.choice, Quot.sound]
info: RHFormal/AxiomsAudit.lean:83:0: 'RHFormal.LemmaB.trickle_inequality' depends on axioms: [propext, Classical.choice, Quot.sound]
info: RHFormal/AxiomsAudit.lean:84:0: 'RHFormal.N2.push_iff' depends on axioms: [propext, Classical.choice, Quot.sound]
info: RHFormal/AxiomsAudit.lean:85:0: 'RHFormal.N2.push_unique' depends on axioms: [propext, Classical.choice, Quot.sound]
✔ [3166/3167] Built RHFormal (2.4s)
Build completed successfully (3167 jobs).
```
- 50 theorems audited, all 50 on exactly [propext, Classical.choice, Quot.sound] (the standard axioms of Lean 4 / mathlib).
- 0 lines containing "error" or "sorry" in the build output; a text search of RHFormal/ for `sorry`, `axiom`,
  `native_decide`, `admit` finds nothing.
- RHFormal.lean imports 28 modules: the lead's 2 (Smoke, MathlibCheck), my 25 statement files, and AxiomsAudit.
- No file is in RHFormal/drafts/: nothing was left half-done.

### OPEN AT THE END OF SESSION 1
- Board question B177 (FORMAL -> S1-curv) about T33's last sentence: NOT yet answered when I stopped (asked 00:52, no post
  by any seat after it except mine). By the seminar rule it becomes an OBJECTION after the author's answer or one turn.
  The counterexample is machine-checked (`RHFormal.T33.even_margin_counterexample`), so it stands whatever the answer;
  the keeper should correct T33's last sentence (see FILE 17 above for the wording).
- No command was refused by the permission rules in this session.

### 01:06 CORRECTION TO MY OWN NOTES + FILE 27 DONE: `RHFormal/SignatureBridge.lean`
While writing MEMORY.md I checked my claim "mathlib has no Sylvester inertia statement" by a search: it is WRONG.
This mathlib has `Mathlib/LinearAlgebra/QuadraticForm/Signature.lean` (`QuadraticForm.sigPos`, `sigNeg` = the maximal
dimension of a positive / negative definite subspace; `sigPos_of_equiv_weightedSumSquares` = uniqueness part of Sylvester's
law of inertia) and `QuadraticForm/Real.lean` (existence part). The spectral theorem is in `Mathlib/Analysis/Matrix/Spectrum.lean`.
(Still true after the search: no Perron-Frobenius theorem.) I had built `PosDim` / `NegDim` by hand in file 12 without
knowing this. The bridge is now typed:
LEAN (namespace RHFormal.SignatureBridge; Q : QuadraticForm ℝ M, M finite-dimensional):
  `posDim_iff_le_sigPos`: T32.PosDim (fun x => Q x) k ↔ k ≤ QuadraticForm.sigPos Q;
  `negDim_iff_le_sigNeg`: T32.NegDim (fun x => Q x) k ↔ k ≤ QuadraticForm.sigNeg Q.
MEANING: in finite dimension the indices used in files 12, 13, 14 (T32, T50, T27) ARE mathlib's signature, for which
Sylvester's law is machine-checked in mathlib. What remains between those files and the words "number of positive
eigenvalues of a real symmetric matrix" is one step: the spectral theorem provides a diagonalisation (a weighted sum of
squares with the eigenvalues as weights). That step is not typed. The files 12-14 themselves are stated for plain
functions / bilinear forms, not for `QuadraticForm`; restating them with `sigPos`/`sigNeg` is a next-session job.

### 01:06 FINAL FULL BUILD (supersedes the 01:04 one)  `lake -d /home/user/ysolucki/rh/formal build`
```
info: RHFormal/AxiomsAudit.lean:86:0: 'RHFormal.N2.push_unique' depends on axioms: [propext, Classical.choice, Quot.sound]
info: RHFormal/AxiomsAudit.lean:87:0: 'RHFormal.SignatureBridge.posDim_iff_le_sigPos' depends on axioms: [propext, Classical.choice, Quot.sound]
info: RHFormal/AxiomsAudit.lean:88:0: 'RHFormal.SignatureBridge.negDim_iff_le_sigNeg' depends on axioms: [propext, Classical.choice, Quot.sound]
✔ [3174/3175] Built RHFormal (2.3s)
Build completed successfully (3175 jobs).
```
52 theorems audited, all on [propext, Classical.choice, Quot.sound]; 0 lines with "error" or "sorry"; the only warnings
are lake's "consider adding `module`". RHFormal.lean imports 29 modules: Smoke, MathlibCheck (the lead's), 26 statement
files of mine, AxiomsAudit.

### 01:08 board, last actions
- B192 (note): the correction about mathlib's signature file and the bridge.
- B193 (OBJECTION, FORMAL -> S1-curv, re B177): the author posted B183-B185 at 00:56 without answering B177, so one turn
  had passed; the objection to F1 (a) / T33's last sentence is now on the board with the machine-checked counterexample
  and the proposed wording. Supersedes the line "NOT yet answered" in "OPEN AT THE END OF SESSION 1" above.
- No question addressed to FORMAL is open (B157 answered in B187, result in B189).


## Session 2 (2026-11-11, from 04:37 UTC): the finite cores of SP-sieve's copy barrier
Source of all five: `rh/specialists/sieve/COPY_BARRIER.md` (SP-sieve, session 3), section 6 "Finite cores nominated
for Lean", and the coordinator's list L1-L5. No theory numbers exist for them yet, so the files are named `CB_L<k>_...`.
Board s1: S1-curv answered B177/B193 in B198: ACCEPTS the objection, corrected S1_ADDITIONS.md F1 (a) to my wording, and
asks the keeper to correct T33's last sentence the same way (also B28(1) carries the same error for the even margin).
Both boards s1 and s2 are CLOSED, so the session-2 results below are NOT posted on a board; they are here and in MEMORY.md.

### FILE 28 DONE: `RHFormal/CB_L4_AmplifierArithmetic.lean`  (L4; Theorem 3 arithmetic)
INFORMAL (L4): for H >= D >= 1, H D/(3 sqrt H) >= D^(3/2)/3 (so x^2 C <= H D with C <= 3 sqrt H never yields x^2 < D^(3/2)/3).
  (Theorem 3) inf over H >= D^(1-eps0) of H D^(1+eps)/H^(1/2) = D^(3/2 - eps0/2 + eps), |A_1| << D^(3/4 - eps0/4 + eps);
  general form 1 - delta/2.
LEAN (namespace RHFormal.CB.L4; reals, rpow):
  `amplifier_floor`: 1 ≤ D ≤ H, 0 < C ≤ 3 √H → D √D / 3 ≤ H D / C.
  `amplifier_floor_bound`: ... → H D / C ≤ y → D √D / 3 ≤ y.
  `exponent_floor`: 1 ≤ D, D^(1-ε₀) ≤ H → D^(3/2 - ε₀/2 + ε) ≤ H D^(1+ε) / H^(1/2).
  `exponent_floor_attained`: equality at H = D^(1-ε₀) (D > 0).  `sqrt_exponent`: (D^(3/2-ε₀/2+ε))^(1/2) = D^(3/4-ε₀/4+ε/2).
  `delta_floor`: 1 ≤ D ≤ H, 0 < C ≤ H^δ, δ ≤ 1 → D^(2-δ+ε) ≤ H D^(1+ε) / C.
DIFFERENCES: none in L4. In Theorem 3's wording, the square root of D^(3/2 - eps0/2 + eps) is D^(3/4 - eps0/4 + eps/2):
  the file's "+ eps" should be "+ eps/2" (harmless: eps is arbitrary). The factor 2 and O(eta^2 D^2) are not in these
  statements (they only add to the bound). GAP: none.

### FILE 29 DONE: `RHFormal/CB_L3_GramLowerBound.lean`  (L3 and Theorem 1)
INFORMAL: Delta(F, D) least constant with sum_{chi in F} |sum_n a_n chi(n)|^2 <= Delta sum |a_n|^2 for ALL a; eta-copy:
  chi(n) = 1_{(n,r)=1}, sum_{p|r} 1/p <= eta. Theorem 1: Delta >= (1 - 2eta)^2 C_eta D for 0 <= eta < 1/2 (the (1-2eta)^2
  "covers members that are 1 off the multiples and arbitrary on them"). L3: Re sum_n v_i(n) >= (1-2eta) D for C vectors
  => ||V||^2 >= (1-2eta)^2 C D.
LEAN (namespace RHFormal.CB.L3; members v : ι → α → ℂ, ι a finite type, so multiplicity is allowed):
  `delta_ge_of_test`: N non-empty Finset, Cs : Finset ι, 0 ≤ c, (∀ i ∈ Cs, c |N| ≤ Re ∑_{n∈N} v i n),
     (∀ a, ∑_i ‖∑_{n∈N} a n * v i n‖^2 ≤ Δ ∑_{n∈N} ‖a n‖^2) → c^2 |Cs| |N| ≤ Δ.
  `opNorm_sq_ge`: V : EuclideanSpace ℂ α →L[ℂ] EuclideanSpace ℂ ι with (V a) i = ∑_n a n * v i n, same hypotheses on Cs
     → c^2 |Cs| |α| ≤ ‖V‖^2.
  `card_not_coprime_le`: r ≠ 0 → #{n ∈ (0, D] : ¬ coprime n r} ≤ ∑_{p ∈ r.primeFactors} D / p.
  `card_not_coprime_le_real`, `card_coprime_add`.
  `exact_copy_sum_ge`: r ≠ 0, ∑_{p | r} 1/p ≤ η → (1 - η) D ≤ #{n ∈ (0, D] : coprime n r}.
  `near_copy_re_sum_ge`: in addition v n = 1 on coprime n, ‖v n‖ ≤ 1 → (1 - 2η) D ≤ Re ∑_{n ∈ (0,D]} v n.
  `theorem1`: D ≥ 1, η ≤ 1/2, every i ∈ Cs has r i ≠ 0, ∑_{p | r i} 1/p ≤ η, v i = 1 on (n, r i) = 1, ‖v i n‖ ≤ 1, Δ
     admissible → (1 - 2η)^2 |Cs| D ≤ Δ.
  `theorem1_exact`: exact copies (v i n = 1_{(n, r i)=1}), η ≤ 1 → (1 - η)^2 |Cs| D ≤ Δ.
DIFFERENCES: over ℚ only (number-field variant with N(p) not done). "Least constant" not needed (bound holds for every
  admissible Δ). η < 1/2 used as η ≤ 1/2. For EXACT copies the constant (1 - η)^2 is proved, which is better than the
  file's (1 - 2η)^2; the file's (1 - 2η)^2 is proved for the "1 off the multiples, arbitrary of modulus <= 1 on them"
  members, exactly as the file says. r ≠ 0 is an explicit hypothesis (r = 0 would make every n > 1 non-coprime).
  The Remark on multiplicities is not done. GAP: none.

### FILE 30 DONE: `RHFormal/CB_L5_CharacterOrthogonality.lean`  (L5)
INFORMAL: for q > 2D and any a on [1, D], sum_{chi mod q} |sum a_n chi(n)|^2 = phi(q) sum_{(n,q)=1} |a_n|^2.
LEAN (namespace RHFormal.CB.L5; DirichletCharacter ℂ q, q ≠ 0):
  `inv_apply_unit`: χ⁻¹ b = χ b⁻¹ for a unit b.
  `sum_char_mul_conj`: ∑_χ χ a * conj (χ b) = if IsUnit b ∧ a = b then φ(q) else 0
     (from mathlib's `DirichletCharacter.sum_char_inv_mul_char_eq` and `MulChar.star_apply'`).
  `sum_norm_sq_eq`: D < q → ∑_χ ‖∑_{n∈(0,D]} a n * χ n‖^2 = φ(q) * ∑_{n∈(0,D], coprime n q} ‖a n‖^2.
DIFFERENCE: hypothesis q > 2D WEAKENED to q > D (all that is used: distinct n, m in [1, D] are distinct mod q). (q ≥ D
  would also suffice, since n = q has χ(q) = 0 and is not coprime to q; not typed.) GAP: none.
mathlib needed `Mathlib.RingTheory.RootsOfUnity.AlgebraicallyClosed` for the instance HasEnoughRootsOfUnity ℂ _.

### FILE 31 DONE: `RHFormal/CB_L1_Squarefull.lean`  (L1)
INFORMAL: #{n <= X : n squarefull} <= zeta(3/2) sqrt(X) (or the cruder 3 sqrt(X)), via n = a^2 b^3, b squarefree.
LEAN (namespace RHFormal.CB.L1; `Squarefull n := 0 < n ∧ ∀ p prime, p ∣ n → p^2 ∣ n`; X : ℕ):
  `squarefull_decomp`: Squarefull n → ∃ a b, 0 < a ∧ 0 < b ∧ Squarefree b ∧ n = a^2 * b^3.
  `card_le_sqrt_div`: 1 ≤ b → #{a ∈ [1,X] : a^2 b^3 ≤ X} ≤ √X / (b √b).
  `step`, `sum_range_le` (∑_{k<B} 1/((k+1)√(k+1)) ≤ 3 - 2/√B), `sum_inv_le` (∑_{b=1}^{B} 1/(b √b) ≤ 3).
  `card_squarefull_le_pairs`, `card_pairs_eq`.
  `card_squarefull_le_three`: #{n ∈ [1,X] : Squarefull n} ≤ 3 √X.
  `card_squarefull_le_tsum`: ... ≤ (∑' n : ℕ, 1 / n^(3/2)) √X.
  `tsum_eq_zeta`: riemannZeta (3/2) = ↑(∑' n : ℕ, 1 / n^(3/2));  `card_squarefull_le_zeta`: ... ≤ Re ζ(3/2) · √X.
DIFFERENCES: X a natural number (for real X apply it at ⌊X⌋). Uniqueness of n = a^2 b^3 is NOT used (the pair count
  is an upper bound), nor is "b squarefree" in the count; the decomposition lemma does provide b squarefree. Both
  constants of L1 (3 and ζ(3/2)) are formal. GAP: none. Consistency with the seat's COMPUTED values: 2.158 √X at X = 1e12
  is below 3 and below ζ(3/2) = 2.612.

### FILE 32 DONE: `RHFormal/CB_L2_KernelCopies.lean`  (L2; kernel lemma of Theorem 2; counting with P_0)
INFORMAL: kernel lemma: psi_u principal => m_p | v_p(u) (from psi_(u,p) = psi_(p,p)^(v_p(u))). L2: m : primes -> N_{>=2},
  n a copy if m(p) | v_p(n) for all p; then every copy is squarefull, #{copies <= X} <= 3 sqrt(X); with P_0 finite:
  <= 3 sqrt(X) prod_{p in P_0} (1 - p^(-1/2))^(-1).
LEAN (namespace RHFormal.CB.L2; `IsCopy m n := 0 < n ∧ ∀ p prime, m p ∣ n.factorization p`):
  `kernel_lemma`: groups G p, elements g p, 0 < u, (∀ p prime, g p ^ v_p(u) = 1) → IsCopy (fun p => orderOf (g p)) u.
  `exp_zero_or_two_le`, `squarefull_of_copy`: (∀ p prime, m p ≠ 1) → IsCopy m n → Squarefull n.
  `card_copies_le_three`: #{n ∈ [1,X] : IsCopy m n} ≤ 3 √X;  `card_copies_le_zeta`: ≤ Re ζ(3/2) √X.
  `partIn`, `partOut` (P₀-part and P₀-free part via Finsupp.filter of n.factorization), `partIn_mul_partOut`,
  `factorization_partIn`, `factorization_partOut`.
  `copy_decomp`: (∀ p prime, p ∉ P₀ → m p ≠ 1) → IsCopy m n → partIn P₀ n ∈ Nat.factoredNumbers P₀ ∧ Squarefull (partOut P₀ n).
  `invSqrt : ℕ →* ℝ` (n ↦ n^(-1/2)), `sum_factored_le` (Euler product, mathlib
  `EulerProduct.summable_and_hasSum_factoredNumbers_prod_filter_prime_geometric`), `sqrt_div_le`.
  `card_copies_le_euler`: (∀ p prime, p ∉ P₀ → m p ≠ 1) → #{n ∈ [1,X] : IsCopy m n} ≤ 3 √X ∏_{p ∈ P₀, prime} (1 - p^(-1/2))⁻¹.
DIFFERENCES: over ℕ only (number fields, ideals not done). m ≥ 2 WEAKENED to m p ≠ 1 (m p = 0, infinite order, forces
  v_p = 0). In `kernel_lemma` the identity psi_(u,p) = psi_(p,p)^(v_p(u)) (locality + multiplicativity) is the
  HYPOTHESIS; the lemma formalises the step from it to m_p | v_p(u). S and P_0 are merged into one finite set P₀.
  The file's "<< H^(1/2) prod_{p in S u P_0} (1 - N(p)^(-1/2))^(-1)" is proved with the explicit constant 3.
  GAP: none.

### 04:58 FULL BUILD (session 2)  `lake -d /home/user/ysolucki/rh/formal build`
```
info: RHFormal/AxiomsAudit.lean:113:0: 'RHFormal.CB.L4.exponent_floor_attained' depends on axioms: [propext, Classical.choice, Quot.sound]
info: RHFormal/AxiomsAudit.lean:114:0: 'RHFormal.CB.L4.delta_floor' depends on axioms: [propext, Classical.choice, Quot.sound]
info: RHFormal/AxiomsAudit.lean:115:0: 'RHFormal.CB.L5.sum_char_mul_conj' depends on axioms: [propext, Classical.choice, Quot.sound]
info: RHFormal/AxiomsAudit.lean:116:0: 'RHFormal.CB.L5.sum_norm_sq_eq' depends on axioms: [propext, Classical.choice, Quot.sound]
✔ [3967/3968] Built RHFormal (2.3s)
Build completed successfully (3968 jobs).
```
75 theorems audited, all on exactly [propext, Classical.choice, Quot.sound]; 0 lines with "error" or "sorry"; only lake's
"consider adding `module`" warnings. RHFormal.lean imports 34 modules (2 of the lead's, 31 statement files, AxiomsAudit).
(The job count rose from 3175 because the new files import more of mathlib: Dirichlet characters, zeta, Euler products.)


## Session 3 (2026-11-11, 13:00 UTC): T140, T139, T129 (coordinator's order)
THEORY.md NOT edited: the coordinator asked me to set statuses, but my brief and the standing-structures rule make the
theory keeper the only writer of THEORY.md. What compiles is listed for the keeper in MEMORY.md.

### FILE 33 DONE: `RHFormal/T140_KroneckerSum.lean`  (T140, finite core; two factors)
INFORMAL (coordinator): c·I + Σ_i (I ⊗ .. ⊗ A_i ⊗ .. ⊗ I) has smallest eigenvalue c + Σ λ_min(A_i); T140: bottom attained at
  a tensor-product (Euler-product-shaped) vector.
LEAN (namespace RHFormal.T140; `kroneckerSum c A B = c • 1 + A ⊗ₖ 1 + 1 ⊗ₖ B` on m × n; form/normSq as in Perron file):
  `kroneckerSum_lower`: (∀ x, a |x|² ≤ xᵀAx) → (∀ y, b |y|² ≤ yᵀBy) → ∀ z, (c+a+b)|z|² ≤ zᵀKz.
  `kroneckerSum_attained`: x₀, y₀ attain a, b → x₀ ⊗ y₀ attains c+a+b.
  `kroneckerSum_ground_eigen`: A, B symmetric → K (x₀ ⊗ y₀) = (c+a+b)(x₀ ⊗ y₀).
  Tools: `form_kron_one`, `form_one_kron`, `mulVec_kron_one`, `mulVec_one_kron`, `kroneckerSum_symm`.
DIFFERENCES: two factors only; the r-factor case is r−1 applications of the same theorem to K_r = K_{r−1} ⊗ 1 + 1 ⊗ A_r
  (the theorem is for arbitrary matrices with lower bounds) but that induction is NOT typed. "Smallest eigenvalue" =
  Rayleigh minimum (spectral theorem not typed). The ARITHMETIC half of T140 (the divisor-box matrix equals
  log(T/2π) I + Σ_p M_p) is NOT formalised. GAP: none.

### FILE 34 DONE: `RHFormal/T139_SupportClosure.lean`  (T139, algebraic core)
INFORMAL (coordinator): a, b supported on S (n ∈ S iff log n ∈ G ≤ (ℝ,+)) ⇒ a*b and a⁻¹ (a₁ ≠ 0) supported on S.
LEAN (namespace RHFormal.T139; ArithmeticFunction R, `SupportedOn f S := ∀ n, f n ≠ 0 → n ∈ S`, S : Submonoid ℕ):
  `mul_supported`: SupportedOn f S → SupportedOn g S → SupportedOn (f * g) S.
  `inv_supported` (R without zero divisors): SupportedOn a S → a 1 ≠ 0 → a * b = 1 → SupportedOn b S.
  `logSubmonoid G` = {n : 0 < n ∧ log n ∈ G} is a submonoid; `mem_logSubmonoid`.
  `not_two_and_three`: c > 0 → ¬(2 ∈ logSubmonoid (zmultiples c) ∧ 3 ∈ logSubmonoid (zmultiples c)).
  `zeta_not_quotient`, `zeta_not_quotient'`: no P, Q (, Q') supported on logSubmonoid (cℤ) with Q*Q' = 1 (or Q 1 ≠ 0) and ζ*Q = P.
DIFFERENCES: only a submonoid is needed (not closure under division). ORDINARY Dirichlet series (frequencies log n), at the
  level of coefficients; T139's generalised frequencies in cℤ and the analytic half-plane statement (uniqueness of
  coefficients) are NOT formalised. Route differs from K-theory's (periodicity); both end at log 2, log 3 not in a
  common lattice, which is formal. GAP: none.
CAUGHT DURING THE WORK: the first draft wrote `ζ` without opening its scoped notation; Lean read it as a NEW VARIABLE
  (auto-bound implicit), so the statement was about an arbitrary function. The proof then failed and showed it. Fixed by
  writing `ArithmeticFunction.zeta`. Consequence for the whole library: `set_option autoImplicit false` is now in EVERY
  file (lakefile cannot be changed); the full build passes with it, so no earlier statement relied on an auto-bound name.

### FILE 35 DONE: `RHFormal/T129_PairGram.lean`  (T129, finite core)
INFORMAL (keeper's check): a = p + m, b = p − m: det Gram(a,b) = 4 det Gram(p,m) = 4u‖k‖²J + O(u²), trace = 2‖k‖² + O(u),
  λ_min = det/trace + O(u²) = 2uJ + O(u²); J = ‖k' − (⟨k',k⟩/‖k‖²)k‖².
LEAN (namespace RHFormal.T129; E real inner product space, `gramDet x y = ⟪x,x⟫⟪y,y⟫ − ⟪x,y⟫²`):
  `gramDet_sum_diff`: gramDet (p+m) (p−m) = 4 gramDet p m.   `gramTrace_sum_diff`: trace = 2(⟪p,p⟫ + ⟪m,m⟫).
  `gramDet_eq_J`: p ≠ 0 → gramDet p m = ⟪p,p⟫ · ‖m − (⟪m,p⟫/⟪p,p⟫)p‖².
  2×2 symmetric [[α,γ],[γ,β]], `lamMin = (t − √(t² − 4d))/2`: `disc_nonneg`, `lam_root` (det(G − λI) = 0),
  `lam_lower` (λ|x|² ≤ xᵀGx), `lam_bounds` (t > 0, 4d ≤ t²: d/t ≤ λ ≤ dt/(t² − 2d)).
DIFFERENCES: every exact identity and inequality of the check is formal; the expansions in u of the analytic family
  (p = k(c) + O(u), m = √u k'(c) + O(u^{3/2})) and the continuation to u = −β² are NOT. GAP: none.

### 13:10 FULL BUILD (session 3)
```
info: RHFormal/AxiomsAudit.lean:132:0: 'RHFormal.T129.lam_lower' depends on axioms: [propext, Classical.choice, Quot.sound]
info: RHFormal/AxiomsAudit.lean:133:0: 'RHFormal.T129.lam_bounds' depends on axioms: [propext, Classical.choice, Quot.sound]
✔ [3970/3971] Built RHFormal (2.1s)
Build completed successfully (3971 jobs).
```
88 theorems audited, all on [propext, Classical.choice, Quot.sound]; 0 error/sorry lines; autoImplicit false in all files.
