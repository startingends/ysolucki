import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic

/-!
# The bordered form behind B56 (first step) and the rank-one inverse formula F1

Sources: board s1, message B92 (S1-parity, nomination; the lemma behind B56) and message B98
(S1-curv, nomination "F1, step"; `rh/experiments/s1_seminar/curv/S1_ADDITIONS.md` F1).

Informal statement 1 (B92, quoted):

> FIRST STEP to type (a polynomial identity, then Sylvester): for x in R^n, y in R, with
> B(x,y) = x^T Q x + 2 y c^T x + y^2/2:
>   B(x,y) = (x + y Q^-1 c)^T Q (x + y Q^-1 c) + (1 - t) y^2/2
>          = x^T (Q - 2 c c^T) x + (y + 2 c^T x)^2/2,          t = 2 c^T Q^-1 c.

Informal statement 2 (B98, quoted):

> F1, step: Q real symmetric invertible, c a vector, t = 2 c^T Q^-1 c != 1, N = 2cc^T - Q:
> N is invertible and 2 c^T N^-1 c - 1 = 1/(t - 1).

FORMAL HERE, in a coordinate-free form: `V` any real vector space, `Q` a symmetric bilinear form,
`c` a linear functional, and `w : V` a vector with `Q w x = c x` for all `x` (this is `w = Q^-1 c`;
when `Q` is an invertible matrix such a `w` exists and is unique). `t = 2 * c w`,
`N x z = 2 * c x * c z - Q x z`.
* `bordered_eq_shift`, `bordered_eq_border` : the two identities of statement 1;
* `rankOne_solve`, `rankOne_value` : for `t ≠ 1`, `w' = w / (t - 1)` solves `N w' = c` (as functionals)
  and `2 c(w') - 1 = 1/(t - 1)`;
* `rankOne_nondegenerate` : if `Q` is non-degenerate and `t ≠ 1`, then `N` is non-degenerate
  (for matrices: invertible);
* `nonpos_of_nonneg` : a consequence in the direction of B56: if `Q ≥ 0` and `t ≤ 1`, then `N ≤ 0`.

NOT FORMAL: the inertia counts of B56 (pos(N) = neg(Q) + [t > 1], ...); they need Sylvester's law.
-/

namespace RHFormal.B56

variable {V : Type*} [AddCommGroup V] [Module ℝ V]
variable (Q : LinearMap.BilinForm ℝ V) (c : V →ₗ[ℝ] ℝ) (w : V)

/-- **B92, first identity.** `x^T Q x + 2 y c^T x + y^2/2 = (x + y w)^T Q (x + y w) + (1 - t) y^2/2`
with `Q w = c`, `t = 2 c(w)`. -/
theorem bordered_eq_shift (hQ : ∀ x z, Q x z = Q z x) (hw : ∀ x, Q w x = c x) (x : V) (y : ℝ) :
    Q x x + 2 * y * c x + y ^ 2 / 2
      = Q (x + y • w) (x + y • w) + (1 - 2 * c w) * y ^ 2 / 2 := by
  simp only [map_add, map_smul, LinearMap.add_apply, LinearMap.smul_apply, smul_eq_mul]
  rw [hQ x w, hw x, hw w]
  ring

/-- **B92, second identity.** `x^T Q x + 2 y c^T x + y^2/2 = x^T (Q - 2 c c^T) x + (y + 2 c^T x)^2/2`. -/
theorem bordered_eq_border (x : V) (y : ℝ) :
    Q x x + 2 * y * c x + y ^ 2 / 2 = (Q x x - 2 * c x ^ 2) + (y + 2 * c x) ^ 2 / 2 := by
  ring

/-- **F1, step (solve).** With `N = 2 c c^T - Q`, `Q w = c`, `t = 2 c(w) ≠ 1`:
`N (w / (t - 1)) = c`, i.e. `N^-1 c = w / (t - 1)`. -/
theorem rankOne_solve (hw : ∀ x, Q w x = c x) (ht : 2 * c w ≠ 1) (z : V) :
    2 * c ((2 * c w - 1)⁻¹ • w) * c z - Q ((2 * c w - 1)⁻¹ • w) z = c z := by
  have h1 : 2 * c w - 1 ≠ 0 := sub_ne_zero.2 ht
  simp only [map_smul, LinearMap.smul_apply, smul_eq_mul]
  rw [hw z]
  field_simp

/-- **F1, step (value).** `2 c^T N^-1 c - 1 = 1/(t - 1)`, with `N^-1 c = w/(t - 1)` from
`rankOne_solve`. -/
theorem rankOne_value (ht : 2 * c w ≠ 1) :
    2 * c ((2 * c w - 1)⁻¹ • w) - 1 = 1 / (2 * c w - 1) := by
  have h1 : 2 * c w - 1 ≠ 0 := sub_ne_zero.2 ht
  simp only [map_smul, smul_eq_mul]
  field_simp
  ring

/-- **F1, twin (solve).** With `M' = Q + 2 s s^T`, `Q w = s`, `t' = 2 s(w) ≠ -1`:
`M' (w / (1 + t')) = s`. (Here the functional is again called `c`.) -/
theorem rankOne_solve_twin (hw : ∀ x, Q w x = c x) (ht : 2 * c w ≠ -1) (z : V) :
    Q ((1 + 2 * c w)⁻¹ • w) z + 2 * c ((1 + 2 * c w)⁻¹ • w) * c z = c z := by
  have h1 : 1 + 2 * c w ≠ 0 := by
    intro h
    apply ht
    linarith
  simp only [map_smul, LinearMap.smul_apply, smul_eq_mul]
  rw [hw z]
  field_simp

/-- **F1, twin (value).** `1 - 2 s^T M'^-1 s = 1/(1 + t')`. -/
theorem rankOne_value_twin (ht : 2 * c w ≠ -1) :
    1 - 2 * c ((1 + 2 * c w)⁻¹ • w) = 1 / (1 + 2 * c w) := by
  have h1 : 1 + 2 * c w ≠ 0 := by
    intro h
    apply ht
    linarith
  simp only [map_smul, smul_eq_mul]
  field_simp
  ring

/-- **F1, step (invertibility).** If `Q` is non-degenerate and `t ≠ 1`, then `N = 2 c c^T - Q` is
non-degenerate: the only `x` with `N(x, z) = 0` for all `z` is `x = 0`. -/
theorem rankOne_nondegenerate (hQ : ∀ x z, Q x z = Q z x) (hw : ∀ x, Q w x = c x)
    (ht : 2 * c w ≠ 1) (hnd : ∀ x, (∀ z, Q x z = 0) → x = 0)
    (x : V) (hx : ∀ z, 2 * c x * c z - Q x z = 0) : x = 0 := by
  have h1 : 2 * c w - 1 ≠ 0 := sub_ne_zero.2 ht
  have h2 := hx w
  rw [hQ x w, hw x] at h2
  have h3 : c x * (2 * c w - 1) = 0 := by linarith
  have h4 : c x = 0 := by
    rcases mul_eq_zero.1 h3 with h | h
    · exact h
    · exact absurd h h1
  apply hnd
  intro z
  have h5 := hx z
  rw [h4] at h5
  linarith

/-- A consequence in the direction of B56 (even block): if `Q ≥ 0`, `Q w = c` and `t = 2 c(w) ≤ 1`,
then `N = 2 c c^T - Q ≤ 0`. -/
theorem nonpos_of_nonneg (hQ : ∀ x z, Q x z = Q z x) (hw : ∀ x, Q w x = c x)
    (hpos : ∀ x, 0 ≤ Q x x) (ht : 2 * c w ≤ 1) (x : V) : 2 * c x ^ 2 - Q x x ≤ 0 := by
  have h1 := bordered_eq_shift Q c w hQ hw x (-(2 * c x))
  have h2 := hpos (x + (-(2 * c x)) • w)
  have h3 : 0 ≤ (1 - 2 * c w) * (-(2 * c x)) ^ 2 / 2 := by
    have : 0 ≤ 1 - 2 * c w := by linarith
    positivity
  nlinarith

end RHFormal.B56
