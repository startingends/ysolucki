import RHFormal.Perron_GroundState
import RHFormal.T63_GroundStateTransform

/-!
# Lemma B, Steps 4-5 (the Perron step of the trickle-down lemma), in eigenvector form

Source: `rh/experiments/r2_cubic/PROOF_trickle.md`, Lemma B, Steps 4 and 5; theory entry T51; board
s1, B109 (S1-cubic): "the one non-algebraic step of my whole seat, and the one I most want checked".

Informal statement (B109, quoted):

> 'M real symmetric, off-diagonal entries >= 0, irreducible, v > 0 entrywise with M v = v, and
> M^2 - M PSD => every eigenvalue of M other than the simple eigenvalue 1 is <= 0.'

Written proof (Lemma B, Steps 4-5, quoted in part): "M <= M^2, so every eigenvalue mu of M has
mu <= mu^2: mu <= 0 or mu >= 1. ... For c large, M + cI is an entrywise non-negative irreducible
symmetric matrix with a strictly positive eigenvector v, eigenvalue 1 + c. By Perron-Frobenius, 1 + c is
its largest eigenvalue and it is simple. So every other eigenvalue of M is < 1, hence <= 0."

FORMAL HERE (`W` a finite non-empty index type; no appeal to a Perron-Frobenius theorem, which mathlib
does not have):
* `form_le_normSq` : `M ≤ I`, i.e. `y^T M y ≤ |y|^2` for all `y` (from the ground-state identity
  `T63_GroundStateTransform.lean` with `u = v`, `lam = 1`);
* `perron_step` : for every eigenpair `M x = μ x`, `x ≠ 0`: either `μ ≤ 0`, or `μ = 1` and `x` is a
  multiple of `v`.

HOW THE HYPOTHESES ARE SAID: "irreducible" in cut form (for every non-empty proper set `S` of indices
there are `i ∈ S`, `j ∉ S` with `M i j ≠ 0`); "`M^2 - M` PSD" as `y^T M y ≤ |M y|^2` for all `y`
(for symmetric `M`, `y^T M^2 y = |M y|^2`).

DIFFERENCE: the conclusion is about eigenpairs, not about a list of eigenvalues with multiplicity:
"1 is a simple eigenvalue" is "every eigenvector for an eigenvalue `> 0` is a multiple of `v`".
The passage from this to "H has exactly one positive eigenvalue" (the conclusion of Lemma B) uses the
spectral theorem and Sylvester's law and is NOT formalised.
-/

open Finset

namespace RHFormal.LemmaB

open RHFormal.Perron

variable {W : Type*} [Fintype W] [DecidableEq W]

/-- `y^T (1 - M) y = |y|^2 - y^T M y`. -/
theorem form_one_sub (M : Matrix W W ℝ) (y : W → ℝ) :
    form (1 - M) y = normSq y - form M y := by
  have h1 : ∀ i, ∑ j, y i * (1 - M) i j * y j = y i ^ 2 - ∑ j, y i * M i j * y j := by
    intro i
    have h2 : ∀ j, y i * (1 - M) i j * y j
        = y i * ((1 : Matrix W W ℝ) i j * y j) - y i * M i j * y j := by
      intro j
      rw [Matrix.sub_apply]
      ring
    simp_rw [h2, Finset.sum_sub_distrib, ← Finset.mul_sum]
    have h3 : ∑ j, (1 : Matrix W W ℝ) i j * y j = y i := by
      rw [Finset.sum_eq_single i]
      · simp
      · intro j _ hj
        simp [Matrix.one_apply_ne (Ne.symm hj)]
      · intro h
        exact absurd (Finset.mem_univ i) h
    rw [h3]
    ring
  simp only [form, normSq]
  rw [Finset.sum_congr rfl fun i _ => h1 i, Finset.sum_sub_distrib]

/-- **`M ≤ I`.** If `M` is symmetric with non-negative off-diagonal entries and `M v = v` for a
strictly positive `v`, then `y^T M y ≤ |y|^2` for every `y`. -/
theorem form_le_normSq (M : Matrix W W ℝ) (hMs : ∀ i j, M i j = M j i)
    (hMoff : ∀ i j, i ≠ j → 0 ≤ M i j) (v : W → ℝ) (hv : ∀ i, 0 < v i)
    (hMv : ∀ i, ∑ j, M i j * v j = v i) (y : W → ℝ) : form M y ≤ normSq y := by
  have hid := T63.ground_state_sum M hMs v 1 (fun i => by rw [hMv i, one_mul]) (fun i => y i / v i)
  have hy : ∀ i, v i * (y i / v i) = y i := by
    intro i
    have := (hv i).ne'
    field_simp
  simp only [hy] at hid
  have hE : 0 ≤ T63.dirichlet M v (fun i => y i / v i) := by
    simp only [T63.dirichlet]
    refine mul_nonneg (by norm_num) (Finset.sum_nonneg fun a _ => Finset.sum_nonneg fun b _ => ?_)
    by_cases hab : a = b
    · subst hab
      simp
    · exact mul_nonneg (mul_nonneg (mul_nonneg (hMoff a b hab) (hv a).le) (hv b).le)
        (sq_nonneg _)
  have hn : ∑ i, v i ^ 2 * (y i / v i) ^ 2 = normSq y := by
    simp only [normSq]
    refine Finset.sum_congr rfl fun i _ => ?_
    have := (hv i).ne'
    field_simp
  rw [hn] at hid
  simp only [form]
  linarith

/-- **Lemma B, Steps 4-5 (Perron step), eigenvector form.** `M` symmetric with non-negative
off-diagonal entries, irreducible (cut form), `M v = v` with `v > 0`, and `M^2 - M ≥ 0`
(`y^T M y ≤ |M y|^2`). Then every eigenpair `M x = μ x`, `x ≠ 0`, has `μ ≤ 0`, or `μ = 1` and `x` is a
multiple of `v`. -/
theorem perron_step [Nonempty W] (M : Matrix W W ℝ) (hMs : ∀ i j, M i j = M j i)
    (hMoff : ∀ i j, i ≠ j → 0 ≤ M i j)
    (hcut : ∀ S : Finset W, S.Nonempty → S ≠ univ → ∃ i ∈ S, ∃ j, j ∉ S ∧ M i j ≠ 0)
    (v : W → ℝ) (hv : ∀ i, 0 < v i) (hMv : ∀ i, ∑ j, M i j * v j = v i)
    (hsq : ∀ y : W → ℝ, form M y ≤ ∑ i, (∑ j, M i j * y j) ^ 2)
    (x : W → ℝ) (hx0 : x ≠ 0) (μ : ℝ) (hx : ∀ i, ∑ j, M i j * x j = μ * x i) :
    μ ≤ 0 ∨ (μ = 1 ∧ ∃ c : ℝ, ∀ i, x i = c * v i) := by
  -- x^T M x = μ |x|^2 for an eigenvector
  have hform_eigen : ∀ (z : W → ℝ) (ν : ℝ), (∀ i, ∑ j, M i j * z j = ν * z i) →
      form M z = ν * normSq z := by
    intro z ν hz
    simp only [form, normSq]
    rw [Finset.mul_sum]
    refine Finset.sum_congr rfl fun i _ => ?_
    have h1 : ∑ j, z i * M i j * z j = z i * ∑ j, M i j * z j := by
      rw [Finset.mul_sum]
      refine Finset.sum_congr rfl fun j _ => ?_
      ring
    rw [h1, hz i]
    ring
  have hxform := hform_eigen x μ hx
  have hnpos : 0 < normSq x := by
    have hne : ∃ i, x i ≠ 0 := by
      by_contra h
      push Not at h
      exact hx0 (funext h)
    obtain ⟨i, hi⟩ := hne
    exact Finset.sum_pos' (fun j _ => sq_nonneg (x j)) ⟨i, Finset.mem_univ i, by positivity⟩
  -- μ ≤ 1
  have h1 : μ ≤ 1 := by
    have h := form_le_normSq M hMs hMoff v hv hMv x
    rw [hxform] at h
    by_contra hc
    rw [not_le] at hc
    nlinarith
  -- μ ≤ μ^2
  have h2 : μ ≤ μ ^ 2 := by
    have h := hsq x
    have h3 : ∑ i, (∑ j, M i j * x j) ^ 2 = μ ^ 2 * normSq x := by
      simp only [normSq]
      rw [Finset.mul_sum]
      refine Finset.sum_congr rfl fun i _ => ?_
      rw [hx i]
      ring
    rw [hxform, h3] at h
    by_contra hc
    rw [not_le] at hc
    nlinarith
  by_cases hμ : μ ≤ 0
  · exact Or.inl hμ
  · right
    rw [not_le] at hμ
    have hμ1 : μ = 1 := by nlinarith
    refine ⟨hμ1, ?_⟩
    -- x and v are ground states of 1 - M with lowest value 0
    have hAs : ∀ i j, (1 - M) i j = (1 - M) j i := by
      intro i j
      rw [Matrix.sub_apply, Matrix.sub_apply, hMs i j]
      by_cases hij : i = j
      · rw [hij]
      · rw [Matrix.one_apply_ne hij, Matrix.one_apply_ne (Ne.symm hij)]
    have hAoff : ∀ i j, i ≠ j → (1 - M) i j ≤ 0 := by
      intro i j hij
      rw [Matrix.sub_apply, Matrix.one_apply_ne hij]
      linarith [hMoff i j hij]
    have hAcut : ∀ S : Finset W, S.Nonempty → S ≠ univ →
        ∃ i ∈ S, ∃ j, j ∉ S ∧ (1 - M) i j ≠ 0 := by
      intro S hS hSu
      obtain ⟨i, hi, j, hj, hMij⟩ := hcut S hS hSu
      have hij : i ≠ j := by
        rintro rfl
        exact hj hi
      refine ⟨i, hi, j, hj, ?_⟩
      rw [Matrix.sub_apply, Matrix.one_apply_ne hij]
      intro h
      apply hMij
      linarith
    have hAmin : ∀ y : W → ℝ, 0 * normSq y ≤ form (1 - M) y := by
      intro y
      rw [form_one_sub, zero_mul]
      linarith [form_le_normSq M hMs hMoff v hv hMv y]
    have hv0 : v ≠ 0 := by
      obtain ⟨i⟩ := ‹Nonempty W›
      intro h
      have := hv i
      rw [h] at this
      simp at this
    have hvA : form (1 - M) v = 0 * normSq v := by
      rw [form_one_sub, hform_eigen v 1 (fun i => by rw [hMv i, one_mul])]
      ring
    have hxA : form (1 - M) x = 0 * normSq x := by
      rw [form_one_sub, hxform, hμ1]
      ring
    exact ground_unique (1 - M) hAs hAoff hAcut 0 hAmin v x hv0 hvA hxA

end RHFormal.LemmaB
