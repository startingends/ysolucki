import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic
set_option autoImplicit false

/-!
# Theorem B, (B2): the path form of Gamma_2 for a chain with constant total rate

Source: `rh/experiments/r2_curv/PROOF_bochner_parity.md`, Theorem B, item (B2) (seat R2-curv);
theory entry T64. (B3), the three-way split nominated by S1-curv (board s1, B98), is derived from it
in `B3_ThreeWaySplit.lean`; Theorem C (C1) was derived from (B2) in the written proof.

Informal statement, quoted:

> (B2) path form. For any chain with constant total rate,
>      Gamma_2(f)(x) = (1/2) (Lf(x))^2
>                      + (1/2) sum_{y,z} q_xy q_yz [ (f_z - f_y)^2 - (1/2) (f_z - f_x)^2 ].

with `L f(x) = sum_y q_xy (f_y - f_x)`, `Gamma(f,g)(x) = (1/2) sum_y q_xy (f_y - f_x)(g_y - g_x)`,
`Gamma_2(f) = (1/2) L Gamma(f,f) - Gamma(f, L f)`.

FORMAL HERE: `W` is a finite set of sites inside any type `G`; `q : G → G → ℝ` any real rates
(no sign, no symmetry); all sums run over `W`. Hypothesis: `∑_{y ∈ W} q x y = R` for every `x ∈ W`.
The diagonal `q x x` may be anything: self-jumps are allowed and counted in the total rate
(they contribute nothing to `L`, `Gamma`, and enter both sides of (B2) alike).
-/

open Finset

namespace RHFormal.B2

variable {G : Type*}

/-- Generator restricted to the sites `W`: `L f(x) = ∑_{y ∈ W} q_xy (f_y - f_x)`. -/
def genOn (W : Finset G) (q : G → G → ℝ) (f : G → ℝ) (x : G) : ℝ :=
  ∑ y ∈ W, q x y * (f y - f x)

/-- Carré du champ: `Γ(f,g)(x) = (1/2) ∑_{y ∈ W} q_xy (f_y - f_x)(g_y - g_x)`. -/
noncomputable def carreOn (W : Finset G) (q : G → G → ℝ) (f g : G → ℝ) (x : G) : ℝ :=
  (1 / 2) * ∑ y ∈ W, q x y * ((f y - f x) * (g y - g x))

/-- `Γ₂(f) = (1/2) L Γ(f,f) - Γ(f, L f)`. -/
noncomputable def gamma2On (W : Finset G) (q : G → G → ℝ) (f : G → ℝ) (x : G) : ℝ :=
  (1 / 2) * genOn W q (fun y => carreOn W q f f y) x
    - carreOn W q f (fun y => genOn W q f y) x

/-- **(B2), path form.** For a chain on the finite set `W` with constant total rate `R`:
`Γ₂(f)(x) = (1/2)(Lf(x))^2 + (1/2) ∑_{y,z} q_xy q_yz [(f_z - f_y)^2 - (1/2)(f_z - f_x)^2]`. -/
theorem path_form (W : Finset G) (q : G → G → ℝ) (R : ℝ) (hR : ∀ x ∈ W, ∑ y ∈ W, q x y = R)
    (f : G → ℝ) (x : G) (hx : x ∈ W) :
    gamma2On W q f x
      = (1 / 2) * (genOn W q f x) ^ 2
        + (1 / 2) * ∑ y ∈ W, ∑ z ∈ W,
            q x y * q y z * ((f z - f y) ^ 2 - (1 / 2) * (f z - f x) ^ 2) := by
  have hS : ∑ y ∈ W, ∑ z ∈ W, q x y * q y z * ((f z - f y) ^ 2 - (1 / 2) * (f z - f x) ^ 2)
      = (∑ y ∈ W, ∑ z ∈ W, q x y * q y z * (f z - f y) ^ 2)
        - (1 / 2) * ∑ y ∈ W, ∑ z ∈ W, q x y * q y z * (f z - f x) ^ 2 := by
    simp only [Finset.mul_sum, ← Finset.sum_sub_distrib]
    refine Finset.sum_congr rfl fun y _ => Finset.sum_congr rfl fun z _ => ?_
    ring
  -- the only place where the rate at the intermediate site y is used
  have hT : ∑ y ∈ W, ∑ z ∈ W, q x y * q y z * (f y - f x) ^ 2
      = 2 * R * carreOn W q f f x := by
    have h1 : ∀ y ∈ W, ∑ z ∈ W, q x y * q y z * (f y - f x) ^ 2
        = R * (q x y * ((f y - f x) * (f y - f x))) := by
      intro y hy
      rw [← hR y hy, Finset.sum_mul]
      refine Finset.sum_congr rfl fun z _ => ?_
      ring
    rw [Finset.sum_congr rfl h1, ← Finset.mul_sum]
    simp only [carreOn]
    ring
  -- L Γ(f): the rate at x is used here
  have hA : genOn W q (fun y => carreOn W q f f y) x
      = (1 / 2) * (∑ y ∈ W, ∑ z ∈ W, q x y * q y z * (f z - f y) ^ 2)
        - R * carreOn W q f f x := by
    have h1 : ∑ y ∈ W, q x y * carreOn W q f f y
        = (1 / 2) * ∑ y ∈ W, ∑ z ∈ W, q x y * q y z * (f z - f y) ^ 2 := by
      simp only [carreOn, Finset.mul_sum]
      refine Finset.sum_congr rfl fun y _ => Finset.sum_congr rfl fun z _ => ?_
      ring
    have h2 : ∀ y ∈ W, q x y * (carreOn W q f f y - carreOn W q f f x)
        = q x y * carreOn W q f f y - q x y * carreOn W q f f x := by
      intro y _
      ring
    simp only [genOn]
    rw [Finset.sum_congr rfl h2, Finset.sum_sub_distrib, ← Finset.sum_mul, h1, hR x hx]
  have hL : ∑ y ∈ W, q x y * (f y - f x) * genOn W q f y
      = (1 / 2) * ((∑ y ∈ W, ∑ z ∈ W, q x y * q y z * (f z - f x) ^ 2)
          - (∑ y ∈ W, ∑ z ∈ W, q x y * q y z * (f y - f x) ^ 2)
          - ∑ y ∈ W, ∑ z ∈ W, q x y * q y z * (f z - f y) ^ 2) := by
    simp only [genOn, Finset.mul_sum, ← Finset.sum_sub_distrib]
    refine Finset.sum_congr rfl fun y _ => Finset.sum_congr rfl fun z _ => ?_
    ring
  -- Γ(f, L f)
  have hB : carreOn W q f (fun y => genOn W q f y) x
      = (1 / 2) * (∑ y ∈ W, q x y * (f y - f x) * genOn W q f y - (genOn W q f x) ^ 2) := by
    have h1 : ∀ y ∈ W, q x y * ((f y - f x) * (genOn W q f y - genOn W q f x))
        = q x y * (f y - f x) * genOn W q f y - q x y * (f y - f x) * genOn W q f x := by
      intro y _
      ring
    have h2 : ∑ y ∈ W, q x y * (f y - f x) = genOn W q f x := rfl
    simp only [carreOn]
    rw [Finset.sum_congr rfl h1, Finset.sum_sub_distrib, ← Finset.sum_mul, h2]
    ring
  simp only [gamma2On]
  rw [hA, hB, hL, hT, hS]
  ring

end RHFormal.B2
