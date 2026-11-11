import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.Data.Real.Basic
import Mathlib.Tactic

/-!
# Theorem C (C1, C3 and the pointwise half of C2): Bakry-Emery calculus of the resampling chain

Source: `rh/experiments/r2_curv/PROOF_bochner_parity.md`, Theorem C (seat R2-curv, 2026-11-10).
Used by idea #11 (curvature loses a factor 2) and by the cubic seat's Theorem F (same factor).

Informal statement, quoted:

> Resampling chain: q_xy = lambda pi_y (self-jumps allowed), L f = lambda (pi f - f); its gap is lambda.
> (C1) Gamma_2(f)(x) = lambda^2 [ (1/4)(f(x) - pi f)^2 + (3/4) Var_pi f ],
>      Gamma(f)(x) = (lambda/2)[ Var_pi f + (f(x) - pi f)^2 ].
> (C2) Its Bakry-Emery constant is exactly (lambda/2)(1 + 2 min_x pi_x) ...
> (C3) Gamma_2(f) - lambda Gamma(f) = (lambda/4) L[(f - pi f)^2] pointwise.

with the definitions of the same file (Setting):

> L f(x) = sum_y q_xy (f_y - f_x),  Gamma(f)(x) = (1/2) sum_y q_xy (f_y - f_x)^2,
> Gamma_2(f) = (1/2) L Gamma(f) - Gamma(f, L f).

Here the operators are defined for an arbitrary rate matrix `q` on a finite type, exactly as in the
Setting, and then specialised to `q x y = lam * π y` with `∑ π = 1`.
-/

open Finset

namespace RHFormal.C1

variable {W : Type*} [Fintype W]

/-- Generator of the chain with rates `q`: `L f(x) = ∑_y q_xy (f_y - f_x)`. -/
def gen (q : W → W → ℝ) (f : W → ℝ) (x : W) : ℝ := ∑ y, q x y * (f y - f x)

/-- Carré du champ, bilinear: `Γ(f,g)(x) = (1/2) ∑_y q_xy (f_y - f_x)(g_y - g_x)`. -/
def carre (q : W → W → ℝ) (f g : W → ℝ) (x : W) : ℝ :=
  (1 / 2) * ∑ y, q x y * ((f y - f x) * (g y - g x))

/-- Iterated carré du champ: `Γ₂(f) = (1/2) L Γ(f,f) - Γ(f, L f)`. -/
def gamma2 (q : W → W → ℝ) (f : W → ℝ) (x : W) : ℝ :=
  (1 / 2) * gen q (fun y => carre q f f y) x - carre q f (fun y => gen q f y) x

/-- Mean `π f = ∑_y π_y f_y`. -/
def mean (π f : W → ℝ) : ℝ := ∑ y, π y * f y

/-- Variance `Var_π f = ∑_y π_y (f_y - π f)^2`. -/
def var (π f : W → ℝ) : ℝ := ∑ y, π y * (f y - mean π f) ^ 2

/-- Rates of the resampling chain: `q_xy = lam * π_y`. -/
def resample (lam : ℝ) (π : W → ℝ) : W → W → ℝ := fun _ y => lam * π y

/-- Second moment about any point: `∑ π_y (f_y - c)^2 = Var_π f + (c - π f)^2` when `∑ π = 1`. -/
theorem sum_sq_sub (π f : W → ℝ) (hπ : ∑ y, π y = 1) (c : ℝ) :
    ∑ y, π y * (f y - c) ^ 2 = var π f + (c - mean π f) ^ 2 := by
  have h1 : ∀ y, π y * (f y - c) ^ 2
      = π y * (f y - mean π f) ^ 2 + 2 * (mean π f - c) * (π y * f y)
        + ((mean π f - c) ^ 2 - 2 * (mean π f - c) * mean π f) * π y := by
    intro y
    ring
  simp_rw [h1, Finset.sum_add_distrib, ← Finset.mul_sum, hπ]
  simp only [var, mean]
  ring

/-- The generator of the resampling chain: `L f = lam (π f - f)`. -/
theorem gen_resample (lam : ℝ) (π f : W → ℝ) (hπ : ∑ y, π y = 1) (x : W) :
    gen (resample lam π) f x = lam * (mean π f - f x) := by
  have h1 : ∀ y, resample lam π x y * (f y - f x) = lam * (π y * f y) - lam * f x * π y := by
    intro y
    simp only [resample]
    ring
  simp only [gen]
  simp_rw [h1, Finset.sum_sub_distrib, ← Finset.mul_sum, hπ]
  simp only [mean]
  ring

/-- **(C1), second half.** `Γ(f)(x) = (lam/2) [Var_π f + (f(x) - π f)^2]`. -/
theorem carre_resample (lam : ℝ) (π f : W → ℝ) (hπ : ∑ y, π y = 1) (x : W) :
    carre (resample lam π) f f x = lam / 2 * (var π f + (f x - mean π f) ^ 2) := by
  have h1 : ∀ y, resample lam π x y * ((f y - f x) * (f y - f x))
      = lam * (π y * (f y - f x) ^ 2) := by
    intro y
    simp only [resample]
    ring
  simp only [carre]
  simp_rw [h1, ← Finset.mul_sum, sum_sq_sub π f hπ (f x)]
  ring

/-- **(C1), first half.** For the resampling chain `q_xy = lam π_y`, `∑ π = 1`:
`Γ₂(f)(x) = lam^2 [ (1/4)(f(x) - π f)^2 + (3/4) Var_π f ]`. No sign condition on `π` or `lam`. -/
theorem gamma2_resample (lam : ℝ) (π f : W → ℝ) (hπ : ∑ y, π y = 1) (x : W) :
    gamma2 (resample lam π) f x
      = lam ^ 2 * (1 / 4 * (f x - mean π f) ^ 2 + 3 / 4 * var π f) := by
  -- L Γ(f)
  have hLG : gen (resample lam π) (fun y => carre (resample lam π) f f y) x
      = lam ^ 2 / 2 * (var π f - (f x - mean π f) ^ 2) := by
    have h1 : ∀ y, resample lam π x y
        * (carre (resample lam π) f f y - carre (resample lam π) f f x)
        = lam ^ 2 / 2 * (π y * (f y - mean π f) ^ 2)
          - lam ^ 2 / 2 * (f x - mean π f) ^ 2 * π y := by
      intro y
      rw [carre_resample lam π f hπ y, carre_resample lam π f hπ x]
      simp only [resample]
      ring
    simp only [gen]
    simp_rw [h1, Finset.sum_sub_distrib, ← Finset.mul_sum, hπ]
    simp only [var]
    ring
  -- Γ(f, L f)
  have hGL : carre (resample lam π) f (fun y => gen (resample lam π) f y) x
      = -(lam ^ 2 / 2) * (var π f + (f x - mean π f) ^ 2) := by
    have h1 : ∀ y, resample lam π x y
        * ((f y - f x) * (gen (resample lam π) f y - gen (resample lam π) f x))
        = -lam ^ 2 * (π y * (f y - f x) ^ 2) := by
      intro y
      rw [gen_resample lam π f hπ y, gen_resample lam π f hπ x]
      simp only [resample]
      ring
    simp only [carre]
    simp_rw [h1, ← Finset.mul_sum, sum_sq_sub π f hπ (f x)]
    ring
  simp only [gamma2]
  rw [hLG, hGL]
  ring

/-- **(C3).** `Γ₂(f) - lam Γ(f) = (lam/4) L[(f - π f)^2]` pointwise. -/
theorem gamma2_sub_carre_resample (lam : ℝ) (π f : W → ℝ) (hπ : ∑ y, π y = 1) (x : W) :
    gamma2 (resample lam π) f x - lam * carre (resample lam π) f f x
      = lam / 4 * gen (resample lam π) (fun y => (f y - mean π f) ^ 2) x := by
  rw [gamma2_resample lam π f hπ x, carre_resample lam π f hπ x, gen_resample lam π _ hπ x]
  have h : mean π (fun y => (f y - mean π f) ^ 2) = var π f := rfl
  rw [h]
  ring

/-- Cauchy-Schwarz step of (C2): for a probability vector `π ≥ 0`,
`π_x (f(x) - π f)^2 ≤ (1 - π_x) Var_π f`. -/
theorem pi_mul_sq_le (π f : W → ℝ) (hπ : ∑ y, π y = 1) (hπ0 : ∀ y, 0 ≤ π y) (x : W) :
    π x * (f x - mean π f) ^ 2 ≤ (1 - π x) * var π f := by
  classical
  set m := mean π f with hm
  set g : W → ℝ := fun y => f y - m with hg
  -- ∑ π g = 0
  have h0 : ∑ y, π y * g y = 0 := by
    have h1 : ∀ y, π y * g y = π y * f y - m * π y := by
      intro y
      simp only [hg]
      ring
    simp_rw [h1, Finset.sum_sub_distrib, ← Finset.mul_sum, hπ]
    simp only [hm, mean]
    ring
  -- split off the site x
  have hsplit1 : π x * g x + ∑ y ∈ univ.erase x, π y * g y = 0 := by
    rw [Finset.add_sum_erase _ _ (Finset.mem_univ x)]
    exact h0
  have hsplit2 : π x + ∑ y ∈ univ.erase x, π y = 1 := by
    rw [Finset.add_sum_erase _ _ (Finset.mem_univ x)]
    exact hπ
  have hsplit3 : π x * g x ^ 2 + ∑ y ∈ univ.erase x, π y * g y ^ 2 = var π f := by
    rw [Finset.add_sum_erase _ (fun y => π y * g y ^ 2) (Finset.mem_univ x)]
    rfl
  -- Cauchy-Schwarz on the other sites
  have hcs : (∑ y ∈ univ.erase x, π y * g y) ^ 2
      ≤ (∑ y ∈ univ.erase x, π y) * ∑ y ∈ univ.erase x, π y * g y ^ 2 := by
    exact Finset.sum_sq_le_sum_mul_sum_of_sq_le_mul _ (fun y _ => hπ0 y)
      (fun y _ => mul_nonneg (hπ0 y) (sq_nonneg _)) (fun y _ => le_of_eq (by ring))
  have e1 : ∑ y ∈ univ.erase x, π y * g y = -(π x * g x) := by linarith
  have e2 : ∑ y ∈ univ.erase x, π y = 1 - π x := by linarith
  have e3 : ∑ y ∈ univ.erase x, π y * g y ^ 2 = var π f - π x * g x ^ 2 := by linarith
  rw [e1, e2, e3] at hcs
  have hgx : g x = f x - m := rfl
  rw [hgx] at hcs
  nlinarith [hcs]

/-- **(C2), pointwise lower bound.** At every site `x`,
`Γ₂(f)(x) ≥ (lam/2)(1 + 2 π_x) Γ(f)(x)` for a probability vector `π ≥ 0`. -/
theorem gamma2_ge_resample (lam : ℝ) (π f : W → ℝ) (hπ : ∑ y, π y = 1) (hπ0 : ∀ y, 0 ≤ π y)
    (x : W) :
    lam / 2 * (1 + 2 * π x) * carre (resample lam π) f f x ≤ gamma2 (resample lam π) f x := by
  rw [gamma2_resample lam π f hπ x, carre_resample lam π f hπ x]
  have h := pi_mul_sq_le π f hπ hπ0 x
  have hl : 0 ≤ lam ^ 2 := sq_nonneg lam
  nlinarith [mul_nonneg hl (sub_nonneg.2 h)]

end RHFormal.C1
