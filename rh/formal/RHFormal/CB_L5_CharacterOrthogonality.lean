import Mathlib.NumberTheory.DirichletCharacter.Orthogonality
import Mathlib.NumberTheory.MulChar.Lemmas
import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.FieldTheory.IsSepClosed
import Mathlib.RingTheory.RootsOfUnity.AlgebraicallyClosed
import Mathlib.Tactic
set_option autoImplicit false

/-!
# COPY_BARRIER L5: the large-sieve identity for all characters mod q on a short interval

Source: `rh/specialists/sieve/COPY_BARRIER.md`, nomination L5 (from `TRANSPORT.md` 3c).

Informal statement, quoted:

> L5. Orthogonality (TRANSPORT 3c): for q > 2D and any a on [1, D],
> sum_{chi mod q} |sum a_n chi(n)|^2 = phi(q) sum_{(n,q)=1} |a_n|^2.

FORMAL HERE (characters with values in ℂ, `DirichletCharacter ℂ q`, `n` cast to `ZMod q`):
* `sum_char_mul_conj` : `∑_χ χ(a) conj(χ(b)) = φ(q)` if `b` is a unit and `a = b`, and `0` otherwise
  (from mathlib's `DirichletCharacter.sum_char_inv_mul_char_eq`, Michael Stoll);
* `sum_norm_sq_eq` (L5): for `D < q` and any `a : ℕ → ℂ`,
  `∑_{χ mod q} ‖∑_{n=1}^{D} a_n χ(n)‖^2 = φ(q) ∑_{1 ≤ n ≤ D, (n,q)=1} ‖a_n‖^2`.

DIFFERENCE: the hypothesis `q > 2D` of the nomination is replaced by the WEAKER `q > D` (all that is
used is that distinct `n, m ∈ [1, D]` are distinct mod `q`). Nothing else differs.
-/

open Finset

namespace RHFormal.CB.L5

variable {q : ℕ} [NeZero q]

omit [NeZero q] in
/-- `χ⁻¹(b) = χ(b⁻¹)` for a unit `b` of `ZMod q`. -/
theorem inv_apply_unit (χ : DirichletCharacter ℂ q) {b : ZMod q} (hb : IsUnit b) :
    χ⁻¹ b = χ b⁻¹ := by
  rw [MulChar.inv_apply]
  congr 1
  obtain ⟨u, rfl⟩ := hb
  rw [Ring.inverse_unit, ZMod.inv_coe_unit]

/-- **Orthogonality, conjugate form.** `∑_χ χ(a) conj(χ(b)) = φ(q) [b unit ∧ a = b]`. -/
theorem sum_char_mul_conj (a b : ZMod q) :
    ∑ χ : DirichletCharacter ℂ q, χ a * starRingEnd ℂ (χ b)
      = if IsUnit b ∧ a = b then (q.totient : ℂ) else 0 := by
  have hstar : ∀ χ : DirichletCharacter ℂ q, starRingEnd ℂ (χ b) = χ⁻¹ b := by
    intro χ
    rw [← MulChar.star_apply' χ b]
    rfl
  simp_rw [hstar]
  by_cases hb : IsUnit b
  · have h1 : ∀ χ : DirichletCharacter ℂ q, χ a * χ⁻¹ b = χ b⁻¹ * χ a := by
      intro χ
      rw [inv_apply_unit χ hb, mul_comm]
    simp_rw [h1]
    rw [DirichletCharacter.sum_char_inv_mul_char_eq ℂ hb a]
    by_cases hab : a = b
    · rw [ite_eq_left hab.symm, ite_eq_left ⟨hb, hab⟩]
    · rw [ite_eq_right (fun h => hab h.symm), ite_eq_right (fun h => hab h.2)]
  · have h1 : ∀ χ : DirichletCharacter ℂ q, χ a * χ⁻¹ b = 0 := by
      intro χ
      rw [MulChar.map_nonunit _ hb, mul_zero]
    simp_rw [h1, Finset.sum_const_zero]
    rw [ite_eq_right (fun h => hb h.1)]

/-- **L5.** For `D < q` and any coefficients `a`:
`∑_{χ mod q} ‖∑_{n=1}^{D} a_n χ(n)‖^2 = φ(q) ∑_{1 ≤ n ≤ D, (n, q) = 1} ‖a_n‖^2`. -/
theorem sum_norm_sq_eq (D : ℕ) (hDq : D < q) (a : ℕ → ℂ) :
    ∑ χ : DirichletCharacter ℂ q, ‖∑ n ∈ Finset.Ioc 0 D, a n * χ (n : ZMod q)‖ ^ 2
      = q.totient * ∑ n ∈ (Finset.Ioc 0 D).filter (fun n => Nat.Coprime n q), ‖a n‖ ^ 2 := by
  apply Complex.ofReal_injective
  push_cast
  -- ‖z‖^2 = z * conj z
  have hns : ∀ z : ℂ, ((‖z‖ ^ 2 : ℝ) : ℂ) = z * starRingEnd ℂ z := by
    intro z
    rw [Complex.mul_conj, Complex.normSq_eq_norm_sq]
  simp_rw [← Complex.ofReal_pow, hns]
  -- expand the left side
  have hexp : ∀ χ : DirichletCharacter ℂ q,
      (∑ n ∈ Finset.Ioc 0 D, a n * χ (n : ZMod q))
        * starRingEnd ℂ (∑ n ∈ Finset.Ioc 0 D, a n * χ (n : ZMod q))
      = ∑ n ∈ Finset.Ioc 0 D, ∑ m ∈ Finset.Ioc 0 D,
          a n * starRingEnd ℂ (a m) * (χ (n : ZMod q) * starRingEnd ℂ (χ (m : ZMod q))) := by
    intro χ
    rw [map_sum, Finset.sum_mul_sum]
    refine Finset.sum_congr rfl fun n _ => Finset.sum_congr rfl fun m _ => ?_
    rw [map_mul]
    ring
  simp_rw [hexp]
  rw [Finset.sum_comm]
  have hinner : ∀ n ∈ Finset.Ioc 0 D,
      ∑ χ : DirichletCharacter ℂ q, ∑ m ∈ Finset.Ioc 0 D,
          a n * starRingEnd ℂ (a m) * (χ (n : ZMod q) * starRingEnd ℂ (χ (m : ZMod q)))
        = if Nat.Coprime n q then (q.totient : ℂ) * (a n * starRingEnd ℂ (a n)) else 0 := by
    intro n hn
    rw [Finset.sum_comm]
    simp_rw [← Finset.mul_sum, sum_char_mul_conj]
    -- for n, m ∈ [1, D] with D < q: (n : ZMod q) = m ↔ n = m
    have hcast : ∀ m ∈ Finset.Ioc 0 D, ((n : ZMod q) = (m : ZMod q) ↔ n = m) := by
      intro m hm
      rw [ZMod.natCast_eq_natCast_iff', Nat.mod_eq_of_lt, Nat.mod_eq_of_lt]
      · exact lt_of_le_of_lt (Finset.mem_Ioc.1 hm).2 hDq
      · exact lt_of_le_of_lt (Finset.mem_Ioc.1 hn).2 hDq
    have h2 : ∀ m ∈ Finset.Ioc 0 D,
        a n * starRingEnd ℂ (a m)
            * (if IsUnit (m : ZMod q) ∧ (n : ZMod q) = (m : ZMod q) then (q.totient : ℂ) else 0)
          = if n = m then
              (if Nat.Coprime n q then (q.totient : ℂ) * (a n * starRingEnd ℂ (a n)) else 0)
            else 0 := by
      intro m hm
      by_cases hnm : n = m
      · subst hnm
        rw [ite_eq_left rfl]
        by_cases hc : Nat.Coprime n q
        · rw [ite_eq_left ⟨(ZMod.isUnit_iff_coprime n q).2 hc, rfl⟩, ite_eq_left hc]
          ring
        · rw [ite_eq_right (fun h => hc ((ZMod.isUnit_iff_coprime n q).1 h.1)), ite_eq_right hc, mul_zero]
      · rw [ite_eq_right (fun h => hnm ((hcast m hm).1 h.2)), ite_eq_right hnm, mul_zero]
    rw [Finset.sum_congr rfl h2, Finset.sum_ite_eq, ite_eq_left hn]
  rw [Finset.sum_congr rfl hinner, Finset.sum_filter, Finset.mul_sum]
  refine Finset.sum_congr rfl fun n _ => ?_
  split_ifs <;> simp

end RHFormal.CB.L5
