import RHFormal.B2_BochnerPathForm

/-!
# Theorem B, (B3): the three-way split of Gamma_2 for the transformed jump process

Source: `rh/experiments/r2_curv/PROOF_bochner_parity.md`, Theorem B, item (B3) (seat R2-curv); theory
entry T64; nominated FIRST by S1-curv on board s1 (B98): "The seat missed its third sum in the first
draft, and F2(iii), G4 and every S/H/O number rest on it; it is a finite identity."

Informal statement (B98, quoted):

> W = {0..M-1}; k: Z -> R even, k(0) = 0; u: W -> R positive; q(x,y) = k(y-x) u(y)/u(x); assume
> sum_y q(x,y) = R for all x. Lf(x) = sum_y q(x,y)(f(y)-f(x));
> Gamma(f,g)(x) = (1/2) sum_y q(x,y)(f(y)-f(x))(g(y)-g(x)); Gamma_2(f) = (1/2) L Gamma(f,f) - Gamma(f, Lf).
> Then for all f and x (sums over a, b != 0; rho = u(x+a+b)/u(x)):
>  Gamma_2(f)(x) = (1/4) sum_{x+a, x+b, x+a+b in W} k(a)k(b) rho (f(x+a+b)-f(x+a)-f(x+b)+f(x))^2
>  + (1/2) sum_{x+a, x+b in W} k(a)k(b) [u(x+a)u(x+b)/u(x)^2 - rho 1(x+a+b in W)] (f(x+a)-f(x))(f(x+b)-f(x))
>  + (1/2) sum_{x+a, x+a+b in W, x+b not in W} k(a)k(b) rho [(f(x+a+b)-f(x+a))^2 - (1/2)(f(x+a+b)-f(x))^2].

FORMAL HERE, more generally: `G` any commutative group written additively (e.g. `ℤ`), `W` any finite
subset (the sites), `A` any finite set of shifts containing all differences `y - x` of sites,
`k, u, f : G → ℝ` any real functions with `u ≠ 0` on `W`. The three summands are the definitions
`sqTerm`, `hessTerm`, `openTerm` below; the sums run over ALL `a, b ∈ A` (a shift that leads out of
`W` contributes 0 through the conditions).

DIFFERENCES FROM THE INFORMAL STATEMENT:
* `W = {0..M-1} ⊂ ℤ` is replaced by any finite subset of any abelian group;
* `u > 0` is weakened to `u ≠ 0` on `W`; `k` even is NOT needed; `k(0) = 0` is NOT needed provided
  the sums include `a = 0`, `b = 0` (as they do here); if `k(0) = 0` those terms vanish, since every
  summand carries the factor `k(a) k(b)`, and the sums are the informal "sums over a, b ≠ 0";
* the total rate hypothesis is `∑_{y ∈ W} q(x,y) = R` including the term `y = x` (which is `k(0)`).
-/

open Finset

set_option linter.unusedSimpArgs false

namespace RHFormal.B3

open RHFormal.B2

variable {G : Type*} [AddCommGroup G] [DecidableEq G]

/-- Rates of the transformed jump process: `q(x,y) = k(y - x) u(y) / u(x)`. -/
noncomputable def rate (k u : G → ℝ) (x y : G) : ℝ := k (y - x) * u y / u x

/-- First summand (sum of squares over closed parallelograms `x, x+a, x+b, x+a+b`). -/
noncomputable def sqTerm (W : Finset G) (k u f : G → ℝ) (x a b : G) : ℝ :=
  if x + a ∈ W ∧ x + b ∈ W ∧ x + a + b ∈ W then
    k a * k b * (u (x + a + b) / u x) * (f (x + a + b) - f (x + a) - f (x + b) + f x) ^ 2
  else 0

/-- Second summand (the discrete Hessian of `-log u`). -/
noncomputable def hessTerm (W : Finset G) (k u f : G → ℝ) (x a b : G) : ℝ :=
  if x + a ∈ W ∧ x + b ∈ W then
    k a * k b * (u (x + a) * u (x + b) / u x ^ 2
        - (if x + a + b ∈ W then u (x + a + b) / u x else 0))
      * ((f (x + a) - f x) * (f (x + b) - f x))
  else 0

/-- Third summand (open paths: `x+a` and `x+a+b` in `W`, `x+b` outside: the window edge). -/
noncomputable def openTerm (W : Finset G) (k u f : G → ℝ) (x a b : G) : ℝ :=
  if x + a ∈ W ∧ x + a + b ∈ W ∧ x + b ∉ W then
    k a * k b * (u (x + a + b) / u x)
      * ((f (x + a + b) - f (x + a)) ^ 2 - (1 / 2) * (f (x + a + b) - f x) ^ 2)
  else 0

/-- Auxiliary: summand of the path form (all two-step paths `x → x+a → x+a+b` inside `W`). -/
noncomputable def pathTerm (W : Finset G) (k u f : G → ℝ) (x a b : G) : ℝ :=
  if x + a ∈ W ∧ x + a + b ∈ W then
    k a * k b * (u (x + a + b) / u x)
      * ((f (x + a + b) - f (x + a)) ^ 2 - (1 / 2) * (f (x + a + b) - f x) ^ 2)
  else 0

/-- Auxiliary: the closed paths among them. -/
noncomputable def closedTerm (W : Finset G) (k u f : G → ℝ) (x a b : G) : ℝ :=
  if x + a ∈ W ∧ x + b ∈ W ∧ x + a + b ∈ W then
    k a * k b * (u (x + a + b) / u x)
      * ((f (x + a + b) - f (x + a)) ^ 2 - (1 / 2) * (f (x + a + b) - f x) ^ 2)
  else 0

/-- Auxiliary: summand of `(L f(x))^2`. -/
noncomputable def lsqTerm (W : Finset G) (k u f : G → ℝ) (x a b : G) : ℝ :=
  if x + a ∈ W ∧ x + b ∈ W then
    k a * k b * (u (x + a) * u (x + b) / u x ^ 2) * ((f (x + a) - f x) * (f (x + b) - f x))
  else 0

/-- Re-indexing a sum over the sites by the shifts from a base site `x`. -/
theorem sum_shift (W A : Finset G) (hA : ∀ x ∈ W, ∀ y ∈ W, y - x ∈ A) (x : G) (hx : x ∈ W)
    (F : G → ℝ) : ∑ y ∈ W, F y = ∑ a ∈ A, if x + a ∈ W then F (x + a) else 0 := by
  rw [← Finset.sum_filter]
  symm
  refine Finset.sum_nbij' (fun a => x + a) (fun y => y - x) ?_ ?_ ?_ ?_ ?_
  · intro a ha
    exact (Finset.mem_filter.1 ha).2
  · intro y hy
    refine Finset.mem_filter.2 ⟨hA x hx y hy, ?_⟩
    rw [add_sub_cancel]
    exact hy
  · intro a _
    exact add_sub_cancel_left x a
  · intro y _
    exact add_sub_cancel x y
  · intro a _
    rfl

/-- `L f(x)` in shift coordinates. -/
theorem gen_shift (W A : Finset G) (hA : ∀ x ∈ W, ∀ y ∈ W, y - x ∈ A) (k u f : G → ℝ) (x : G)
    (hx : x ∈ W) :
    genOn W (rate k u) f x
      = ∑ a ∈ A, if x + a ∈ W then k a * (u (x + a) / u x) * (f (x + a) - f x) else 0 := by
  simp only [genOn]
  rw [sum_shift W A hA x hx (fun y => rate k u x y * (f y - f x))]
  refine Finset.sum_congr rfl fun a _ => ?_
  by_cases h : x + a ∈ W
  · simp only [h, ite_true, rate, add_sub_cancel_left]
    ring
  · simp only [h, ite_false]

/-- `(L f(x))^2` as a double sum over shifts. -/
theorem gen_sq_shift (W A : Finset G) (hA : ∀ x ∈ W, ∀ y ∈ W, y - x ∈ A) (k u f : G → ℝ) (x : G)
    (hx : x ∈ W) :
    (genOn W (rate k u) f x) ^ 2 = ∑ a ∈ A, ∑ b ∈ A, lsqTerm W k u f x a b := by
  rw [gen_shift W A hA k u f x hx, sq, Finset.sum_mul_sum]
  refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
  simp only [lsqTerm]
  by_cases h1 : x + a ∈ W <;> by_cases h2 : x + b ∈ W <;>
    simp only [h1, h2, and_self, and_true, and_false, ite_true, ite_false, mul_zero, zero_mul]
  ring

/-- The double sum of the path form in shift coordinates. -/
theorem path_shift (W A : Finset G) (hA : ∀ x ∈ W, ∀ y ∈ W, y - x ∈ A) (k u f : G → ℝ)
    (hu : ∀ x ∈ W, u x ≠ 0) (x : G) (hx : x ∈ W) :
    ∑ y ∈ W, ∑ z ∈ W, rate k u x y * rate k u y z
        * ((f z - f y) ^ 2 - (1 / 2) * (f z - f x) ^ 2)
      = ∑ a ∈ A, ∑ b ∈ A, pathTerm W k u f x a b := by
  rw [sum_shift W A hA x hx (fun y => ∑ z ∈ W, rate k u x y * rate k u y z
        * ((f z - f y) ^ 2 - (1 / 2) * (f z - f x) ^ 2))]
  refine Finset.sum_congr rfl fun a _ => ?_
  by_cases h1 : x + a ∈ W
  · simp only [h1, ite_true]
    rw [sum_shift W A hA (x + a) h1 (fun z => rate k u x (x + a) * rate k u (x + a) z
        * ((f z - f (x + a)) ^ 2 - (1 / 2) * (f z - f x) ^ 2))]
    refine Finset.sum_congr rfl fun b _ => ?_
    simp only [pathTerm]
    by_cases h2 : x + a + b ∈ W
    · have hu1 := hu x hx
      have hu2 := hu (x + a) h1
      simp only [h1, h2, and_self, ite_true, rate, add_sub_cancel_left]
      field_simp
    · simp only [h1, h2, and_false, ite_false]
  · simp only [h1, ite_false]
    symm
    refine Finset.sum_eq_zero fun b _ => ?_
    simp only [pathTerm, h1, false_and, ite_false]

/-- Paths are closed or open. -/
theorem pathTerm_eq (W : Finset G) (k u f : G → ℝ) (x a b : G) :
    pathTerm W k u f x a b = closedTerm W k u f x a b + openTerm W k u f x a b := by
  simp only [pathTerm, closedTerm, openTerm]
  by_cases h1 : x + a ∈ W <;> by_cases h2 : x + b ∈ W <;> by_cases h3 : x + a + b ∈ W <;>
    simp only [h1, h2, h3, and_self, and_true, and_false, true_and, false_and, ite_true, ite_false,
      not_true_eq_false, not_false_eq_true, add_zero, zero_add]

/-- Symmetrising a closed path under `a ↔ b`: the bracket becomes `(1/2) Δ^2 - A B` (twice). -/
theorem closedTerm_symm (W : Finset G) (k u f : G → ℝ) (x a b : G) :
    closedTerm W k u f x a b + closedTerm W k u f x b a
      = sqTerm W k u f x a b - 2 * lsqTerm W k u f x a b + 2 * hessTerm W k u f x a b := by
  simp only [closedTerm, sqTerm, lsqTerm, hessTerm]
  rw [add_right_comm x b a]
  by_cases h1 : x + a ∈ W <;> by_cases h2 : x + b ∈ W <;> by_cases h3 : x + a + b ∈ W <;>
    simp only [h1, h2, h3, and_self, and_true, and_false, true_and, false_and, ite_true, ite_false,
      add_zero, zero_add, sub_zero, mul_zero] <;>
    ring

/-- **Theorem B, (B3): the three-way split.** For the chain `q(x,y) = k(y-x) u(y)/u(x)` on a finite
set `W` of sites with constant total rate `R`, at every site `x ∈ W`:
`Γ₂(f)(x) = (1/4) ∑ sqTerm + (1/2) ∑ hessTerm + (1/2) ∑ openTerm`, the sums over all pairs of shifts. -/
theorem three_way_split (W A : Finset G) (hA : ∀ x ∈ W, ∀ y ∈ W, y - x ∈ A) (k u : G → ℝ)
    (hu : ∀ x ∈ W, u x ≠ 0) (R : ℝ) (hR : ∀ x ∈ W, ∑ y ∈ W, rate k u x y = R) (f : G → ℝ)
    (x : G) (hx : x ∈ W) :
    gamma2On W (rate k u) f x
      = (1 / 4) * ∑ a ∈ A, ∑ b ∈ A, sqTerm W k u f x a b
        + (1 / 2) * ∑ a ∈ A, ∑ b ∈ A, hessTerm W k u f x a b
        + (1 / 2) * ∑ a ∈ A, ∑ b ∈ A, openTerm W k u f x a b := by
  rw [path_form W (rate k u) R hR f x hx, gen_sq_shift W A hA k u f x hx,
    path_shift W A hA k u f hu x hx]
  -- closed + open
  have h1 : ∑ a ∈ A, ∑ b ∈ A, pathTerm W k u f x a b
      = (∑ a ∈ A, ∑ b ∈ A, closedTerm W k u f x a b)
        + ∑ a ∈ A, ∑ b ∈ A, openTerm W k u f x a b := by
    simp only [← Finset.sum_add_distrib]
    exact Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ =>
      pathTerm_eq W k u f x a b
  -- symmetrisation of the closed paths
  have h2 : ∑ a ∈ A, ∑ b ∈ A, closedTerm W k u f x a b
      = ∑ a ∈ A, ∑ b ∈ A, closedTerm W k u f x b a := Finset.sum_comm
  have h3 : (∑ a ∈ A, ∑ b ∈ A, closedTerm W k u f x a b)
        + ∑ a ∈ A, ∑ b ∈ A, closedTerm W k u f x b a
      = (∑ a ∈ A, ∑ b ∈ A, sqTerm W k u f x a b)
        - 2 * (∑ a ∈ A, ∑ b ∈ A, lsqTerm W k u f x a b)
        + 2 * ∑ a ∈ A, ∑ b ∈ A, hessTerm W k u f x a b := by
    simp only [Finset.mul_sum, ← Finset.sum_add_distrib, ← Finset.sum_sub_distrib]
    exact Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ =>
      closedTerm_symm W k u f x a b
  rw [h1]
  linarith

end RHFormal.B3
