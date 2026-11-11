import RHFormal.OnePositiveDirection
import Mathlib.LinearAlgebra.Matrix.BilinearForm
set_option autoImplicit false

/-!
# T63: the ground-state transform. The form of N is lambda_1 minus a Dirichlet form, and
# "one positive direction" is a Poincare inequality with constant lambda_1

Source: `rh/THEORY.md`, entry T63; `rh/experiments/r2_curv/PROOF_bochner_parity.md`, Theorem A (A0);
`rh/NOTEBOOK.md` entry N29 step 3.

Informal statement (THEORY.md T63, quoted in part):

> W a finite set, N a real symmetric matrix on W with N_xy >= 0 for x != y, irreducible; lambda_1 its
> top eigenvalue, u > 0 the normalised eigenvector (Perron-Frobenius), pi = u^2; ...
> E(h) = (1/2) sum_{x != y} N_xy u_x u_y (h_x - h_y)^2 ... Then for every vector h:
> <uh, N uh> = lambda_1 ||h||_pi^2 - E(h) (uh the pointwise product). Consequently N has at most one
> positive eigenvalue iff E(h) >= lambda_1 ||h||_pi^2 for all h with pi-mean zero, i.e. iff the
> reversible jump process with rates q_xy has spectral gap >= lambda_1.

FORMAL HERE (`W` a finite type, `N` a real symmetric matrix, `u` a vector with `N u = lam u`):
* `ground_state_identity` : `<uh, N uh> = lam ∑ u_x^2 h_x^2 - E(h)` for every `h`
  (`E` = `dirichlet`, the sum over ALL pairs; the diagonal pairs contribute 0);
* `atMostOnePos_iff_poincare` : if moreover `u > 0` entrywise and `lam > 0`, then
  `N` has at most one positive direction (`RHFormal.AtMostOnePos`, see `OnePositiveDirection.lean`)
  iff `E(h) ≥ lam ∑ u_x^2 h_x^2` for all `h` with `∑ u_x^2 h_x = 0`.

DIFFERENCES FROM THE INFORMAL STATEMENT:
* MORE GENERAL: the identity needs only symmetry and `N u = lam u` (no sign of the entries, no
  irreducibility, `lam` any eigenvalue, `u` any eigenvector, no normalisation); the equivalence needs in
  addition only `u > 0` and `lam > 0`. Non-negative off-diagonal entries and irreducibility are what
  PROVIDE such a `u` (Perron-Frobenius, not formalised); they are not used after that.
* "at most one positive eigenvalue" is `AtMostOnePos` (no positive definite plane).
* The last clause ("i.e. iff the jump process has spectral gap >= lambda_1") is not formalised.
-/

open Finset

namespace RHFormal.T63

variable {W : Type*} [Fintype W]

/-- Dirichlet form `E(h) = (1/2) ∑_{x,y} N_xy u_x u_y (h_x - h_y)^2`. -/
noncomputable def dirichlet (N : Matrix W W ℝ) (u h : W → ℝ) : ℝ :=
  (1 / 2) * ∑ x, ∑ y, N x y * u x * u y * (h x - h y) ^ 2

/-- **(A0), sum form.** `∑_{x,y} (u_x h_x) N_xy (u_y h_y) = lam ∑ u_x^2 h_x^2 - E(h)`. -/
theorem ground_state_sum (N : Matrix W W ℝ) (hN : ∀ x y, N x y = N y x) (u : W → ℝ) (lam : ℝ)
    (hu : ∀ x, ∑ y, N x y * u y = lam * u x) (h : W → ℝ) :
    ∑ x, ∑ y, (u x * h x) * N x y * (u y * h y)
      = lam * ∑ x, u x ^ 2 * h x ^ 2 - dirichlet N u h := by
  have hA : ∑ x, ∑ y, N x y * u x * u y * h x ^ 2 = lam * ∑ x, u x ^ 2 * h x ^ 2 := by
    rw [Finset.mul_sum]
    refine Finset.sum_congr rfl fun x _ => ?_
    have h1 : ∑ y, N x y * u x * u y * h x ^ 2 = (∑ y, N x y * u y) * (u x * h x ^ 2) := by
      rw [Finset.sum_mul]
      refine Finset.sum_congr rfl fun y _ => ?_
      ring
    rw [h1, hu x]
    ring
  have hB : ∑ x, ∑ y, N x y * u x * u y * h y ^ 2 = lam * ∑ x, u x ^ 2 * h x ^ 2 := by
    rw [Finset.sum_comm, ← hA]
    refine Finset.sum_congr rfl fun y _ => Finset.sum_congr rfl fun x _ => ?_
    rw [hN x y]
    ring
  have hD : dirichlet N u h
      = (1 / 2) * ((∑ x, ∑ y, N x y * u x * u y * h x ^ 2)
          + ∑ x, ∑ y, N x y * u x * u y * h y ^ 2)
        - ∑ x, ∑ y, (u x * h x) * N x y * (u y * h y) := by
    simp only [dirichlet, Finset.mul_sum, ← Finset.sum_add_distrib, ← Finset.sum_sub_distrib]
    refine Finset.sum_congr rfl fun x _ => Finset.sum_congr rfl fun y _ => ?_
    ring
  rw [hD, hA, hB]
  ring

variable [DecidableEq W]

/-- **(A0).** `<uh, N uh> = lam ‖h‖_π^2 - E(h)` with `π = u^2`, in terms of the bilinear form of `N`. -/
theorem ground_state_identity (N : Matrix W W ℝ) (hN : ∀ x y, N x y = N y x) (u : W → ℝ)
    (lam : ℝ) (hu : ∀ x, ∑ y, N x y * u y = lam * u x) (h : W → ℝ) :
    Matrix.toBilin' N (fun x => u x * h x) (fun x => u x * h x)
      = lam * ∑ x, u x ^ 2 * h x ^ 2 - dirichlet N u h := by
  rw [Matrix.toBilin'_apply]
  exact ground_state_sum N hN u lam hu h

/-- `u^T N x = lam <u, x>`. -/
theorem toBilin_eigen (N : Matrix W W ℝ) (hN : ∀ x y, N x y = N y x) (u : W → ℝ) (lam : ℝ)
    (hu : ∀ x, ∑ y, N x y * u y = lam * u x) (x : W → ℝ) :
    Matrix.toBilin' N u x = lam * ∑ y, u y * x y := by
  rw [Matrix.toBilin'_apply, Finset.sum_comm, Finset.mul_sum]
  refine Finset.sum_congr rfl fun j _ => ?_
  have h1 : ∑ i, u i * N i j * x j = (∑ i, N j i * u i) * x j := by
    rw [Finset.sum_mul]
    refine Finset.sum_congr rfl fun i _ => ?_
    rw [hN j i]
    ring
  rw [h1, hu j]
  ring

/-- **T63, "consequently".** For a symmetric `N` with a positive eigenvector `u`, `N u = lam u`,
`lam > 0`: `N` has at most one positive direction iff the Poincaré inequality
`E(h) ≥ lam ‖h‖_π^2` holds for all `h` of `π`-mean zero (`π = u^2`). -/
theorem atMostOnePos_iff_poincare [Nonempty W] (N : Matrix W W ℝ) (hN : ∀ x y, N x y = N y x)
    (u : W → ℝ) (hu0 : ∀ x, 0 < u x) (lam : ℝ) (hlam : 0 < lam)
    (hu : ∀ x, ∑ y, N x y * u y = lam * u x) :
    AtMostOnePos (Matrix.toBilin' N)
      ↔ ∀ h : W → ℝ, ∑ x, u x ^ 2 * h x = 0 → lam * ∑ x, u x ^ 2 * h x ^ 2 ≤ dirichlet N u h := by
  have hBsymm : ∀ x y, Matrix.toBilin' N x y = Matrix.toBilin' N y x := by
    intro x y
    rw [Matrix.toBilin'_apply, Matrix.toBilin'_apply, Finset.sum_comm]
    refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
    rw [hN j i]
    ring
  have hBuu : 0 < Matrix.toBilin' N u u := by
    rw [toBilin_eigen N hN u lam hu u]
    have : 0 < ∑ y, u y * u y :=
      Finset.sum_pos (fun y _ => mul_pos (hu0 y) (hu0 y)) Finset.univ_nonempty
    positivity
  constructor
  · intro hA h hmean
    have hrc := (atMostOnePos_iff_reverse_cauchy_schwarz _ hBsymm).1 hA u
      (fun x => u x * h x) hBuu
    have h0 : Matrix.toBilin' N u (fun x => u x * h x) = 0 := by
      rw [toBilin_eigen N hN u lam hu]
      have : ∑ y, u y * (u y * h y) = ∑ y, u y ^ 2 * h y :=
        Finset.sum_congr rfl fun y _ => by ring
      rw [this, hmean, mul_zero]
    rw [h0, ground_state_identity N hN u lam hu h] at hrc
    by_contra hc
    rw [not_le] at hc
    have h1 : 0 < lam * ∑ x, u x ^ 2 * h x ^ 2 - dirichlet N u h := by linarith
    have h2 := mul_pos hBuu h1
    nlinarith
  · intro hP
    refine atMostOnePos_of_nonpos_on_ker _ hBsymm (Matrix.toBilin' N u) ?_
    intro x hx
    have hxh : x = fun y => u y * (x y / u y) := by
      funext y
      have := (hu0 y).ne'
      field_simp
    have hmean : ∑ y, u y ^ 2 * (x y / u y) = 0 := by
      rw [toBilin_eigen N hN u lam hu x] at hx
      have h1 : ∑ y, u y * x y = 0 := by
        rcases mul_eq_zero.1 hx with h | h
        · exact absurd h hlam.ne'
        · exact h
      rw [← h1]
      refine Finset.sum_congr rfl fun y _ => ?_
      have := (hu0 y).ne'
      field_simp
    have h2 := hP (fun y => x y / u y) hmean
    rw [hxh, ground_state_identity N hN u lam hu (fun y => x y / u y)]
    linarith

end RHFormal.T63
