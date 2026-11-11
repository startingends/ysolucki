import Mathlib.Algebra.Polynomial.BigOperators
import Mathlib.Algebra.Polynomial.Eval.Degree
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic

/-!
# The Hankel matrix of power sums is a (weighted) Gram matrix
# (the finite criterion behind idea #21: Corollary 3 of the mirror criterion, real-root case)

Sources: the lead's list for this seat ("for real roots the Hankel matrix of power sums is a Gram
matrix, hence positive semidefinite (finite version)"); board s1, message B82 (S1-mirror, nomination
(b)); `rh/experiments/s1_seminar/mirror/PROOF_mirror_criterion.md`, Corollary 3.

Informal statement (B82, quoted):

> let alpha_1..alpha_r be distinct non-zero reals, m_1..m_r non-zero reals,
> s_k = sum_j m_j alpha_j^k, n >= r, H = [s_(i+j)], i,j = 1..n. Then
> (i) x^T H x = sum_j m_j P_x(alpha_j)^2 with P_x(z) = sum_i x_i z^i;
> (ii) H is positive semidefinite iff every m_j > 0;
> (iii) the number of negative eigenvalues of H is the number of j with m_j < 0.
> Proof: (i) is algebra; (ii),(iii) by Lagrange interpolation: the map x -> (P_x(alpha_j))_j is onto
> R^r when n >= r (Vandermonde with nodes 0 excluded).

FORMAL HERE:
* `hankelForm_eq` : (i), for ANY finite index type and ANY exponent map `e` (so it covers
  `i, j = 1..n`, `i, j = 0..n-1`, or any other finite set of exponents), any reals `m`, `α`;
* `hankelForm_nonneg` : if all `m_j ≥ 0` the form is `≥ 0` (the "Gram matrix" statement);
* `exists_interp` : the interpolation step for exponents `1..n`: for distinct non-zero nodes and
  `r ≤ n` there is `x` with `P_x(α_j) = 0` for `j ≠ j0` and `P_x(α_j0) ≠ 0`;
* `nonneg_of_hankelForm_nonneg` : conversely, for exponents `1..n`, distinct non-zero nodes, `r ≤ n`:
  if the form is `≥ 0` then every `m_j ≥ 0`;
* `hankelForm_nonneg_iff` : (ii).

NOT FORMAL: (iii), the count of negative eigenvalues, and the complex-root clause.
-/

open Finset Polynomial

namespace RHFormal.Hankel

variable {ι κ : Type*} [Fintype ι] [Fintype κ]

/-- Power sums `s_k = ∑_j m_j α_j^k`. -/
def powerSum (m α : κ → ℝ) (k : ℕ) : ℝ := ∑ j, m j * α j ^ k

/-- `P_x(z) = ∑_i x_i z^(e i)`. -/
def genPoly (e : ι → ℕ) (x : ι → ℝ) (z : ℝ) : ℝ := ∑ i, x i * z ^ e i

/-- The Hankel form `x^T H x`, `H_ij = s_(e i + e j)`. -/
def hankelForm (m α : κ → ℝ) (e : ι → ℕ) (x : ι → ℝ) : ℝ :=
  ∑ i, ∑ j, x i * powerSum m α (e i + e j) * x j

/-- **(i)** `x^T H x = ∑_j m_j P_x(α_j)^2`: the Hankel matrix of power sums is the Gram matrix of the
vectors `(α_j^(e i))_i` with weights `m_j`. -/
theorem hankelForm_eq (m α : κ → ℝ) (e : ι → ℕ) (x : ι → ℝ) :
    hankelForm m α e x = ∑ k, m k * genPoly e x (α k) ^ 2 := by
  have h : ∀ k, m k * genPoly e x (α k) ^ 2
      = ∑ i, ∑ j, x i * (m k * α k ^ (e i + e j)) * x j := by
    intro k
    simp only [genPoly, sq]
    rw [Finset.sum_mul_sum, Finset.mul_sum]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [Finset.mul_sum]
    refine Finset.sum_congr rfl fun j _ => ?_
    rw [pow_add]
    ring
  simp_rw [h]
  refine Eq.symm (Finset.sum_comm.trans ?_)
  refine Finset.sum_congr rfl fun i _ => ?_
  refine Finset.sum_comm.trans ?_
  refine Finset.sum_congr rfl fun j _ => ?_
  simp only [powerSum, Finset.mul_sum, Finset.sum_mul]

/-- If all weights are `≥ 0` (e.g. real roots with multiplicities), the Hankel form of the power sums
is `≥ 0`. -/
theorem hankelForm_nonneg (m α : κ → ℝ) (e : ι → ℕ) (hm : ∀ k, 0 ≤ m k) (x : ι → ℝ) :
    0 ≤ hankelForm m α e x := by
  rw [hankelForm_eq]
  exact Finset.sum_nonneg fun k _ => mul_nonneg (hm k) (sq_nonneg _)

/-- Interpolation with exponents `1..n`: for distinct non-zero nodes `α_1..α_r`, `r ≤ n`, and any
`j0`, there is `x` with `P_x(α_j) = 0` for `j ≠ j0` and `P_x(α_j0) ≠ 0`. -/
theorem exists_interp {r n : ℕ} (α : Fin r → ℝ) (hα : Function.Injective α)
    (hα0 : ∀ j, α j ≠ 0) (hrn : r ≤ n) (j0 : Fin r) :
    ∃ x : Fin n → ℝ, genPoly (fun i : Fin n => (i : ℕ) + 1) x (α j0) ≠ 0 ∧
      ∀ j, j ≠ j0 → genPoly (fun i : Fin n => (i : ℕ) + 1) x (α j) = 0 := by
  classical
  set L : ℝ[X] := X * ∏ j ∈ univ.erase j0, (X - C (α j)) with hL
  have hdeg : L.natDegree < n + 1 := by
    have h1 : (∏ j ∈ univ.erase j0, (X - C (α j))).natDegree ≤ r - 1 := by
      refine (natDegree_prod_le _ _).trans ?_
      refine (Finset.sum_le_sum fun j _ => natDegree_X_sub_C_le (α j)).trans ?_
      simp [Finset.card_erase_of_mem]
    have h2 : L.natDegree ≤ 1 + (r - 1) := by
      refine natDegree_mul_le.trans ?_
      rw [natDegree_X]
      exact Nat.add_le_add_left h1 1
    have h3 : 0 < r := j0.pos
    omega
  have hcoeff0 : L.coeff 0 = 0 := by
    rw [hL]
    exact coeff_X_mul_zero _
  have heval : ∀ z : ℝ,
      genPoly (fun i : Fin n => (i : ℕ) + 1) (fun i : Fin n => L.coeff ((i : ℕ) + 1)) z
        = L.eval z := by
    intro z
    rw [eval_eq_sum_range' hdeg, Finset.sum_range_succ', hcoeff0]
    simp only [genPoly]
    rw [Fin.sum_univ_eq_sum_range (fun i => L.coeff (i + 1) * z ^ (i + 1)) n]
    simp
  refine ⟨fun i => L.coeff ((i : ℕ) + 1), ?_, ?_⟩
  · rw [heval, hL, eval_mul, eval_X, eval_prod]
    refine mul_ne_zero (hα0 j0) (Finset.prod_ne_zero_iff.2 fun j hj => ?_)
    simp only [eval_sub, eval_X, eval_C]
    exact sub_ne_zero.2 fun h => (Finset.ne_of_mem_erase hj) (hα h).symm
  · intro j hj
    rw [heval, hL, eval_mul, eval_prod]
    refine mul_eq_zero_of_right _ (Finset.prod_eq_zero (Finset.mem_erase.2 ⟨hj, mem_univ j⟩) ?_)
    simp

/-- Converse of `hankelForm_nonneg` for exponents `1..n`: if the nodes are distinct and non-zero,
`r ≤ n`, and the Hankel form `[s_(i+j)]_{i,j=1..n}` is `≥ 0`, then every weight `m_j` is `≥ 0`. -/
theorem nonneg_of_hankelForm_nonneg {r n : ℕ} (m α : Fin r → ℝ) (hα : Function.Injective α)
    (hα0 : ∀ j, α j ≠ 0) (hrn : r ≤ n)
    (hpsd : ∀ x : Fin n → ℝ, 0 ≤ hankelForm m α (fun i : Fin n => (i : ℕ) + 1) x) (j0 : Fin r) :
    0 ≤ m j0 := by
  obtain ⟨x, hx1, hx2⟩ := exists_interp α hα hα0 hrn j0
  have h := hpsd x
  rw [hankelForm_eq, Finset.sum_eq_single j0] at h
  · by_contra hneg
    rw [not_le] at hneg
    have hsq : 0 < genPoly (fun i : Fin n => (i : ℕ) + 1) x (α j0) ^ 2 := by positivity
    have := mul_neg_of_neg_of_pos hneg hsq
    linarith
  · intro j _ hj
    rw [hx2 j hj]
    ring
  · intro hj
    exact absurd (Finset.mem_univ j0) hj

/-- **(ii)** For distinct non-zero nodes, non-zero weights and `n ≥ r`: the Hankel matrix
`[s_(i+j)]_{i,j=1..n}` is positive semidefinite if and only if every weight is positive. -/
theorem hankelForm_nonneg_iff {r n : ℕ} (m α : Fin r → ℝ) (hα : Function.Injective α)
    (hα0 : ∀ j, α j ≠ 0) (hm0 : ∀ j, m j ≠ 0) (hrn : r ≤ n) :
    (∀ x : Fin n → ℝ, 0 ≤ hankelForm m α (fun i : Fin n => (i : ℕ) + 1) x) ↔ ∀ j, 0 < m j := by
  constructor
  · intro h j
    exact lt_of_le_of_ne (nonneg_of_hankelForm_nonneg m α hα hα0 hrn h j) (hm0 j).symm
  · intro h x
    exact hankelForm_nonneg m α _ (fun k => (h k).le) x

end RHFormal.Hankel
