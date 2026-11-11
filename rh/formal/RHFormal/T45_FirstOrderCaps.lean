import Mathlib.Basic.Real.Basic
import Mathlib.Tactic

/-!
# T45: first-order caps on the change of one weight (trial-vector bound)

Source: `rh/THEORY.md`, entry T45; board s1, post B58 (FACT 1, FACT 3) and B92 (S1-parity);
`rh/experiments/s1_seminar/parity/NOTES.md`, section J. Used by idea #9 (bootstrap), a live route.

Informal statement (THEORY.md T45, quoted in part):

> let Q^(delta) be Q with the weight Lambda(n) replaced by Lambda(n) + delta. For every real f ...
> with ||f|| = 1: Q^(delta)(f) = Q(f) - 2 delta n^{-1/2} G_f, G_f := int f(x) f(x - log n) dx.
> Hence if Q^(delta) >= 0 on even functions and f_e is a real even unit vector with Q(f_e) = mu_e and
> G_{f_e} > 0, then delta <= mu_e sqrt(n)/(2 G_{f_e}); if Q^(delta) >= 0 on odd functions and f_o is a
> real odd unit vector with Q(f_o) = mu_o and G_{f_o} < 0, then delta >= -mu_o sqrt(n)/(2 |G_{f_o}|).
> Also G_f = 0 for a function f supported in [0, L] when log n >= L ...

and (board B92, quoted): "Fact 1 is: phi supported in (0, L], u >= L => phi(x) phi(x+u) = 0 for all x.
Fact 3 is: Q, B real symmetric, Q v = mu v, |v| = 1, delta real; if Q + delta B >= 0 then
mu + delta v^T B v >= 0."

FORMAL HERE (the deduction, not the analytic input):
* `trial_bound` (Fact 3): for any set `E` of trial vectors and any real functions `Q, B` on it
  (the values of the two quadratic forms): if `Q g + δ B g ≥ 0` on a class `S` and `f ∈ S`, then
  `Q f + δ B f ≥ 0`;
* `cap_upper`, `cap_lower`: the two caps, with `B f = -2 w G`, `w = n^(-1/2) > 0`:
  `G > 0 → δ ≤ μ / (2 w G)` and `G < 0 → δ ≥ -μ / (2 w |G|)`;
* `cap_upper_sqrt`, `cap_lower_sqrt`: the same with `w = 1/√n` written out, giving
  `δ ≤ μ √n / (2 G)` and `δ ≥ -μ √n / (2 |G|)`;
* `support_shift` (Fact 1): `φ` supported in `(0, L]`, `u ≥ L` ⟹ `φ(x) φ(x+u) = 0` for all `x`.

NOT FORMAL: the identity `Q^(delta)(f) = Q(f) - 2 delta n^{-1/2} G_f` itself (it is the definition of
the perturbed form applied to `f * f~`; it enters here as the hypothesis `hB`), and the signs of
`G_{f_e}`, `G_{f_o}` (T46). The eigenvector property `Q v = mu v` and `|v| = 1` of the informal
statement are not needed: only the value `Q f = μ` is used.
-/

namespace RHFormal.T45

/-- **Fact 3 (trial-vector bound).** If the perturbed form `Q + δ B` is `≥ 0` on a class `S` of
trial vectors and `f ∈ S`, then `Q f + δ B f ≥ 0`. -/
theorem trial_bound {E : Type*} (Q B : E → ℝ) (S : Set E) (δ : ℝ)
    (h : ∀ g ∈ S, 0 ≤ Q g + δ * B g) (f : E) (hf : f ∈ S) : 0 ≤ Q f + δ * B f :=
  h f hf

/-- **Upper cap.** `Q^(δ) = Q - 2 δ w G_(·)` non-negative on the class `S`, `f ∈ S` with `Q f = μ` and
`G_f > 0`, `w > 0`: then `δ ≤ μ / (2 w G_f)`. -/
theorem cap_upper {E : Type*} (Q G : E → ℝ) (S : Set E) (δ w : ℝ) (hw : 0 < w)
    (h : ∀ g ∈ S, 0 ≤ Q g - 2 * δ * w * G g) (f : E) (hf : f ∈ S) (μ : ℝ) (hμ : Q f = μ)
    (hG : 0 < G f) : δ ≤ μ / (2 * w * G f) := by
  have h1 := h f hf
  rw [hμ] at h1
  have h2 : 0 < 2 * w * G f := by positivity
  rw [le_div_iff₀ h2]
  linarith

/-- **Lower cap.** Same setting with `G_f < 0`: then `δ ≥ -μ / (2 w |G_f|)`. -/
theorem cap_lower {E : Type*} (Q G : E → ℝ) (S : Set E) (δ w : ℝ) (hw : 0 < w)
    (h : ∀ g ∈ S, 0 ≤ Q g - 2 * δ * w * G g) (f : E) (hf : f ∈ S) (μ : ℝ) (hμ : Q f = μ)
    (hG : G f < 0) : -μ / (2 * w * |G f|) ≤ δ := by
  have h1 := h f hf
  rw [hμ] at h1
  rw [abs_of_neg hG]
  have h2 : 0 < 2 * w * -G f := by
    have : 0 < -G f := by linarith
    positivity
  rw [div_le_iff₀ h2]
  nlinarith

/-- Upper cap in the notation of T45: `w = n^(-1/2) = 1/√n`, conclusion `δ ≤ μ √n / (2 G_f)`. -/
theorem cap_upper_sqrt {E : Type*} (Q G : E → ℝ) (S : Set E) (δ n : ℝ) (hn : 0 < n)
    (h : ∀ g ∈ S, 0 ≤ Q g - 2 * δ * (1 / Real.sqrt n) * G g) (f : E) (hf : f ∈ S) (μ : ℝ)
    (hμ : Q f = μ) (hG : 0 < G f) : δ ≤ μ * Real.sqrt n / (2 * G f) := by
  have hs : 0 < Real.sqrt n := Real.sqrt_pos.2 hn
  have h1 := cap_upper Q G S δ (1 / Real.sqrt n) (by positivity) h f hf μ hμ hG
  have e : μ / (2 * (1 / Real.sqrt n) * G f) = μ * Real.sqrt n / (2 * G f) := by
    field_simp
  rw [e] at h1
  exact h1

/-- Lower cap in the notation of T45: conclusion `δ ≥ -μ √n / (2 |G_f|)`. -/
theorem cap_lower_sqrt {E : Type*} (Q G : E → ℝ) (S : Set E) (δ n : ℝ) (hn : 0 < n)
    (h : ∀ g ∈ S, 0 ≤ Q g - 2 * δ * (1 / Real.sqrt n) * G g) (f : E) (hf : f ∈ S) (μ : ℝ)
    (hμ : Q f = μ) (hG : G f < 0) : -μ * Real.sqrt n / (2 * |G f|) ≤ δ := by
  have hs : 0 < Real.sqrt n := Real.sqrt_pos.2 hn
  have habs : 0 < |G f| := abs_pos.2 hG.ne
  have h1 := cap_lower Q G S δ (1 / Real.sqrt n) (by positivity) h f hf μ hμ hG
  have e : -μ / (2 * (1 / Real.sqrt n) * |G f|) = -μ * Real.sqrt n / (2 * |G f|) := by
    field_simp
  rw [e] at h1
  exact h1

/-- **Fact 1.** If `φ` is supported in `(0, L]` and `u ≥ L`, then `φ(x) φ(x + u) = 0` for every `x`:
the shift part of an atom at distance `u ≥ L` vanishes on the folded half window. -/
theorem support_shift (φ : ℝ → ℝ) (L u : ℝ) (hφ : ∀ x, φ x ≠ 0 → 0 < x ∧ x ≤ L) (hu : L ≤ u)
    (x : ℝ) : φ x * φ (x + u) = 0 := by
  by_contra h
  have h1 : φ x ≠ 0 := left_ne_zero_of_mul h
  have h2 : φ (x + u) ≠ 0 := right_ne_zero_of_mul h
  have h3 := hφ x h1
  have h4 := hφ (x + u) h2
  linarith [h3.1, h4.2]

end RHFormal.T45
