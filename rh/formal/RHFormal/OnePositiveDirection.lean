import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic

/-!
# "At most one positive eigenvalue" for a symmetric bilinear form, and the reverse Cauchy-Schwarz
# inequality (Lemma B, Step 2 of `rh/experiments/r2_cubic/PROOF_trickle.md`)

The cubic seat's lemmas (PROOF_trickle.md, Lemmas A, B, C) are about symmetric matrices with
"at most one positive eigenvalue" ("Lorentzian" = exactly one). This file fixes the formal meaning used in
`LemmaA_FibreClasses.lean` and `LemmaC_ConeTensor.lean`:

  `AtMostOnePos B` : there is NO two-dimensional subspace on which `B` is positive definite.

For a real symmetric matrix this is the statement "the positive index of inertia is at most 1", which
equals "at most one positive eigenvalue" by Sylvester's law of inertia / Courant-Fischer.
THAT EQUIVALENCE (eigenvalue count = largest dimension of a positive definite subspace) IS NOT
FORMALISED HERE; it is a textbook theorem (status `known`), and it is exactly the step the written proof
cites as "by Courant-Fischer".

Informal statement formalised here (PROOF_trickle.md, Lemma B, Step 2, quoted):

> Step 2 (reverse Cauchy-Schwarz). If A is symmetric with at most one positive eigenvalue and
> a^T A a > 0, then A <= (Aa)(Aa)^T / (a^T A a). Indeed for any x put y := x - (x^T A a / a^T A a) a.
> Then y^T A a = 0 and x^T A x = y^T A y + (x^T A a)^2 / (a^T A a). If y^T A y > 0, then y and a are
> linearly independent and A is positive definite on span(a, y), a 2-dimensional space: contradiction
> with (at most one positive eigenvalue) by Courant-Fischer. So y^T A y <= 0.

Results (all for a symmetric bilinear form `B` on any real vector space, no dimension hypothesis):
* `atMostOnePos_iff_reverse_cauchy_schwarz` : `AtMostOnePos B ↔ ∀ v w, 0 < B v v → B v v * B w w ≤ (B v w)^2`;
* `AtMostOnePos.reverse_cauchy_schwarz` : Step 2 in the form `B x x ≤ (B x a)^2 / B a a`;
* `atMostOnePos_of_nonpos_on_ker` : if `B ≤ 0` on the kernel of a linear functional then `AtMostOnePos B`;
* `atMostOnePos_iff_exists_ker` : and conversely (so the three formulations agree).
-/

namespace RHFormal

variable {E : Type*} [AddCommGroup E] [Module ℝ E]

/-- `B` has at most one positive direction: there is no plane `span(v, w)` on which `B` is positive
definite. (If `v, w` are linearly dependent some non-trivial combination is `0`, where `B` vanishes, so
the condition inside automatically forces a genuine two-dimensional subspace.) -/
def AtMostOnePos (B : LinearMap.BilinForm ℝ E) : Prop :=
  ¬ ∃ v w : E, ∀ α β : ℝ, (α ≠ 0 ∨ β ≠ 0) → 0 < B (α • v + β • w) (α • v + β • w)

/-- Expansion of a symmetric bilinear form on a combination of two vectors. -/
theorem bilin_comb (B : LinearMap.BilinForm ℝ E) (hB : ∀ x y, B x y = B y x) (v w : E) (α β : ℝ) :
    B (α • v + β • w) (α • v + β • w) = α ^ 2 * B v v + 2 * (α * β) * B v w + β ^ 2 * B w w := by
  simp only [map_add, map_smul, LinearMap.add_apply, LinearMap.smul_apply, smul_eq_mul]
  rw [hB w v]
  ring

/-- For a symmetric form, "no positive definite plane" is the same as the reverse Cauchy-Schwarz
inequality against every positive vector. -/
theorem atMostOnePos_iff_reverse_cauchy_schwarz (B : LinearMap.BilinForm ℝ E)
    (hB : ∀ x y, B x y = B y x) :
    AtMostOnePos B ↔ ∀ v w : E, 0 < B v v → B v v * B w w ≤ B v w ^ 2 := by
  constructor
  · intro h v w hv
    by_contra hlt
    rw [not_le] at hlt
    apply h
    refine ⟨v, w, ?_⟩
    intro α β hαβ
    rw [bilin_comb B hB]
    -- B v v * q = (α B v v + β B v w)^2 + β^2 (B v v B w w - (B v w)^2) > 0
    have hd : 0 < B v v * B w w - B v w ^ 2 := by linarith
    have key : 0 < B v v * (α ^ 2 * B v v + 2 * (α * β) * B v w + β ^ 2 * B w w) := by
      have e : B v v * (α ^ 2 * B v v + 2 * (α * β) * B v w + β ^ 2 * B w w)
          = (α * B v v + β * B v w) ^ 2 + β ^ 2 * (B v v * B w w - B v w ^ 2) := by ring
      rw [e]
      by_cases hβ : β = 0
      · have hα : α ≠ 0 := by
          rcases hαβ with h1 | h1
          · exact h1
          · exact absurd hβ h1
        subst hβ
        have h2 : 0 < (α * B v v) ^ 2 := by positivity
        simpa using h2
      · have h2 : 0 < β ^ 2 * (B v v * B w w - B v w ^ 2) := by positivity
        have h3 : 0 ≤ (α * B v v + β * B v w) ^ 2 := sq_nonneg _
        linarith
    -- `key : 0 < B v v * q`, `hv : 0 < B v v`, hence `0 < q`
    by_contra hq
    rw [not_lt] at hq
    have h4 := mul_nonpos_of_nonneg_of_nonpos hv.le hq
    linarith
  · intro h
    rintro ⟨v, w, hvw⟩
    have hv : 0 < B v v := by
      have h1 := hvw 1 0 (Or.inl one_ne_zero)
      simpa using h1
    have h1 := h v w hv
    have h2 := hvw (-(B v w)) (B v v) (Or.inr hv.ne')
    rw [bilin_comb B hB] at h2
    have e : (-(B v w)) ^ 2 * B v v + 2 * (-(B v w) * B v v) * B v w + B v v ^ 2 * B w w
        = B v v * (B v v * B w w - B v w ^ 2) := by ring
    rw [e] at h2
    have h3 : B v v * (B v v * B w w - B v w ^ 2) ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos hv.le (by linarith)
    linarith

/-- **Lemma B, Step 2 (reverse Cauchy-Schwarz).** If the symmetric form `B` has at most one positive
direction and `B a a > 0`, then `B x x ≤ (B x a)^2 / B a a` for every `x`,
i.e. `A ≤ (Aa)(Aa)^T / (a^T A a)`. -/
theorem AtMostOnePos.reverse_cauchy_schwarz {B : LinearMap.BilinForm ℝ E}
    (hB : ∀ x y, B x y = B y x) (h : AtMostOnePos B) {a : E} (ha : 0 < B a a) (x : E) :
    B x x ≤ B x a ^ 2 / B a a := by
  have h1 := (atMostOnePos_iff_reverse_cauchy_schwarz B hB).1 h a x ha
  rw [le_div_iff₀ ha, hB x a]
  linarith

/-- If a symmetric form is `≤ 0` on the kernel of a linear functional (a subspace of codimension at
most one), it has at most one positive direction. -/
theorem atMostOnePos_of_nonpos_on_ker (B : LinearMap.BilinForm ℝ E) (hB : ∀ x y, B x y = B y x)
    (φ : E →ₗ[ℝ] ℝ) (h : ∀ x, φ x = 0 → B x x ≤ 0) : AtMostOnePos B := by
  rw [atMostOnePos_iff_reverse_cauchy_schwarz B hB]
  intro v w hv
  have hφv : φ v ≠ 0 := by
    intro h0
    exact absurd (h v h0) (not_le.2 hv)
  -- z = (φ w) v - (φ v) w lies in the kernel
  have hz : φ ((φ w) • v + (-(φ v)) • w) = 0 := by
    simp only [map_add, map_smul, smul_eq_mul]
    ring
  have h1 := h _ hz
  rw [bilin_comb B hB] at h1
  have hφ2 : 0 < φ v ^ 2 := by positivity
  -- multiply by B v v > 0 and complete the square
  have h2 : (φ w * B v v - φ v * B v w) ^ 2 + φ v ^ 2 * (B v v * B w w - B v w ^ 2) ≤ 0 := by
    have e : (φ w * B v v - φ v * B v w) ^ 2 + φ v ^ 2 * (B v v * B w w - B v w ^ 2)
        = B v v * (φ w ^ 2 * B v v + 2 * (φ w * -φ v) * B v w + (-φ v) ^ 2 * B w w) := by ring
    rw [e]
    exact mul_nonpos_of_nonneg_of_nonpos hv.le h1
  have h3 : φ v ^ 2 * (B v v * B w w - B v w ^ 2) ≤ 0 := by
    have := sq_nonneg (φ w * B v v - φ v * B v w)
    linarith
  have h4 : B v v * B w w - B v w ^ 2 ≤ 0 := by
    by_contra hc
    rw [not_le] at hc
    have := mul_pos hφ2 hc
    linarith
  linarith

/-- The three formulations agree: at most one positive direction iff the form is `≤ 0` on the kernel
of some linear functional. -/
theorem atMostOnePos_iff_exists_ker (B : LinearMap.BilinForm ℝ E) (hB : ∀ x y, B x y = B y x) :
    AtMostOnePos B ↔ ∃ φ : E →ₗ[ℝ] ℝ, ∀ x, φ x = 0 → B x x ≤ 0 := by
  constructor
  · intro h
    by_cases hpos : ∃ a : E, 0 < B a a
    · obtain ⟨a, ha⟩ := hpos
      refine ⟨B a, fun x hx => ?_⟩
      have h1 := (atMostOnePos_iff_reverse_cauchy_schwarz B hB).1 h a x ha
      rw [hx] at h1
      by_contra hc
      rw [not_le] at hc
      have := mul_pos ha hc
      nlinarith
    · refine ⟨0, fun x _ => ?_⟩
      by_contra hc
      exact hpos ⟨x, not_le.1 hc⟩
  · rintro ⟨φ, hφ⟩
    exact atMostOnePos_of_nonpos_on_ker B hB φ hφ

end RHFormal
