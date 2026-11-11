import RHFormal.OnePositiveDirection
import Mathlib.LinearAlgebra.Matrix.BilinearForm
import Mathlib.Algebra.Order.BigOperators.Ring.Finset

/-!
# Lemma B, Steps 1-3 (trickle-down inequality): Lorentzian slices give `H ≤ H D H`

Source: `rh/experiments/r2_cubic/PROOF_trickle.md`, Lemma B, Steps 1, 2, 3; theory entry T51.

Informal statement (Lemma B, quoted in part):

> Let T be a real symmetric 3-tensor on R^m (T_ijk invariant under all permutations), a in R^m with
> a_k > 0 for all k. Put T_k := (T_ijk)_{i,j} (the k-th slice), H := sum_k a_k T_k, l_k := H e_k
> (k-th column of H), s_k := (Ha)_k. Assume ... (B2) s_k > 0 for every k; (B3) every slice T_k has at
> most one positive eigenvalue. Then ... H <= H D H with D := diag(a_k / s_k).

Written proof: Step 1 `T_k a = l_k`, `a^T T_k a = s_k`; Step 2 reverse Cauchy-Schwarz
(`OnePositiveDirection.lean`); Step 3 `T_k ≤ l_k l_k^T / s_k`, multiply by `a_k` and add.

FORMAL HERE: `trickle_inequality` : `x^T H x ≤ ∑_k (a_k / s_k) (l_k · x)^2` for every `x`, which is
`H ≤ H D H`; with `slice_apply_a` (Step 1) and `slice_le` (Step 3 for one slice).
Hypotheses actually used: `T_ijk = T_jik = T_ikj`, `a_k ≥ 0` (not `> 0`), `s_k > 0`, and each slice has
at most one positive direction (`RHFormal.AtMostOnePos`). (B1) (signs of `H`, irreducibility) is not
used for this inequality, as the written proof says.

NOT FORMAL in this file: Steps 4-5; see `LemmaB_PerronStep.lean` for the Perron step in eigenvector
form. The final conclusion "H has exactly one positive eigenvalue" needs the spectral theorem.
-/

open Finset

namespace RHFormal.LemmaB

variable {W : Type*} [Fintype W] [DecidableEq W]

/-- The contraction `H_ij = ∑_k a_k T_ijk`. -/
def contract (T : W → W → W → ℝ) (a : W → ℝ) (i j : W) : ℝ := ∑ k, a k * T i j k

/-- The `k`-th slice `T_k = (T_ijk)_{i,j}` as a matrix. -/
def slice (T : W → W → W → ℝ) (k : W) : Matrix W W ℝ := Matrix.of fun i j => T i j k

variable (T : W → W → W → ℝ) (a : W → ℝ)

/-- **Step 1.** `x^T T_k a = ∑_i x_i H_ik` (i.e. `T_k a = l_k`, the `k`-th column of `H`). -/
theorem slice_apply_a (hT23 : ∀ i j k, T i j k = T i k j) (k : W) (x : W → ℝ) :
    Matrix.toBilin' (slice T k) x a = ∑ i, x i * contract T a i k := by
  rw [Matrix.toBilin'_apply]
  refine Finset.sum_congr rfl fun i _ => ?_
  simp only [contract, slice, Matrix.of_apply, Finset.mul_sum]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [hT23 i j k]
  ring

/-- The slices are symmetric. -/
theorem slice_symm (hT12 : ∀ i j k, T i j k = T j i k) (k : W) (x y : W → ℝ) :
    Matrix.toBilin' (slice T k) x y = Matrix.toBilin' (slice T k) y x := by
  rw [Matrix.toBilin'_apply, Matrix.toBilin'_apply, Finset.sum_comm]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  simp only [slice, Matrix.of_apply]
  rw [hT12 j i k]
  ring

/-- **Step 3, one slice.** `x^T T_k x ≤ (l_k · x)^2 / s_k`, where `s_k = a^T T_k a = ∑_i a_i H_ik > 0`. -/
theorem slice_le (hT12 : ∀ i j k, T i j k = T j i k) (hT23 : ∀ i j k, T i j k = T i k j) (k : W)
    (hslice : AtMostOnePos (Matrix.toBilin' (slice T k)))
    (hs : 0 < ∑ i, a i * contract T a i k) (x : W → ℝ) :
    Matrix.toBilin' (slice T k) x x
      ≤ (∑ i, x i * contract T a i k) ^ 2 / ∑ i, a i * contract T a i k := by
  have haa : Matrix.toBilin' (slice T k) a a = ∑ i, a i * contract T a i k :=
    slice_apply_a T a hT23 k a
  have h := AtMostOnePos.reverse_cauchy_schwarz (slice_symm T hT12 k) hslice
    (a := a) (by rw [haa]; exact hs) x
  rw [haa, slice_apply_a T a hT23 k x] at h
  exact h

/-- `x^T H x = ∑_k a_k x^T T_k x`. -/
theorem contract_form (x : W → ℝ) :
    ∑ i, ∑ j, x i * contract T a i j * x j
      = ∑ k, a k * Matrix.toBilin' (slice T k) x x := by
  have h1 : ∀ k, a k * Matrix.toBilin' (slice T k) x x
      = ∑ i, ∑ j, x i * (a k * T i j k) * x j := by
    intro k
    rw [Matrix.toBilin'_apply, Finset.mul_sum]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [Finset.mul_sum]
    refine Finset.sum_congr rfl fun j _ => ?_
    simp only [slice, Matrix.of_apply]
    ring
  simp_rw [h1]
  refine Eq.symm (Finset.sum_comm.trans ?_)
  refine Finset.sum_congr rfl fun i _ => ?_
  refine Finset.sum_comm.trans ?_
  refine Finset.sum_congr rfl fun j _ => ?_
  simp only [contract, Finset.mul_sum, Finset.sum_mul]

/-- **Lemma B, Steps 1-3: `H ≤ H D H`.** If every slice has at most one positive direction,
`a ≥ 0` and `s_k = (H a)_k > 0`, then `x^T H x ≤ ∑_k (a_k / s_k) (∑_i x_i H_ik)^2` for every `x`. -/
theorem trickle_inequality (hT12 : ∀ i j k, T i j k = T j i k)
    (hT23 : ∀ i j k, T i j k = T i k j) (ha : ∀ k, 0 ≤ a k)
    (hs : ∀ k, 0 < ∑ i, a i * contract T a i k)
    (hslice : ∀ k, AtMostOnePos (Matrix.toBilin' (slice T k))) (x : W → ℝ) :
    ∑ i, ∑ j, x i * contract T a i j * x j
      ≤ ∑ k, a k / (∑ i, a i * contract T a i k) * (∑ i, x i * contract T a i k) ^ 2 := by
  rw [contract_form]
  refine Finset.sum_le_sum fun k _ => ?_
  have h := slice_le T a hT12 hT23 k (hslice k) (hs k) x
  have h2 := mul_le_mul_of_nonneg_left h (ha k)
  have e : a k * ((∑ i, x i * contract T a i k) ^ 2 / ∑ i, a i * contract T a i k)
      = a k / (∑ i, a i * contract T a i k) * (∑ i, x i * contract T a i k) ^ 2 := by
    ring
  rw [e] at h2
  exact h2

end RHFormal.LemmaB
