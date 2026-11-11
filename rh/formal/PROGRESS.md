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
