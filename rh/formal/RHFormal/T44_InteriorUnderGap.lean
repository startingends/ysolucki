import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Tactic
set_option autoImplicit false

/-!
# T44: with a positive ground-state energy, every small atomic perturbation keeps the form non-negative

Source: `rh/THEORY.md`, entry T44; `rh/experiments/r2_parity/refuter/PROGRESS.md` (the checker's
one-line proof). Route #9 (bootstrap), a live route.

Informal statement (THEORY.md T44, quoted):

> Assume RH and fix L > 0. For every real atomic measure D = sum_j d_j (delta_{u_j} + delta_{-u_j}),
> u_j > 0, with 2 sum_j |d_j| <= lambda_L: Q(f) + sum_j d_j (g_f(u_j) + g_f(-u_j)) >= 0 for every f in
> Dom_L. (lambda_L > 0 by T36.)
> One-line proof: |D(f*f~)| <= 2 sum|d_j| ||f||^2 and lambda(L) > 0 is attained.

Here `g_f(u) = ∫ f(x) f(x - u) dx = <f, S_u f>` with `S_u` the shift by `u`, and `g_f(-u) = <S_u f, f>`.

FORMAL HERE (the deduction): `E` a real inner product space, `U j : E → E` any maps with
`‖U j f‖ ≤ ‖f‖` (the shifts `S_{u_j}`, possibly followed by restriction to the window), `Q : E → ℝ`
any function with `lam * ‖f‖^2 ≤ Q f` (the ground-state bound), `d j` real with `2 ∑ |d j| ≤ lam`.
Then `0 ≤ Q f + ∑ j, d j * (<f, U j f> + <U j f, f>)`.

NOT FORMAL (hypotheses here): that the Weil form on the window satisfies `Q f ≥ lam_L ‖f‖^2` with
`lam_L > 0` under RH (T10, T36: deep inputs), and that `g_f(u) = <f, S_u f>` with `S_u` norm
non-increasing. Positivity of `lam` is not needed for the deduction (if `lam ≤ 0` the hypothesis
`2 ∑ |d j| ≤ lam` forces `d = 0`).
-/

open Finset
open scoped RealInnerProductSpace

namespace RHFormal.T44

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- Each atom changes the form by at most `2 |d| ‖f‖^2`. -/
theorem atom_bound (U : E → E) (hU : ∀ f, ‖U f‖ ≤ ‖f‖) (d : ℝ) (f : E) :
    |d * (⟪f, U f⟫ + ⟪U f, f⟫)| ≤ 2 * |d| * ‖f‖ ^ 2 := by
  have h1 : |⟪f, U f⟫| ≤ ‖f‖ * ‖f‖ :=
    (abs_real_inner_le_norm f (U f)).trans (mul_le_mul_of_nonneg_left (hU f) (norm_nonneg f))
  rw [real_inner_comm f (U f), abs_mul]
  have h2 : |⟪f, U f⟫ + ⟪f, U f⟫| ≤ 2 * (‖f‖ * ‖f‖) := by
    have h3 : ⟪f, U f⟫ + ⟪f, U f⟫ = 2 * ⟪f, U f⟫ := by ring
    rw [h3, abs_mul, abs_two]
    linarith
  calc |d| * |⟪f, U f⟫ + ⟪f, U f⟫| ≤ |d| * (2 * (‖f‖ * ‖f‖)) :=
        mul_le_mul_of_nonneg_left h2 (abs_nonneg d)
    _ = 2 * |d| * ‖f‖ ^ 2 := by ring

/-- **T44 (deduction).** If `Q f ≥ lam ‖f‖^2` and `2 ∑ |d_j| ≤ lam`, the perturbed form
`Q f + ∑ d_j (g_f(u_j) + g_f(-u_j))` is non-negative. -/
theorem perturbed_nonneg {ι : Type*} (s : Finset ι) (U : ι → E → E)
    (hU : ∀ j f, ‖U j f‖ ≤ ‖f‖) (Q : E → ℝ) (lam : ℝ) (hQ : ∀ f, lam * ‖f‖ ^ 2 ≤ Q f)
    (d : ι → ℝ) (hd : 2 * ∑ j ∈ s, |d j| ≤ lam) (f : E) :
    0 ≤ Q f + ∑ j ∈ s, d j * (⟪f, U j f⟫ + ⟪U j f, f⟫) := by
  have h1 : |∑ j ∈ s, d j * (⟪f, U j f⟫ + ⟪U j f, f⟫)| ≤ ∑ j ∈ s, 2 * |d j| * ‖f‖ ^ 2 :=
    (Finset.abs_sum_le_sum_abs _ _).trans
      (Finset.sum_le_sum fun j _ => atom_bound (U j) (hU j) (d j) f)
  have h2 : ∑ j ∈ s, 2 * |d j| * ‖f‖ ^ 2 = (2 * ∑ j ∈ s, |d j|) * ‖f‖ ^ 2 := by
    rw [Finset.mul_sum, Finset.sum_mul]
  have h3 : (2 * ∑ j ∈ s, |d j|) * ‖f‖ ^ 2 ≤ lam * ‖f‖ ^ 2 :=
    mul_le_mul_of_nonneg_right hd (sq_nonneg _)
  have h4 := hQ f
  have h5 := neg_abs_le (∑ j ∈ s, d j * (⟪f, U j f⟫ + ⟪U j f, f⟫))
  linarith

end RHFormal.T44
