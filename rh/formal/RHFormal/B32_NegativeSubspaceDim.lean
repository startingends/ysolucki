import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.Dimension.StrongRankCondition
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.LinearAlgebra.Pi
import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic
set_option autoImplicit false

/-!
# B32, Step 2: a form with `ν` negative squares is negative definite on at most `ν` dimensions

Source: board s1, message B92 (S1-parity, nomination): the finite step (Step 2) of Theorem 4 of
`rh/experiments/r2_parity/PROOF_parity_index.md`, on which claim B32 rests.

Informal statement (B92, quoted):

> The finite step to check first is Step 2: on a real vector space, if
> Q = Q+ + sum_{i=1..nu} m_i (a_i^2 - b_i^2) with Q+ >= 0, m_i > 0, a_i, b_i linear functionals,
> then every subspace on which Q is negative definite has dimension <= nu (common kernel of the b_i).

FORMAL HERE: `V` any real vector space (any dimension), `Qp : V → ℝ` any function with `Qp ≥ 0`
(no quadratic structure is needed), `a i`, `b i` linear functionals for `i : Fin ν`, `m i > 0`,
`Q x = Qp x + ∑ i, m i * ((a i x)^2 - (b i x)^2)`. For every subspace `W` with `Q x < 0` for all
non-zero `x ∈ W`: `W` is finite-dimensional and `dim W ≤ ν`.
-/

open Finset

namespace RHFormal.B32

variable {V : Type*} [AddCommGroup V] [Module ℝ V]

/-- The map `x ↦ (b_i(x))_i` restricted to a subspace on which `Q` is negative definite is injective. -/
theorem b_injective {ν : ℕ} (Qp : V → ℝ) (hQp : ∀ x, 0 ≤ Qp x) (m : Fin ν → ℝ) (hm : ∀ i, 0 < m i)
    (a b : Fin ν → V →ₗ[ℝ] ℝ) (Q : V → ℝ)
    (hQ : ∀ x, Q x = Qp x + ∑ i, m i * ((a i x) ^ 2 - (b i x) ^ 2))
    (W : Submodule ℝ V) (hW : ∀ x ∈ W, x ≠ 0 → Q x < 0) :
    Function.Injective (LinearMap.pi (fun i => (b i).comp W.subtype) : W →ₗ[ℝ] (Fin ν → ℝ)) := by
  rw [injective_iff_map_eq_zero]
  intro x hx
  by_contra hne
  have hx0 : (x : V) ≠ 0 := fun h => hne (Subtype.ext h)
  have hneg := hW x x.2 hx0
  have hb : ∀ i, b i (x : V) = 0 := by
    intro i
    have := congrFun hx i
    simpa using this
  rw [hQ] at hneg
  have hsum : 0 ≤ ∑ i, m i * ((a i (x : V)) ^ 2 - (b i (x : V)) ^ 2) := by
    refine Finset.sum_nonneg fun i _ => ?_
    rw [hb i]
    have h1 : (0 : ℝ) ≤ (a i (x : V)) ^ 2 - 0 ^ 2 := by nlinarith [sq_nonneg (a i (x : V))]
    exact mul_nonneg (hm i).le h1
  have := hQp (x : V)
  linarith

/-- **B32, Step 2.** Every subspace on which `Q = Q+ + ∑_{i=1}^{ν} m_i (a_i^2 - b_i^2)` is negative
definite is finite-dimensional of dimension at most `ν`. -/
theorem finrank_le_of_negDef {ν : ℕ} (Qp : V → ℝ) (hQp : ∀ x, 0 ≤ Qp x) (m : Fin ν → ℝ)
    (hm : ∀ i, 0 < m i) (a b : Fin ν → V →ₗ[ℝ] ℝ) (Q : V → ℝ)
    (hQ : ∀ x, Q x = Qp x + ∑ i, m i * ((a i x) ^ 2 - (b i x) ^ 2))
    (W : Submodule ℝ V) (hW : ∀ x ∈ W, x ≠ 0 → Q x < 0) :
    FiniteDimensional ℝ W ∧ Module.finrank ℝ W ≤ ν := by
  have hinj := b_injective Qp hQp m hm a b Q hQ W hW
  refine ⟨FiniteDimensional.of_injective _ hinj, ?_⟩
  have h := LinearMap.finrank_le_finrank_of_injective hinj
  rwa [Module.finrank_fin_fun] at h

end RHFormal.B32
