import RHFormal.OnePositiveDirection
import Mathlib.LinearAlgebra.Matrix.BilinearForm

/-!
# Lemma C (the cone certificate): the explicit cone tensor is symmetric, contracts to `H`,
# and every slice has at most one positive direction

Source: `rh/experiments/r2_cubic/PROOF_trickle.md`, Lemma C (seat R2-cubic), board s1 message B36 (C).
Used by idea #10: this is the lemma that makes "a cubic certificate exists" vacuous.

Informal statement, quoted:

> Let H be symmetric with exactly one positive eigenvalue and a a vector with l := Ha >= 0 entrywise and
> s := a^T H a > 0. Define
>     T_ijk := [ H_ij l_k + H_ik l_j + H_jk l_i - (2/s) l_i l_j l_k ] / s.
> Then T is symmetric, T.a = H, and every slice T_k has at most one positive eigenvalue.

FORMAL HERE (index set any finite type; `H` a real symmetric matrix):
* `coneT_symm₁₂`, `coneT_symm₂₃` : `T_ijk = T_jik = T_ikj` (these two transpositions generate all
  permutations of the three indices);
* `coneT_contract` : `∑_k a_k T_ijk = H_ij`, for `s ≠ 0` (symmetry of `H` is not needed for this);
* `coneT_slice_form` : the quadratic form of the slice `T_k`, written with `H`, `l`, `s`;
* `coneT_slice_atMostOnePos` : if `H` has at most one positive direction, `s > 0` and `l_k ≥ 0`, the
  slice `T_k` has at most one positive direction.

"At most one positive eigenvalue" is formalised as `RHFormal.AtMostOnePos` (no positive definite plane),
see `OnePositiveDirection.lean` for what that does and does not cover. The hypothesis used is "at most
one", which is weaker than the "exactly one" of the informal statement.

NOTE ON THE PROOF. The written proof splits the slice as (negative semidefinite) + (rank two) and uses
Weyl's inequality. Lean was given a shorter route that avoids Weyl: on the hyperplane `l · x = 0` the
slice form equals `(l_k / s) x^T H x`, and `x^T H x ≤ 0` there by the reverse Cauchy-Schwarz inequality
for `H` against `a`; a form that is `≤ 0` on a hyperplane has at most one positive direction.
-/

open Finset

namespace RHFormal.LemmaC

variable {ι : Type*} [Fintype ι]

/-- `l = H a`. -/
def coneL (H : Matrix ι ι ℝ) (a : ι → ℝ) (i : ι) : ℝ := ∑ j, H i j * a j

/-- `s = a^T H a`. -/
def coneS (H : Matrix ι ι ℝ) (a : ι → ℝ) : ℝ := ∑ i, a i * coneL H a i

/-- The cone tensor `T_ijk = [H_ij l_k + H_ik l_j + H_jk l_i - (2/s) l_i l_j l_k] / s`. -/
noncomputable def coneT (H : Matrix ι ι ℝ) (a : ι → ℝ) (i j k : ι) : ℝ :=
  (H i j * coneL H a k + H i k * coneL H a j + H j k * coneL H a i
    - 2 / coneS H a * (coneL H a i * coneL H a j * coneL H a k)) / coneS H a

variable (H : Matrix ι ι ℝ) (a : ι → ℝ)

/-- Symmetry in the first two indices. -/
theorem coneT_symm₁₂ (hH : ∀ i j, H i j = H j i) (i j k : ι) :
    coneT H a i j k = coneT H a j i k := by
  simp only [coneT]
  rw [hH j i]
  ring

/-- Symmetry in the last two indices. -/
theorem coneT_symm₂₃ (hH : ∀ i j, H i j = H j i) (i j k : ι) :
    coneT H a i j k = coneT H a i k j := by
  simp only [coneT]
  rw [hH k j]
  ring

/-- **Lemma C, contraction.** `∑_k a_k T_ijk = H_ij` (needs only `s ≠ 0`; symmetry of `H` is not
used here). -/
theorem coneT_contract (hs : coneS H a ≠ 0) (i j : ι) :
    ∑ k, a k * coneT H a i j k = H i j := by
  have e : ∀ k, a k * coneT H a i j k
      = H i j / coneS H a * (a k * coneL H a k)
        + coneL H a j / coneS H a * (H i k * a k)
        + coneL H a i / coneS H a * (H j k * a k)
        - 2 * coneL H a i * coneL H a j / coneS H a ^ 2 * (a k * coneL H a k) := by
    intro k
    simp only [coneT]
    field_simp
  simp_rw [e, Finset.sum_sub_distrib, Finset.sum_add_distrib, ← Finset.mul_sum]
  have h1 : ∑ k, a k * coneL H a k = coneS H a := rfl
  have h2 : ∑ k, H i k * a k = coneL H a i := rfl
  have h3 : ∑ k, H j k * a k = coneL H a j := rfl
  rw [h1, h2, h3]
  field_simp
  ring

/-- The slice decomposition stated in the written proof ("expand to check"):
`T_k = (l_k/s)(H - l l^T/s) + (1/s)[u_k l^T + l u_k^T]` with `u_k := H e_k - (l_k/(2s)) l`,
entrywise. -/
theorem coneT_slice_decomp (hs : coneS H a ≠ 0) (i j k : ι) :
    coneT H a i j k
      = coneL H a k / coneS H a * (H i j - coneL H a i * coneL H a j / coneS H a)
        + 1 / coneS H a
          * ((H i k - coneL H a k / (2 * coneS H a) * coneL H a i) * coneL H a j
            + coneL H a i * (H j k - coneL H a k / (2 * coneS H a) * coneL H a j)) := by
  simp only [coneT]
  field_simp
  ring

variable [DecidableEq ι]

/-- `a^T H a = s` in terms of the bilinear form of `H`. -/
theorem toBilin_self_eq_coneS : Matrix.toBilin' H a a = coneS H a := by
  rw [Matrix.toBilin'_apply]
  simp only [coneS, coneL, Finset.mul_sum]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  ring

/-- `a^T H x = l · x` for symmetric `H`. -/
theorem toBilin_eq_coneL (hH : ∀ i j, H i j = H j i) (x : ι → ℝ) :
    Matrix.toBilin' H a x = ∑ j, coneL H a j * x j := by
  rw [Matrix.toBilin'_apply, Finset.sum_comm]
  refine Finset.sum_congr rfl fun j _ => ?_
  simp only [coneL, Finset.sum_mul]
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [hH j i]
  ring

/-- The quadratic form of the slice `T_k`:
`x^T T_k x = (l_k/s) x^T H x + (2/s) (H e_k · x)(l · x) - (2 l_k / s^2) (l · x)^2`
(the middle term is written as its two equal halves). -/
theorem coneT_slice_form (hs : coneS H a ≠ 0) (k : ι) (x : ι → ℝ) :
    Matrix.toBilin' (Matrix.of fun i j => coneT H a i j k) x x
      = coneL H a k / coneS H a * (∑ i, ∑ j, x i * H i j * x j)
        + 1 / coneS H a * ((∑ i, x i * H i k) * ∑ j, coneL H a j * x j)
        + 1 / coneS H a * ((∑ i, coneL H a i * x i) * ∑ j, H j k * x j)
        - 2 * coneL H a k / coneS H a ^ 2
          * ((∑ i, coneL H a i * x i) * ∑ j, coneL H a j * x j) := by
  rw [Matrix.toBilin'_apply, Finset.sum_mul_sum, Finset.sum_mul_sum, Finset.sum_mul_sum]
  simp only [Finset.mul_sum, ← Finset.sum_add_distrib, ← Finset.sum_sub_distrib, Matrix.of_apply]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  simp only [coneT]
  field_simp

/-- **Lemma C, slices.** If the symmetric matrix `H` has at most one positive direction,
`s = a^T H a > 0` and `l_k = (H a)_k ≥ 0`, then the slice `T_k = (T_ijk)_{i,j}` has at most one
positive direction. -/
theorem coneT_slice_atMostOnePos (hH : ∀ i j, H i j = H j i)
    (hpos : AtMostOnePos (Matrix.toBilin' H)) (hs : 0 < coneS H a) (k : ι)
    (hl : 0 ≤ coneL H a k) :
    AtMostOnePos (Matrix.toBilin' (Matrix.of fun i j => coneT H a i j k)) := by
  have hBsymm : ∀ x y, Matrix.toBilin' H x y = Matrix.toBilin' H y x := by
    intro x y
    rw [Matrix.toBilin'_apply, Matrix.toBilin'_apply, Finset.sum_comm]
    refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
    rw [hH j i]
    ring
  have hTsymm : ∀ x y, Matrix.toBilin' (Matrix.of fun i j => coneT H a i j k) x y
      = Matrix.toBilin' (Matrix.of fun i j => coneT H a i j k) y x := by
    intro x y
    rw [Matrix.toBilin'_apply, Matrix.toBilin'_apply, Finset.sum_comm]
    refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
    simp only [Matrix.of_apply]
    rw [coneT_symm₁₂ H a hH j i k]
    ring
  -- the hyperplane is the kernel of x ↦ a^T H x = l · x
  refine atMostOnePos_of_nonpos_on_ker _ hTsymm (Matrix.toBilin' H a) ?_
  intro x hx
  have hlx : ∑ j, coneL H a j * x j = 0 := by
    rw [← toBilin_eq_coneL H a hH x]
    exact hx
  -- x^T H x ≤ 0 on the hyperplane, by reverse Cauchy-Schwarz against a
  have hxx : Matrix.toBilin' H x x ≤ 0 := by
    have h1 := (atMostOnePos_iff_reverse_cauchy_schwarz _ hBsymm).1 hpos a x
      (by rw [toBilin_self_eq_coneS]; exact hs)
    rw [hx, toBilin_self_eq_coneS] at h1
    by_contra hc
    rw [not_le] at hc
    have := mul_pos hs hc
    nlinarith
  rw [coneT_slice_form H a hs.ne' k x, hlx]
  rw [Matrix.toBilin'_apply] at hxx
  have h2 : coneL H a k / coneS H a * (∑ i, ∑ j, x i * H i j * x j) ≤ 0 :=
    mul_nonpos_of_nonneg_of_nonpos (div_nonneg hl hs.le) hxx
  simp only [mul_zero, zero_mul, add_zero, sub_zero]
  exact h2

end RHFormal.LemmaC
