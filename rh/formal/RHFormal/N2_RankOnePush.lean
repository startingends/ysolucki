import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic

/-!
# N2: the ground state of a rank-one push (critical pole strength and its null vector)

Source: board s1, B182 (S1-cubic, nomination (N2), from `rh/experiments/s1_seminar/cubic/TURN3.md`).

Informal statement (B182, quoted):

> (N2) GROUND STATE OF A RANK-ONE PUSH. N real symmetric n x n, c in R^n, t and mu real, N + mu I
> invertible, B := -N. Then: (B + t c c^T) psi = mu psi for some psi with c.psi != 0  <=>
> t c^T (N + mu I)^(-1) c = 1, and then psi is a multiple of (N + mu I)^(-1) c. In particular with
> mu = 0 (N invertible, c^T N^(-1) c != 0): B + t c c^T has a null vector not orthogonal to c iff
> t = 1/(c^T N^(-1) c), and the null vector is N^(-1) c.

FORMAL HERE, coordinate-free: `V` a real vector space, `A` a bilinear form standing for `N + mu I`
(so `(B + t c c^T - mu) psi = 0` reads `A(psi, ·) = t c(psi) c`), non-degenerate in the first argument
(`A(x, ·) = 0 → x = 0`), `c` a linear functional, `w` a vector with `A(w, ·) = c` (`w = (N + mu I)^{-1} c`).
* `push_iff` : `(∃ ψ, c ψ ≠ 0 ∧ ∀ z, A ψ z = t * c ψ * c z) ↔ t * c w = 1`;
* `push_unique` : any such `ψ` equals `(t * c ψ) • w`.
Symmetry of `A` is not needed. With `mu = 0` this is the "in particular" clause.
-/

namespace RHFormal.N2

variable {V : Type*} [AddCommGroup V] [Module ℝ V]
variable (A : LinearMap.BilinForm ℝ V) (c : V →ₗ[ℝ] ℝ) (w : V)

/-- Any solution `ψ` of `A ψ = t c(ψ) c` is the multiple `t c(ψ) w` of `w = A^{-1} c`. -/
theorem push_unique (hnd : ∀ x, (∀ z, A x z = 0) → x = 0) (hw : ∀ z, A w z = c z) (t : ℝ) (ψ : V)
    (hψ : ∀ z, A ψ z = t * c ψ * c z) : ψ = (t * c ψ) • w := by
  have h : ψ - (t * c ψ) • w = 0 := by
    apply hnd
    intro z
    simp only [map_sub, map_smul, LinearMap.sub_apply, LinearMap.smul_apply, smul_eq_mul]
    rw [hψ z, hw z]
    ring
  exact sub_eq_zero.1 h

/-- **N2.** There is `ψ` with `c(ψ) ≠ 0` and `A ψ = t c(ψ) c` if and only if `t c(w) = 1`. -/
theorem push_iff (hnd : ∀ x, (∀ z, A x z = 0) → x = 0) (hw : ∀ z, A w z = c z) (t : ℝ) :
    (∃ ψ : V, c ψ ≠ 0 ∧ ∀ z, A ψ z = t * c ψ * c z) ↔ t * c w = 1 := by
  constructor
  · rintro ⟨ψ, hcψ, hψ⟩
    have h1 := push_unique A c w hnd hw t ψ hψ
    have h2 : c ψ = t * c ψ * c w := by
      conv_lhs => rw [h1]
      simp only [map_smul, smul_eq_mul]
    have h3 : c ψ * (t * c w - 1) = 0 := by linarith
    rcases mul_eq_zero.1 h3 with h | h
    · exact absurd h hcψ
    · linarith
  · intro ht
    refine ⟨w, ?_, fun z => ?_⟩
    · intro h0
      rw [h0, mul_zero] at ht
      exact zero_ne_one ht
    · rw [hw z, ht, one_mul]

end RHFormal.N2
