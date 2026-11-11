import RHFormal.B56_BorderedIdentity
import Mathlib.Algebra.Algebra.Bilinear

/-!
# T33: the sign of the two sum-rule margins (a correction to the "in particular" clause)

Source: `rh/THEORY.md`, entry T33; `rh/experiments/s1_seminar/curv/S1_ADDITIONS.md`, F1 and its
consequences (a), (b). The formulas of T33 / F1 themselves are in `B56_BorderedIdentity.lean`
(`rankOne_value`: `2 c^T N_e^{-1} c - 1 = 1/(t_e - 1)`; `rankOne_value_twin`:
`1 - 2 s^T (-N_o)^{-1} s = 1/(1 + t_o)`).

Informal statement under test (THEORY.md T33, last sentence, quoted):

> In particular, when a Weil block is positive definite the corresponding margin is strictly
> positive: the sum rules are never exactly saturated on such a window.

and S1_ADDITIONS.md F1 (a), quoted: "On a window where the Weil block is strictly positive both margins
are STRICTLY positive resp. in (0,1)".

WHAT LEAN SAYS.
* ODD block: true. `odd_margin_mem` : if `Q ≥ 0` and `Q w = s` then `0 < 1/(1 + t) ≤ 1`, `t = 2 s(w)`.
* EVEN block: FALSE as worded. `even_margin_pos_iff` : `0 < 1/(t - 1) ↔ 1 < t`;
  and `even_margin_counterexample` : a positive definite `Q` (on `V = ℝ`, `Q(x,y) = x y`,
  `c(x) = x/2`, so `t = 1/2`) for which the even margin `2 c^T N^{-1} c - 1` equals `-2 < 0`.
  What is true for the even block is `even_margin_ne_zero` (never exactly saturated) and
  positivity exactly when `t_e > 1`. This agrees with F1 (b) of the same file ("Even margin > 0 iff
  t_e > 1 ... For lambda_1 < 0 (zeta: L <= 0.10) ... 1/(t_e - 1) < 0") and with the numbers recorded
  under T32 (t_e = 0.198, 0.842 at L = 0.05, 0.10, where the Weil block is positive definite).
  So the sentence quoted from T33 needs the extra hypothesis `t_e > 1` (equivalently, by T32, that
  `N_e` has a positive direction) for the even block.
-/

namespace RHFormal.T33

open RHFormal.B56

variable {V : Type*} [AddCommGroup V] [Module ℝ V]
variable (Q : LinearMap.BilinForm ℝ V) (c : V →ₗ[ℝ] ℝ) (w : V)

/-- **Odd margin.** If `Q ≥ 0` and `Q w = s`, then `t = 2 s(w) ≥ 0` and the odd margin `1/(1 + t)`
lies in `(0, 1]`. -/
theorem odd_margin_mem (hw : ∀ x, Q w x = c x) (hpos : ∀ x, 0 ≤ Q x x) :
    0 < 1 / (1 + 2 * c w) ∧ 1 / (1 + 2 * c w) ≤ 1 := by
  have h1 : 0 ≤ c w := by
    rw [← hw w]
    exact hpos w
  have h2 : 0 < 1 + 2 * c w := by linarith
  refine ⟨by positivity, ?_⟩
  rw [div_le_one h2]
  linarith

/-- **Even margin, sign.** The even margin `1/(t - 1)` is positive iff `t > 1`. -/
theorem even_margin_pos_iff : 0 < 1 / (2 * c w - 1) ↔ 1 < 2 * c w := by
  rw [one_div, inv_pos]
  constructor <;> intro h <;> linarith

/-- **Even margin, never saturated.** For `t ≠ 1` the even margin `1/(t - 1)` is not zero. -/
theorem even_margin_ne_zero (ht : 2 * c w ≠ 1) : 1 / (2 * c w - 1) ≠ 0 := by
  have h1 : 2 * c w - 1 ≠ 0 := sub_ne_zero.2 ht
  exact one_div_ne_zero h1

/-- **Counterexample to "Weil block positive definite ⟹ even margin > 0".**
On `V = ℝ` take `Q(x,y) = x y` (positive definite), `c(x) = x/2`, `w = 1/2` (so `Q w = c`,
`t = 2 c(w) = 1/2`). Then `N = 2 c c^T - Q = -1/2` and the even margin
`2 c(N^{-1} c) - 1 = 2 c(w/(t-1)) - 1` is `-2`. -/
theorem even_margin_counterexample :
    ∃ (Q : LinearMap.BilinForm ℝ ℝ) (c : ℝ →ₗ[ℝ] ℝ) (w : ℝ),
      (∀ x, x ≠ 0 → 0 < Q x x) ∧ (∀ x, Q w x = c x) ∧
      2 * c ((2 * c w - 1)⁻¹ • w) - 1 = -2 := by
  refine ⟨LinearMap.mul ℝ ℝ, (1 / 2 : ℝ) • LinearMap.id, 1 / 2, ?_, ?_, ?_⟩
  · intro x hx
    simp only [LinearMap.mul_apply']
    exact mul_self_pos.2 hx
  · intro x
    simp only [LinearMap.mul_apply', LinearMap.smul_apply, LinearMap.id_apply, smul_eq_mul]
  · simp only [LinearMap.smul_apply, LinearMap.id_apply, smul_eq_mul]
    norm_num

end RHFormal.T33
