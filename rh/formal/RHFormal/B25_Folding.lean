import Mathlib.Data.Fintype.BigOperators
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic

/-!
# The folding identity (B25; also the common step of F3, F4 and D5)

Source: board s1, message B92 (S1-parity, nomination; the finite identity behind B25), used also by
S1-curv (B98: "F3 and F4, step: both are S1-parity's folding identity of B92 plus one line") and by
Theorem D5 of `rh/experiments/r2_curv/PROOF_bochner_parity.md`.

Informal statement (B92, quoted):

> B25: the folding identity. Let K be a real symmetric matrix indexed by {-n..-1} u {1..n} with
> K(i,j) = K(-i,-j); for phi in R^n put f_e(+-i) = phi_i, f_o(+-i) = +-phi_i. Then
> f_e^T K f_e - f_o^T K f_o = 4 sum_{i,j>0} phi_i phi_j K(i,-j)  and
> f_e^T K f_e + f_o^T K f_o = 4 sum_{i,j>0} phi_i phi_j K(i,j).

FORMAL HERE. The index set `{-n..-1} ∪ {1..n}` is the disjoint union `ι ⊕ ι` of two copies of a finite
type `ι`: `Sum.inl i` is the point `+i`, `Sum.inr i` the point `-i`; the reflection is `Sum.swap`.
`K` is any real kernel invariant under the reflection, `K(-a, -b) = K(a, b)`.
Symmetry of `K` is NOT needed for the two identities (Lean accepted the statement without it).
-/

open Finset

namespace RHFormal.B25

variable {ι : Type*} [Fintype ι]

/-- The quadratic form `f^T K f` on the doubled index set. -/
def quad (K : ι ⊕ ι → ι ⊕ ι → ℝ) (f : ι ⊕ ι → ℝ) : ℝ := ∑ a, ∑ b, f a * K a b * f b

/-- Even extension: `f_e(±i) = φ_i`. -/
def evenExt (φ : ι → ℝ) : ι ⊕ ι → ℝ := Sum.elim φ φ

/-- Odd extension: `f_o(±i) = ±φ_i`. -/
def oddExt (φ : ι → ℝ) : ι ⊕ ι → ℝ := Sum.elim φ (fun i => -φ i)

variable (K : ι ⊕ ι → ι ⊕ ι → ℝ) (φ : ι → ℝ)

/-- The form on the even extension: `f_e^T K f_e = 2 ∑ φ_i φ_j (K(i,j) + K(i,-j))`. -/
theorem quad_even (hK : ∀ a b, K (Sum.swap a) (Sum.swap b) = K a b) :
    quad K (evenExt φ)
      = 2 * ∑ i, ∑ j, φ i * φ j * (K (Sum.inl i) (Sum.inl j) + K (Sum.inl i) (Sum.inr j)) := by
  have h1 : ∀ i j, K (Sum.inr i) (Sum.inr j) = K (Sum.inl i) (Sum.inl j) :=
    fun i j => hK (Sum.inl i) (Sum.inl j)
  have h2 : ∀ i j, K (Sum.inr i) (Sum.inl j) = K (Sum.inl i) (Sum.inr j) :=
    fun i j => hK (Sum.inl i) (Sum.inr j)
  simp only [quad, evenExt, Fintype.sum_sum_type, Sum.elim_inl, Sum.elim_inr, h1, h2]
  simp only [Finset.mul_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  ring

/-- The form on the odd extension: `f_o^T K f_o = 2 ∑ φ_i φ_j (K(i,j) - K(i,-j))`. -/
theorem quad_odd (hK : ∀ a b, K (Sum.swap a) (Sum.swap b) = K a b) :
    quad K (oddExt φ)
      = 2 * ∑ i, ∑ j, φ i * φ j * (K (Sum.inl i) (Sum.inl j) - K (Sum.inl i) (Sum.inr j)) := by
  have h1 : ∀ i j, K (Sum.inr i) (Sum.inr j) = K (Sum.inl i) (Sum.inl j) :=
    fun i j => hK (Sum.inl i) (Sum.inl j)
  have h2 : ∀ i j, K (Sum.inr i) (Sum.inl j) = K (Sum.inl i) (Sum.inr j) :=
    fun i j => hK (Sum.inl i) (Sum.inr j)
  simp only [quad, oddExt, Fintype.sum_sum_type, Sum.elim_inl, Sum.elim_inr, h1, h2]
  simp only [Finset.mul_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  ring

/-- **Folding identity, difference.** `f_e^T K f_e - f_o^T K f_o = 4 ∑_{i,j>0} φ_i φ_j K(i,-j)`
(four times the mirror / Hankel form). -/
theorem quad_even_sub_odd (hK : ∀ a b, K (Sum.swap a) (Sum.swap b) = K a b) :
    quad K (evenExt φ) - quad K (oddExt φ)
      = 4 * ∑ i, ∑ j, φ i * φ j * K (Sum.inl i) (Sum.inr j) := by
  rw [quad_even K φ hK, quad_odd K φ hK]
  simp only [Finset.mul_sum, ← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  ring

/-- **Folding identity, sum.** `f_e^T K f_e + f_o^T K f_o = 4 ∑_{i,j>0} φ_i φ_j K(i,j)`
(four times the shift / Toeplitz form on the half window). -/
theorem quad_even_add_odd (hK : ∀ a b, K (Sum.swap a) (Sum.swap b) = K a b) :
    quad K (evenExt φ) + quad K (oddExt φ)
      = 4 * ∑ i, ∑ j, φ i * φ j * K (Sum.inl i) (Sum.inl j) := by
  rw [quad_even K φ hK, quad_odd K φ hK]
  simp only [Finset.mul_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  ring

end RHFormal.B25
