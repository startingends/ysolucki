import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Tactic
set_option autoImplicit false

/-!
# T129 (finite core): the pair Gram determinant identity and the 2×2 bottom eigenvalue

Source: `rh/THEORY.md`, entry T129 ("Two-zero model M3: collision expansion ... kappa_2 = 4 J u + O(u^2)");
`rh/specialists/operator/TWO_ZERO.md` 3.4; NOTEBOOK N81. The keeper's check, quoted:

> with a = p + m, b = p - m, p = (k_+ + k_-)/2 = k(c) + O(u), m = (k_+ - k_-)/2 = sqrt(u) k'(c) + O(u^{3/2}):
> det Gram(a, b) = 4 det Gram(p, m) = 4 u ||k||^2 J + O(u^2), trace = 2||k||^2 + O(u), so
> lambda_min = det/trace + O(u^2) = 2 u J + O(u^2)

with `J = || k' - (<k', k>/||k||^2) k ||^2`.

FORMAL HERE (`E` a real inner product space; `gramDet x y = <x,x><y,y> - <x,y>^2`):
* `gramDet_sum_diff` : the exact polynomial identity `det Gram(p + m, p - m) = 4 det Gram(p, m)`;
* `gramTrace_sum_diff` : `trace Gram(p + m, p - m) = 2(|p|^2 + |m|^2)`;
* `gramDet_eq_J` : `det Gram(p, m) = |p|^2 · |m - (<m,p>/|p|^2) p|^2` for `p ≠ 0` (the `J` form);
* for a real symmetric 2×2 matrix `[[α, γ], [γ, β]]` with trace `t` and determinant `d`, and
  `λ := (t - √(t^2 - 4d))/2`:
  `disc_nonneg` (`t^2 - 4d ≥ 0`), `lam_root` (`λ^2 - tλ + d = 0`, so `det(G - λI) = 0`),
  `lam_lower` (`λ |x|^2 ≤ x^T G x` for all `x`: `λ` is the bottom of the Rayleigh quotient), and
  `lam_bounds` (`d/t ≤ λ ≤ d t/(t^2 - 2d)` for `t > 0`; `4d ≤ t^2` holds automatically), whence
  `0 ≤ λ - d/t ≤ 2d^2/(t(t^2 - 2d))`: "lambda_min = det/trace + O(det^2/trace^3)".

NOT FORMAL: the expansions in `u` of the analytic family (`p = k(c) + O(u)`, `m = √u k'(c) + O(u^{3/2})`),
hence the final `2uJ + O(u^2)`; and the continuation to `u = -β^2`. What is formal is every exact
identity and inequality the keeper's check uses.
-/

open scoped RealInnerProductSpace

namespace RHFormal.T129

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- Gram determinant of two vectors. -/
def gramDet (x y : E) : ℝ := ⟪x, x⟫ * ⟪y, y⟫ - ⟪x, y⟫ ^ 2

/-- **The keeper's identity.** `det Gram(p + m, p - m) = 4 det Gram(p, m)`. -/
theorem gramDet_sum_diff (p m : E) : gramDet (p + m) (p - m) = 4 * gramDet p m := by
  simp only [gramDet, inner_add_left, inner_add_right, inner_sub_left, inner_sub_right,
    real_inner_comm p m]
  ring

/-- `trace Gram(p + m, p - m) = 2 (|p|^2 + |m|^2)`. -/
theorem gramTrace_sum_diff (p m : E) :
    ⟪p + m, p + m⟫ + ⟪p - m, p - m⟫ = 2 * (⟪p, p⟫ + ⟪m, m⟫) := by
  simp only [inner_add_left, inner_add_right, inner_sub_left, inner_sub_right, real_inner_comm p m]
  ring

/-- **The `J` form.** For `p ≠ 0`: `det Gram(p, m) = |p|^2 · |m - (<m,p>/|p|^2) p|^2`. -/
theorem gramDet_eq_J (p m : E) (hp : p ≠ 0) :
    gramDet p m = ⟪p, p⟫ * ⟪m - (⟪m, p⟫ / ⟪p, p⟫) • p, m - (⟪m, p⟫ / ⟪p, p⟫) • p⟫ := by
  have hpp : ⟪p, p⟫ ≠ 0 := by
    rw [real_inner_self_eq_norm_sq]
    exact pow_ne_zero 2 (norm_ne_zero_iff.2 hp)
  simp only [gramDet, inner_sub_left, inner_sub_right, real_inner_smul_left, real_inner_smul_right,
    real_inner_comm p m]
  field_simp
  ring

/-! ### The bottom eigenvalue of a real symmetric 2×2 matrix `[[α, γ], [γ, β]]` -/

/-- `λ_min = (t - √(t^2 - 4d))/2` with `t = α + β`, `d = αβ - γ^2`. -/
noncomputable def lamMin (α β γ : ℝ) : ℝ :=
  ((α + β) - Real.sqrt ((α + β) ^ 2 - 4 * (α * β - γ ^ 2))) / 2

theorem disc_eq (α β γ : ℝ) : (α + β) ^ 2 - 4 * (α * β - γ ^ 2) = (α - β) ^ 2 + 4 * γ ^ 2 := by
  ring

theorem disc_nonneg (α β γ : ℝ) : 0 ≤ (α + β) ^ 2 - 4 * (α * β - γ ^ 2) := by
  rw [disc_eq]
  positivity

/-- `λ_min` is a root of the characteristic polynomial: `λ^2 - tλ + d = 0`, i.e. `det(G - λI) = 0`. -/
theorem lam_root (α β γ : ℝ) :
    (α - lamMin α β γ) * (β - lamMin α β γ) - γ ^ 2 = 0 := by
  have hs := Real.sq_sqrt (disc_nonneg α β γ)
  simp only [lamMin]
  nlinarith [hs]

/-- **`λ_min` is the bottom of the Rayleigh quotient:** `λ |x|^2 ≤ x^T G x`. -/
theorem lam_lower (α β γ x₁ x₂ : ℝ) :
    lamMin α β γ * (x₁ ^ 2 + x₂ ^ 2) ≤ α * x₁ ^ 2 + 2 * γ * x₁ * x₂ + β * x₂ ^ 2 := by
  set l := lamMin α β γ with hl
  set s := Real.sqrt ((α + β) ^ 2 - 4 * (α * β - γ ^ 2)) with hsdef
  have hs0 : 0 ≤ s := Real.sqrt_nonneg _
  have hs2 : s ^ 2 = (α - β) ^ 2 + 4 * γ ^ 2 := by
    rw [hsdef, Real.sq_sqrt (disc_nonneg α β γ), disc_eq]
  have hroot := lam_root α β γ
  rw [← hl] at hroot
  have hsum : (α - l) + (β - l) = s := by
    rw [hl, lamMin]
    ring
  -- a := α - l ≥ 0, b := β - l ≥ 0, ab = γ^2
  have ha : 0 ≤ α - l := by nlinarith [sq_nonneg γ, sq_nonneg (α - l - (β - l))]
  have hb : 0 ≤ β - l := by nlinarith [sq_nonneg γ, sq_nonneg (α - l - (β - l))]
  -- (a + b) · Q = (a x₁ + γ x₂)^2 + (γ x₁ + b x₂)^2 ≥ 0, with Q = a x₁^2 + 2γ x₁x₂ + b x₂^2
  have hQ : 0 ≤ ((α - l) + (β - l))
      * ((α - l) * x₁ ^ 2 + 2 * γ * x₁ * x₂ + (β - l) * x₂ ^ 2) := by
    have e : ((α - l) + (β - l)) * ((α - l) * x₁ ^ 2 + 2 * γ * x₁ * x₂ + (β - l) * x₂ ^ 2)
        = ((α - l) * x₁ + γ * x₂) ^ 2 + (γ * x₁ + (β - l) * x₂) ^ 2
          + ((α - l) * (β - l) - γ ^ 2) * (x₁ ^ 2 + x₂ ^ 2) := by ring
    rw [e, hroot]
    positivity
  rcases (add_nonneg ha hb).eq_or_lt with h0 | hpos
  · -- a = b = 0, hence γ = 0 and the inequality is an equality
    have ha0 : α - l = 0 := by linarith
    have hb0 : β - l = 0 := by linarith
    have hγ : γ ^ 2 = 0 := by rw [ha0, hb0] at hroot; linarith
    have hγ0 : γ = 0 := pow_eq_zero_iff (n := 2) (by norm_num) |>.1 hγ
    rw [hγ0]
    nlinarith
  · have hQ' : 0 ≤ (α - l) * x₁ ^ 2 + 2 * γ * x₁ * x₂ + (β - l) * x₂ ^ 2 := by
      by_contra hc
      rw [not_le] at hc
      have := mul_neg_of_pos_of_neg hpos hc
      linarith
    nlinarith [hQ']

/-- **`λ_min = det/trace + O(det^2/trace^3)`.** For `t > 0` and `4d ≤ t^2` (always true for a
symmetric 2×2 matrix, `disc_nonneg`):
`d/t ≤ λ ≤ d t/(t^2 - 2d)` where `λ = (t - √(t^2 - 4d))/2`. -/
theorem lam_bounds (t d : ℝ) (ht : 0 < t) (hd4 : 4 * d ≤ t ^ 2) :
    d / t ≤ (t - Real.sqrt (t ^ 2 - 4 * d)) / 2 ∧
      (t - Real.sqrt (t ^ 2 - 4 * d)) / 2 ≤ d * t / (t ^ 2 - 2 * d) := by
  set s := Real.sqrt (t ^ 2 - 4 * d) with hsdef
  have hs0 : 0 ≤ s := Real.sqrt_nonneg _
  have hs2 : s ^ 2 = t ^ 2 - 4 * d := Real.sq_sqrt (by linarith)
  have hpos : 0 < t ^ 2 - 2 * d := by nlinarith
  -- s t ≤ t^2 - 2d, since (s t)^2 = t^4 - 4 d t^2 ≤ (t^2 - 2d)^2 and both sides are ≥ 0
  have h1 : s * t ≤ t ^ 2 - 2 * d := by
    have h2 : (s * t) ^ 2 ≤ (t ^ 2 - 2 * d) ^ 2 := by
      have e : (s * t) ^ 2 = (t ^ 2 - 4 * d) * t ^ 2 := by rw [mul_pow, hs2]
      rw [e]
      nlinarith [sq_nonneg d]
    by_contra hc
    rw [not_le] at hc
    have h3 := mul_self_lt_mul_self hpos.le hc
    nlinarith [h3]
  constructor
  · rw [div_le_div_iff₀ ht (by norm_num)]
    nlinarith [h1]
  · rw [div_le_div_iff₀ (by norm_num) hpos]
    -- s (t^2 - 2d) ≥ s (s t) = t s^2 = t (t^2 - 4d)
    have h4 : s * (s * t) ≤ s * (t ^ 2 - 2 * d) := mul_le_mul_of_nonneg_left h1 hs0
    have e2 : s * (s * t) = t * (t ^ 2 - 4 * d) := by
      rw [← hs2]
      ring
    nlinarith [h4, e2]

end RHFormal.T129
