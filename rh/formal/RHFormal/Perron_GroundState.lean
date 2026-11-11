import RHFormal.OnePositiveDirection
import Mathlib.LinearAlgebra.Matrix.BilinearForm
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Algebra.Order.BigOperators.Ring.Finset

/-!
# The Perron step in finite dimension: the ground state of a symmetric matrix with non-positive
# off-diagonal entries and connected graph is strictly of one sign, and is unique up to a factor

Sources: board s1, question B157 (S1-socrates: P1, P2, P3), nomination B176 (S1-mirror: F-a, F-b, F-c,
from `rh/experiments/s1_seminar/mirror/PROOF_first_prime.md`), B109 (S1-cubic: "the one non-algebraic
step of my whole seat, and the one I most want checked"), and the lead's B140 (nodeless ground state
by a Perron argument). mathlib (v4.35.0) has no Perron-Frobenius theorem (searched).

Informal statements (B157, quoted):

> (P1) M real symmetric n x n with M_ij <= 0 for i != j: x^T M x >= |x|^T M |x| for every x (|x| entrywise).
> (P2) If in addition the graph of the non-zero off-diagonal entries is connected, every minimiser of
> x^T M x on the unit sphere has all entries of one strict sign, and the lowest eigenvalue is simple.
> (P3) ... if psi > 0 entrywise, psi^T M psi < 0, and P is symmetric with entries >= 0, then M - t P is
> not positive semidefinite for any t >= 0, and M + t P positive semidefinite forces
> t >= -psi^T M psi / psi^T P psi.

FORMAL HERE (`W` a finite index type, `form M x = x^T M x`, `normSq x = |x|^2`):
* `form_abs_le` : (P1). Symmetry of `M` is not needed.
* `psd_null`, `eigen_of_ground` : a minimiser is an eigenvector: if `lam |y|^2 ≤ y^T M y` for all `y`
  and `x^T M x = lam |x|^2`, then `M x = lam x` (`M` symmetric).
* `pos_of_nonneg_eigen` : a non-negative non-zero eigenvector of a matrix with non-positive
  off-diagonal entries and connected graph has all entries `> 0`.
* `ground_sign` : (P2), first half: every minimiser `x ≠ 0` has all entries `> 0` or all entries `< 0`.
* `ground_unique` : (P2), second half ("the lowest eigenvalue is simple"): any two minimisers are
  proportional.
* `neg_of_trial`, `lower_bound_of_trial`, `form_nonneg_of_nonneg`, `form_pos_of_pos` : (P3) and (F-c).

HOW THE HYPOTHESES ARE SAID.
* "minimiser on the unit sphere": a real `lam` with `∀ y, lam * normSq y ≤ form M y` and a vector
  `x ≠ 0` with `form M x = lam * normSq x` (no normalisation). EXISTENCE of a minimiser is NOT proved
  here (compactness of the sphere); the statements are about every minimiser.
* "the graph of the non-zero off-diagonal entries is connected", in cut form: for every non-empty
  proper set `S` of indices there are `i ∈ S`, `j ∉ S` with `M i j ≠ 0`.
* Symmetry of `M` IS used for (P2) (to pass from minimiser to eigenvector), not for (P1).
* (P3): "M - tP is not positive semidefinite" is stated as `ψ^T M ψ - t ψ^T P ψ < 0` for the trial
  vector `ψ` (by linearity this is `ψ^T (M - tP) ψ`); symmetry of `P` is not needed.
S1-mirror's (F-a) is (P1) applied to `A = D - K - s s^T` (its off-diagonal entries `-K_ij - s_i s_j` are
`≤ 0`); (F-b) is (P2) for that `A` (when all `s_i > 0` every off-diagonal entry is non-zero, so the cut
condition holds); (F-c) is `lower_bound_of_trial` with `form_pos_of_pos`.
-/

open Finset

namespace RHFormal.Perron

variable {W : Type*} [Fintype W]

/-- The quadratic form `x^T M x`. -/
def form (M : Matrix W W ℝ) (x : W → ℝ) : ℝ := ∑ i, ∑ j, x i * M i j * x j

/-- The squared Euclidean norm `|x|^2`. -/
def normSq (x : W → ℝ) : ℝ := ∑ i, x i ^ 2

/-! ### (P1) -/

omit [Fintype W] in
/-- Termwise form of (P1). -/
theorem term_abs_le (M : Matrix W W ℝ) (hM : ∀ i j, i ≠ j → M i j ≤ 0) (x : W → ℝ) (i j : W) :
    |x i| * M i j * |x j| ≤ x i * M i j * x j := by
  by_cases h : i = j
  · subst h
    have h1 := abs_mul_abs_self (x i)
    have h2 : |x i| * M i i * |x i| = M i i * (|x i| * |x i|) := by ring
    have h3 : x i * M i i * x i = M i i * (x i * x i) := by ring
    rw [h2, h3, h1]
  · have h1 := hM i j h
    have h2 : x i * x j ≤ |x i| * |x j| := by
      rw [← abs_mul]
      exact le_abs_self _
    nlinarith

/-- **(P1).** If the off-diagonal entries of `M` are `≤ 0`, then `|x|^T M |x| ≤ x^T M x`. -/
theorem form_abs_le (M : Matrix W W ℝ) (hM : ∀ i j, i ≠ j → M i j ≤ 0) (x : W → ℝ) :
    form M (fun i => |x i|) ≤ form M x :=
  Finset.sum_le_sum fun i _ => Finset.sum_le_sum fun j _ => term_abs_le M hM x i j

theorem normSq_abs (x : W → ℝ) : normSq (fun i => |x i|) = normSq x := by
  simp only [normSq, sq_abs]

/-! ### (P3) and (F-c): trial-vector bounds -/

/-- **(P3), first part.** If `ψ^T M ψ < 0` and `ψ^T P ψ ≥ 0`, then `ψ^T (M - tP) ψ < 0` for `t ≥ 0`. -/
theorem neg_of_trial (M P : Matrix W W ℝ) (ψ : W → ℝ) (hM : form M ψ < 0) (hP : 0 ≤ form P ψ)
    (t : ℝ) (ht : 0 ≤ t) : form M ψ - t * form P ψ < 0 := by
  nlinarith [mul_nonneg ht hP]

/-- **(P3), second part; (F-c).** If `M + tP ≥ 0` on the trial vector `ψ` and `ψ^T P ψ > 0`, then
`t ≥ -ψ^T M ψ / ψ^T P ψ`. -/
theorem lower_bound_of_trial (M P : Matrix W W ℝ) (ψ : W → ℝ) (t : ℝ) (hP : 0 < form P ψ)
    (h : 0 ≤ form M ψ + t * form P ψ) : -form M ψ / form P ψ ≤ t := by
  rw [div_le_iff₀ hP]
  linarith

/-- A matrix with non-negative entries is `≥ 0` on non-negative vectors. -/
theorem form_nonneg_of_nonneg (P : Matrix W W ℝ) (hP : ∀ i j, 0 ≤ P i j) (ψ : W → ℝ)
    (hψ : ∀ i, 0 ≤ ψ i) : 0 ≤ form P ψ :=
  Finset.sum_nonneg fun i _ => Finset.sum_nonneg fun j _ =>
    mul_nonneg (mul_nonneg (hψ i) (hP i j)) (hψ j)

/-- A matrix with non-negative entries, not zero, is `> 0` on strictly positive vectors. -/
theorem form_pos_of_pos (P : Matrix W W ℝ) (hP : ∀ i j, 0 ≤ P i j) (ψ : W → ℝ)
    (hψ : ∀ i, 0 < ψ i) (i0 j0 : W) (h0 : 0 < P i0 j0) : 0 < form P ψ := by
  refine Finset.sum_pos' (fun i _ => Finset.sum_nonneg fun j _ =>
    mul_nonneg (mul_nonneg (hψ i).le (hP i j)) (hψ j).le) ⟨i0, Finset.mem_univ i0, ?_⟩
  refine Finset.sum_pos' (fun j _ => mul_nonneg (mul_nonneg (hψ i0).le (hP i0 j)) (hψ j).le)
    ⟨j0, Finset.mem_univ j0, ?_⟩
  exact mul_pos (mul_pos (hψ i0) h0) (hψ j0)

/-! ### A minimiser is an eigenvector -/

/-- A null vector of a positive semidefinite symmetric form is in its kernel. -/
theorem psd_null {E : Type*} [AddCommGroup E] [Module ℝ E] (B : LinearMap.BilinForm ℝ E)
    (hB : ∀ x y, B x y = B y x) (hpos : ∀ y, 0 ≤ B y y) (x : E) (hx : B x x = 0) (y : E) :
    B x y = 0 := by
  by_contra h
  have h1 := hpos ((-(B y y + 1) / (2 * B x y)) • x + (1 : ℝ) • y)
  rw [bilin_comb B hB, hx] at h1
  have h2 : 2 * (-(B y y + 1) / (2 * B x y) * 1) * B x y = -(B y y + 1) := by
    field_simp
  rw [h2] at h1
  linarith

variable [DecidableEq W]

theorem toBilin_single (M : Matrix W W ℝ) (x : W → ℝ) (i : W) :
    Matrix.toBilin' M x (Pi.single i 1) = ∑ k, x k * M k i := by
  rw [Matrix.toBilin'_apply]
  refine Finset.sum_congr rfl fun k _ => ?_
  rw [Finset.sum_eq_single i]
  · simp
  · intro j _ hj
    simp [Pi.single_eq_of_ne hj]
  · intro h
    exact absurd (Finset.mem_univ i) h

theorem dot_single (x : W → ℝ) (i : W) :
    ∑ k, x k * (Pi.single i (1 : ℝ) : W → ℝ) k = x i := by
  rw [Finset.sum_eq_single i]
  · simp
  · intro j _ hj
    simp [Pi.single_eq_of_ne hj]
  · intro h
    exact absurd (Finset.mem_univ i) h

/-- **Minimiser ⟹ eigenvector.** If `lam |y|^2 ≤ y^T M y` for all `y` (`M` symmetric) and
`x^T M x = lam |x|^2`, then `M x = lam x`. -/
theorem eigen_of_ground (M : Matrix W W ℝ) (hMs : ∀ i j, M i j = M j i) (lam : ℝ)
    (hmin : ∀ y, lam * normSq y ≤ form M y) (x : W → ℝ) (hx : form M x = lam * normSq x) (i : W) :
    ∑ j, M i j * x j = lam * x i := by
  -- the form A(y, z) = y^T M z - lam <y, z>
  obtain ⟨A, hA⟩ : ∃ A : LinearMap.BilinForm ℝ (W → ℝ),
      ∀ y z, A y z = Matrix.toBilin' M y z - lam * ∑ k, y k * z k := by
    refine ⟨Matrix.toBilin' M - lam • Matrix.toBilin' (1 : Matrix W W ℝ), fun y z => ?_⟩
    simp [Matrix.toBilin'_apply', Matrix.one_mulVec, dotProduct]
  have hsq : ∀ y : W → ℝ, ∑ k, y k * y k = normSq y := fun y =>
    Finset.sum_congr rfl fun k _ => (sq (y k)).symm
  have hform : ∀ y : W → ℝ, Matrix.toBilin' M y y = form M y := fun y =>
    Matrix.toBilin'_apply M y y
  have hAs : ∀ y z, A y z = A z y := by
    intro y z
    rw [hA, hA]
    have h1 : Matrix.toBilin' M y z = Matrix.toBilin' M z y := by
      rw [Matrix.toBilin'_apply, Matrix.toBilin'_apply, Finset.sum_comm]
      refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
      rw [hMs b a]
      ring
    have h2 : ∑ k, y k * z k = ∑ k, z k * y k :=
      Finset.sum_congr rfl fun k _ => mul_comm _ _
    rw [h1, h2]
  have hApos : ∀ y, 0 ≤ A y y := by
    intro y
    rw [hA, hsq, hform]
    linarith [hmin y]
  have hAx : A x x = 0 := by
    rw [hA, hsq, hform, hx]
    ring
  have h := psd_null A hAs hApos x hAx (Pi.single i 1)
  rw [hA, toBilin_single, dot_single] at h
  have e : ∑ k, x k * M k i = ∑ j, M i j * x j :=
    Finset.sum_congr rfl fun k _ => by rw [hMs k i]; ring
  linarith

/-! ### Positivity, sign and uniqueness of the ground state -/

/-- A non-negative, non-zero eigenvector of a matrix with non-positive off-diagonal entries and
connected graph (cut form) has all entries strictly positive. -/
theorem pos_of_nonneg_eigen (M : Matrix W W ℝ) (hM : ∀ i j, i ≠ j → M i j ≤ 0)
    (hcut : ∀ S : Finset W, S.Nonempty → S ≠ univ → ∃ i ∈ S, ∃ j, j ∉ S ∧ M i j ≠ 0)
    (lam : ℝ) (v : W → ℝ) (hv0 : ∀ i, 0 ≤ v i) (hvne : v ≠ 0)
    (hev : ∀ i, ∑ j, M i j * v j = lam * v i) : ∀ i, 0 < v i := by
  by_contra hcon
  push Not at hcon
  obtain ⟨i1, hi1⟩ := hcon
  have hSne : (univ.filter fun i => v i = 0).Nonempty :=
    ⟨i1, Finset.mem_filter.2 ⟨Finset.mem_univ i1, le_antisymm hi1 (hv0 i1)⟩⟩
  have hSuniv : (univ.filter fun i => v i = 0) ≠ univ := by
    intro h
    apply hvne
    funext i
    have hi : i ∈ univ.filter fun i => v i = 0 := by
      rw [h]
      exact Finset.mem_univ i
    exact (Finset.mem_filter.1 hi).2
  obtain ⟨i, hiS, j, hjS, hMij⟩ := hcut _ hSne hSuniv
  have hvi : v i = 0 := (Finset.mem_filter.1 hiS).2
  have hvj : 0 < v j :=
    lt_of_le_of_ne (hv0 j) fun h => hjS (Finset.mem_filter.2 ⟨Finset.mem_univ j, h.symm⟩)
  have hij : i ≠ j := by
    rintro rfl
    exact hjS hiS
  have hrow := hev i
  rw [hvi, mul_zero] at hrow
  have hterm : ∀ k ∈ (univ : Finset W), M i k * v k ≤ 0 := by
    intro k _
    by_cases hk : k = i
    · rw [hk, hvi, mul_zero]
    · exact mul_nonpos_of_nonpos_of_nonneg (hM i k (Ne.symm hk)) (hv0 k)
  have hlt : ∑ k, M i k * v k < 0 :=
    Finset.sum_neg' hterm ⟨j, Finset.mem_univ j,
      mul_neg_of_neg_of_pos (lt_of_le_of_ne (hM i j hij) hMij) hvj⟩
  linarith

/-- **(P2), first half.** Every minimiser has all entries `> 0` or all entries `< 0`. -/
theorem ground_sign (M : Matrix W W ℝ) (hMs : ∀ i j, M i j = M j i)
    (hM : ∀ i j, i ≠ j → M i j ≤ 0)
    (hcut : ∀ S : Finset W, S.Nonempty → S ≠ univ → ∃ i ∈ S, ∃ j, j ∉ S ∧ M i j ≠ 0)
    (lam : ℝ) (hmin : ∀ y, lam * normSq y ≤ form M y) (x : W → ℝ) (hx0 : x ≠ 0)
    (hx : form M x = lam * normSq x) : (∀ i, 0 < x i) ∨ (∀ i, x i < 0) := by
  -- |x| is a minimiser too
  have habs : form M (fun i => |x i|) = lam * normSq (fun i => |x i|) := by
    have h1 := form_abs_le M hM x
    have h2 := hmin (fun i => |x i|)
    rw [normSq_abs] at h2 ⊢
    linarith
  have habsne : (fun i => |x i|) ≠ 0 := by
    intro h
    apply hx0
    funext i
    have hi := congrFun h i
    simpa using hi
  have hev := eigen_of_ground M hMs lam hmin (fun i => |x i|) habs
  have hpos := pos_of_nonneg_eigen M hM hcut lam (fun i => |x i|) (fun i => abs_nonneg _)
    habsne hev
  have hne : ∀ i, x i ≠ 0 := fun i => abs_pos.1 (hpos i)
  by_contra hcon
  push Not at hcon
  obtain ⟨⟨i1, hi1⟩, ⟨i2, hi2⟩⟩ := hcon
  have hSne : (univ.filter fun i => 0 < x i).Nonempty :=
    ⟨i2, Finset.mem_filter.2 ⟨Finset.mem_univ i2, lt_of_le_of_ne hi2 (hne i2).symm⟩⟩
  have hSuniv : (univ.filter fun i => 0 < x i) ≠ univ := by
    intro h
    have hi : i1 ∈ univ.filter fun i => 0 < x i := by
      rw [h]
      exact Finset.mem_univ i1
    exact absurd (Finset.mem_filter.1 hi).2 (not_lt.2 hi1)
  obtain ⟨i, hiS, j, hjS, hMij⟩ := hcut _ hSne hSuniv
  have hxi : 0 < x i := (Finset.mem_filter.1 hiS).2
  have hxj : x j < 0 :=
    lt_of_le_of_ne (not_lt.1 fun h => hjS (Finset.mem_filter.2 ⟨Finset.mem_univ j, h⟩)) (hne j)
  have hij : i ≠ j := by
    rintro rfl
    exact hjS hiS
  have hMneg : M i j < 0 := lt_of_le_of_ne (hM i j hij) hMij
  have hstrict : form M (fun i => |x i|) < form M x := by
    simp only [form]
    refine Finset.sum_lt_sum (fun a _ => Finset.sum_le_sum fun b _ => term_abs_le M hM x a b)
      ⟨i, Finset.mem_univ i, ?_⟩
    refine Finset.sum_lt_sum (fun b _ => term_abs_le M hM x i b) ⟨j, Finset.mem_univ j, ?_⟩
    rw [abs_of_pos hxi, abs_of_neg hxj]
    have hp : 0 < x i * (M i j * x j) := mul_pos hxi (mul_pos_of_neg_of_neg hMneg hxj)
    have e1 : x i * M i j * -x j = -(x i * (M i j * x j)) := by ring
    have e2 : x i * M i j * x j = x i * (M i j * x j) := by ring
    rw [e1, e2]
    linarith
  rw [habs, normSq_abs, ← hx] at hstrict
  exact lt_irrefl _ hstrict

/-- **(P2), second half: the lowest eigenvalue is simple.** Any minimiser `y` is a multiple of a
given minimiser `x ≠ 0`. -/
theorem ground_unique [Nonempty W] (M : Matrix W W ℝ) (hMs : ∀ i j, M i j = M j i)
    (hM : ∀ i j, i ≠ j → M i j ≤ 0)
    (hcut : ∀ S : Finset W, S.Nonempty → S ≠ univ → ∃ i ∈ S, ∃ j, j ∉ S ∧ M i j ≠ 0)
    (lam : ℝ) (hmin : ∀ y, lam * normSq y ≤ form M y) (x y : W → ℝ) (hx0 : x ≠ 0)
    (hx : form M x = lam * normSq x) (hy : form M y = lam * normSq y) :
    ∃ c : ℝ, ∀ i, y i = c * x i := by
  obtain ⟨i0⟩ := ‹Nonempty W›
  have hxi0 : x i0 ≠ 0 := by
    rcases ground_sign M hMs hM hcut lam hmin x hx0 hx with h | h
    · exact (h i0).ne'
    · exact (h i0).ne
  obtain ⟨c, hc⟩ : ∃ c : ℝ, c * x i0 = y i0 := ⟨y i0 / x i0, by field_simp⟩
  obtain ⟨z, hz⟩ : ∃ z : W → ℝ, ∀ i, z i = y i - c * x i := ⟨_, fun _ => rfl⟩
  have hex := eigen_of_ground M hMs lam hmin x hx
  have hey := eigen_of_ground M hMs lam hmin y hy
  have hez : ∀ i, ∑ j, M i j * z j = lam * z i := by
    intro i
    have h1 : ∑ j, M i j * z j = ∑ j, M i j * y j - c * ∑ j, M i j * x j := by
      rw [Finset.mul_sum, ← Finset.sum_sub_distrib]
      refine Finset.sum_congr rfl fun j _ => ?_
      rw [hz j]
      ring
    rw [h1, hex i, hey i, hz i]
    ring
  have hzform : form M z = lam * normSq z := by
    simp only [form, normSq]
    rw [Finset.mul_sum]
    refine Finset.sum_congr rfl fun i _ => ?_
    have h1 : ∑ j, z i * M i j * z j = z i * ∑ j, M i j * z j := by
      rw [Finset.mul_sum]
      refine Finset.sum_congr rfl fun j _ => ?_
      ring
    rw [h1, hez i]
    ring
  refine ⟨c, fun i => ?_⟩
  by_cases hz0 : z = 0
  · have hi := congrFun hz0 i
    rw [hz i] at hi
    simp only [Pi.zero_apply] at hi
    linarith
  · exfalso
    have hzi0 : z i0 = 0 := by
      rw [hz i0, hc]
      ring
    rcases ground_sign M hMs hM hcut lam hmin z hz0 hzform with h | h
    · exact absurd hzi0 (h i0).ne'
    · exact absurd hzi0 (h i0).ne

end RHFormal.Perron
