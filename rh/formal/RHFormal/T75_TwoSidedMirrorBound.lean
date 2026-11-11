import RHFormal.B25_Folding

/-!
# T75 (finite form): the two block inequalities are a two-sided bound of the mirror form by the
# half-window shift form

Source: `rh/THEORY.md`, entry T75; `rh/experiments/s1_seminar/curv/S1_ADDITIONS.md`, F4; board s1,
B31 (a) (S1-curv), B60 (S1-mirror), B25 (S1-parity). Depends on T74 (folding, `B25_Folding.lean`).

Informal statement (THEORY.md T75, quoted):

> For real phi in L^2(0, L] let T(phi) := T_K(phi) (the half-window shift form of N ...:
> N(f_e) + N(f_o) = 4 T(phi)), H(phi) := H_K(phi), c := int phi cosh(x/2), s := int phi sinh(x/2).
> Then [N(f) <= 2<f,c>^2 for all even f in L^2(-L,L)] <=> [H(phi) <= 4c^2 - T(phi) for all phi], and
> [N(f) <= -2<f,s>^2 for all odd f] <=> [H(phi) >= 4s^2 + T(phi) for all phi]. Hence window
> positivity <=> T(phi) + 4s^2 <= H(phi) <= 4c^2 - T(phi) for all phi on (0, L].

FORMAL HERE, in the finite (matrix) setting of `B25_Folding.lean`: index set `ι ⊕ ι` (`inl i` = the
point `+i`, `inr i` = the point `-i`), `K` a real kernel with `K(-a,-b) = K(a,b)`,
`T φ = ∑ φ_i φ_j K(i,j)`, `H φ = ∑ φ_i φ_j K(i,-j)`, `C` an even vector (cosh), `S` an odd vector
(sinh), `c φ = ∑ φ_i C(i)`, `s φ = ∑ φ_i S(i)` (sums over the half window).
* `pair_even`, `pair_odd` : `<f_e, C> = 2 c(φ)`, `<f_o, S> = 2 s(φ)`;
* `even_block_iff` : `N(f_e) ≤ 2 <f_e, C>^2  ↔  H φ ≤ 4 c(φ)^2 - T φ`;
* `odd_block_iff`  : `N(f_o) ≤ -2 <f_o, S>^2 ↔  T φ + 4 s(φ)^2 ≤ H φ`.
Every even (odd) vector on `ι ⊕ ι` is `f_e` (`f_o`) of its restriction `φ` to the half window, so
these are the two equivalences of T75, vector by vector.

NOT FORMAL: the continuum statement (functions in L^2(0, L], integrals, the kernel with atoms).
-/

open Finset

namespace RHFormal.T75

open RHFormal.B25

variable {ι : Type*} [Fintype ι]

/-- Half-window shift (Toeplitz) form `T φ = ∑_{i,j>0} φ_i φ_j K(i,j)`. -/
def shiftForm (K : ι ⊕ ι → ι ⊕ ι → ℝ) (φ : ι → ℝ) : ℝ :=
  ∑ i, ∑ j, φ i * φ j * K (Sum.inl i) (Sum.inl j)

/-- Mirror (Hankel) form `H φ = ∑_{i,j>0} φ_i φ_j K(i,-j)`. -/
def mirrorForm (K : ι ⊕ ι → ι ⊕ ι → ℝ) (φ : ι → ℝ) : ℝ :=
  ∑ i, ∑ j, φ i * φ j * K (Sum.inl i) (Sum.inr j)

variable (K : ι ⊕ ι → ι ⊕ ι → ℝ) (φ : ι → ℝ)

/-- `N(f_e) = 2 (T + H)(φ)`. -/
theorem quad_even_eq (hK : ∀ a b, K (Sum.swap a) (Sum.swap b) = K a b) :
    quad K (evenExt φ) = 2 * (shiftForm K φ + mirrorForm K φ) := by
  rw [quad_even K φ hK]
  simp only [shiftForm, mirrorForm, ← Finset.sum_add_distrib]
  congr 1
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  ring

/-- `N(f_o) = 2 (T - H)(φ)`. -/
theorem quad_odd_eq (hK : ∀ a b, K (Sum.swap a) (Sum.swap b) = K a b) :
    quad K (oddExt φ) = 2 * (shiftForm K φ - mirrorForm K φ) := by
  rw [quad_odd K φ hK]
  simp only [shiftForm, mirrorForm, ← Finset.sum_sub_distrib]
  congr 1
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  ring

/-- Pairing of the even extension with an even vector: `<f_e, C> = 2 ∑ φ_i C(i)`. -/
theorem pair_even (C : ι ⊕ ι → ℝ) (hC : ∀ a, C (Sum.swap a) = C a) :
    ∑ a, evenExt φ a * C a = 2 * ∑ i, φ i * C (Sum.inl i) := by
  have h : ∀ i, C (Sum.inr i) = C (Sum.inl i) := fun i => hC (Sum.inl i)
  simp only [evenExt, Fintype.sum_sum_type, Sum.elim_inl, Sum.elim_inr, h]
  ring

/-- Pairing of the odd extension with an odd vector: `<f_o, S> = 2 ∑ φ_i S(i)`. -/
theorem pair_odd (S : ι ⊕ ι → ℝ) (hS : ∀ a, S (Sum.swap a) = -S a) :
    ∑ a, oddExt φ a * S a = 2 * ∑ i, φ i * S (Sum.inl i) := by
  have h : ∀ i, S (Sum.inr i) = -S (Sum.inl i) := fun i => hS (Sum.inl i)
  simp only [oddExt, Fintype.sum_sum_type, Sum.elim_inl, Sum.elim_inr, h, neg_mul_neg]
  ring

/-- **T75, even block.** `N(f_e) ≤ 2 <f_e, C>^2  ↔  H(φ) ≤ 4 c^2 - T(φ)`, `c = ∑ φ_i C(i)`. -/
theorem even_block_iff (hK : ∀ a b, K (Sum.swap a) (Sum.swap b) = K a b) (C : ι ⊕ ι → ℝ)
    (hC : ∀ a, C (Sum.swap a) = C a) :
    quad K (evenExt φ) ≤ 2 * (∑ a, evenExt φ a * C a) ^ 2
      ↔ mirrorForm K φ ≤ 4 * (∑ i, φ i * C (Sum.inl i)) ^ 2 - shiftForm K φ := by
  rw [quad_even_eq K φ hK, pair_even φ C hC]
  constructor <;> intro h <;> nlinarith

/-- **T75, odd block.** `N(f_o) ≤ -2 <f_o, S>^2  ↔  T(φ) + 4 s^2 ≤ H(φ)`, `s = ∑ φ_i S(i)`. -/
theorem odd_block_iff (hK : ∀ a b, K (Sum.swap a) (Sum.swap b) = K a b) (S : ι ⊕ ι → ℝ)
    (hS : ∀ a, S (Sum.swap a) = -S a) :
    quad K (oddExt φ) ≤ -2 * (∑ a, oddExt φ a * S a) ^ 2
      ↔ shiftForm K φ + 4 * (∑ i, φ i * S (Sum.inl i)) ^ 2 ≤ mirrorForm K φ := by
  rw [quad_odd_eq K φ hK, pair_odd φ S hS]
  constructor <;> intro h <;> nlinarith

end RHFormal.T75
