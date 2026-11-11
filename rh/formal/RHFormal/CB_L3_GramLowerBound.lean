import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.Complex.Norm
import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.Data.Nat.Cast.Order.Field
import Mathlib.Tactic
set_option autoImplicit false

/-!
# COPY_BARRIER L3 / Theorem 1: general-coefficient sieves pay for the copies

Source: `rh/specialists/sieve/COPY_BARRIER.md` (SP-sieve), sections 0, 1 (Theorem 1) and nomination L3.

Informal statements, quoted:

> (Setting) Delta(F, D) is the least constant with
> sum_{chi in F} |sum_n a_n chi(n)|^2 <= Delta sum |a_n|^2 for ALL a. ... An (exact) COPY is a member
> that is principal: chi(n) = 1_{(n, r_chi) = 1} for some modulus r_chi; it is an eta-copy if
> sum_{p | r_chi} 1/N(p) <= eta. C_eta(F) = number of eta-copies (with multiplicity).

> Theorem 1. For every F, D >= 1 and 0 <= eta < 1/2: Delta(F, D) >= (1 - 2 eta)^2 C_eta(F) D.
> Proof. Take a_n = 1 (n <= D) ... For an eta-copy, sum_{n<=D} chi(n) = D - #{n <= D : (n, r) != 1}
> >= D - sum_{p|r} D/N(p) >= (1 - eta) D ... (The constant (1 - 2eta)^2 covers members that are 1 off the
> multiples and arbitrary on them.)

> L3. Gram lower bound: if a family of C vectors v_1..v_C in C^D each satisfies
> Re sum_n v_i(n) >= (1 - 2eta) D, then the operator V: C^D -> C^C, (Va)_i = sum_n a_n v_i(n), has
> ||V||^2 >= (1 - 2eta)^2 C D (test vector a = (1, ..., 1)).

FORMAL HERE (over ℚ, i.e. `N(p) = p`; members indexed by a finite type `ι`, so multiplicity is allowed):
* `delta_ge_of_test` (L3, Δ-form): `N` any non-empty finite support, `Cs ⊆ ι` a set of members with
  `Re ∑_{n∈N} v_i(n) ≥ c |N|`, `c ≥ 0`; if `Δ` satisfies the large-sieve inequality for ALL `a`, then
  `Δ ≥ c^2 |Cs| |N|`;
* `opNorm_sq_ge` (L3, operator form): the same for `Δ = ‖V‖^2`, `V` the operator `ℓ²(N) → ℓ²(ι)`;
* `card_not_coprime_le`: `#{1 ≤ n ≤ D : (n, r) ≠ 1} ≤ ∑_{p | r} D/p` (`r ≠ 0`);
* `exact_copy_sum_ge`: for an exact η-copy, `∑_{n ≤ D} 1_{(n,r)=1} ≥ (1 - η) D`;
* `near_copy_re_sum_ge`: for a member equal to `1` on `(n, r) = 1` and of modulus `≤ 1` elsewhere,
  `Re ∑_{n ≤ D} v(n) ≥ (1 - 2η) D`;
* `theorem1`: **Theorem 1**: `Δ ≥ (1 - 2η)^2 C_η D` for such members, `η ≤ 1/2`;
* `theorem1_exact`: for EXACT copies the constant improves to `(1 - η)^2`, `η ≤ 1`.

DIFFERENCES: over ℚ only (the number-field variant with `N(p)` is not formalised). "Δ is the least
constant" is not needed: the bound holds for every admissible `Δ`. The hypothesis `η < 1/2` is used
as `η ≤ 1/2`. The Remark on multiplicities is not formalised.
-/

open Finset

namespace RHFormal.CB.L3

/-- **L3, Δ-form.** Let `N` be a non-empty finite support, `v i : α → ℂ` the members, `Cs` a set of
members with `Re ∑_{n∈N} v_i(n) ≥ c |N|` (`c ≥ 0`). If
`∑_i |∑_{n∈N} a_n v_i(n)|^2 ≤ Δ ∑_{n∈N} |a_n|^2` for every `a`, then `Δ ≥ c^2 |Cs| |N|`. -/
theorem delta_ge_of_test {ι α : Type*} [Fintype ι] (v : ι → α → ℂ) (N : Finset α)
    (hN : N.Nonempty) (Cs : Finset ι) (c : ℝ) (hc : 0 ≤ c)
    (hcopy : ∀ i ∈ Cs, c * N.card ≤ (∑ n ∈ N, v i n).re) (Δ : ℝ)
    (hΔ : ∀ a : α → ℂ, ∑ i, ‖∑ n ∈ N, a n * v i n‖ ^ 2 ≤ Δ * ∑ n ∈ N, ‖a n‖ ^ 2) :
    c ^ 2 * Cs.card * N.card ≤ Δ := by
  have hNpos : (0 : ℝ) < N.card := by exact_mod_cast hN.card_pos
  have h1 := hΔ (fun _ => 1)
  simp only [one_mul, norm_one, one_pow, Finset.sum_const, nsmul_eq_mul, mul_one] at h1
  -- each copy row contributes at least (c |N|)^2
  have h2 : ∀ i ∈ Cs, (c * N.card) ^ 2 ≤ ‖∑ n ∈ N, v i n‖ ^ 2 := by
    intro i hi
    have h3 := hcopy i hi
    have h4 := Complex.re_le_norm (∑ n ∈ N, v i n)
    have h5 : 0 ≤ c * N.card := by positivity
    nlinarith
  have h6 : ∑ i ∈ Cs, ‖∑ n ∈ N, v i n‖ ^ 2 ≤ ∑ i, ‖∑ n ∈ N, v i n‖ ^ 2 :=
    Finset.sum_le_sum_of_subset_of_nonneg (Finset.subset_univ Cs) fun i _ _ => sq_nonneg _
  have h7 : (Cs.card : ℝ) * (c * N.card) ^ 2 ≤ ∑ i ∈ Cs, ‖∑ n ∈ N, v i n‖ ^ 2 := by
    have := Finset.sum_le_sum h2
    simpa [Finset.sum_const, nsmul_eq_mul] using this
  have h8 : (Cs.card : ℝ) * (c * N.card) ^ 2 ≤ Δ * N.card := by linarith
  have e : (Cs.card : ℝ) * (c * N.card) ^ 2 = (c ^ 2 * Cs.card * N.card) * N.card := by ring
  rw [e] at h8
  exact le_of_mul_le_mul_right h8 hNpos

/-- **L3, operator form.** If `V : ℓ²(α) → ℓ²(ι)` is a continuous linear map with
`(V a)_i = ∑_n a_n v_i(n)` and the members in `Cs` satisfy `Re ∑_n v_i(n) ≥ c |α|`, then
`‖V‖^2 ≥ c^2 |Cs| |α|`. -/
theorem opNorm_sq_ge {ι α : Type*} [Fintype ι] [Fintype α] [Nonempty α] (v : ι → α → ℂ)
    (V : EuclideanSpace ℂ α →L[ℂ] EuclideanSpace ℂ ι)
    (hV : ∀ (a : EuclideanSpace ℂ α) (i : ι), V a i = ∑ n, a n * v i n)
    (Cs : Finset ι) (c : ℝ) (hc : 0 ≤ c)
    (hcopy : ∀ i ∈ Cs, c * (Finset.univ : Finset α).card ≤ (∑ n, v i n).re) :
    c ^ 2 * Cs.card * (Finset.univ : Finset α).card ≤ ‖V‖ ^ 2 := by
  refine delta_ge_of_test v Finset.univ Finset.univ_nonempty Cs c hc hcopy (‖V‖ ^ 2) ?_
  intro a
  have h1 := V.le_opNorm (WithLp.toLp 2 a)
  have h2 : ‖V (WithLp.toLp 2 a)‖ ^ 2 ≤ (‖V‖ * ‖WithLp.toLp 2 a‖) ^ 2 :=
    pow_le_pow_left₀ (norm_nonneg _) h1 2
  rw [EuclideanSpace.norm_sq_eq, mul_pow, EuclideanSpace.norm_sq_eq] at h2
  simp only [hV] at h2
  exact h2

/-- `#{1 ≤ n ≤ D : (n, r) ≠ 1} ≤ ∑_{p | r prime} ⌊D/p⌋` for `r ≠ 0`. -/
theorem card_not_coprime_le (D r : ℕ) (hr : r ≠ 0) :
    ((Finset.Ioc 0 D).filter (fun n => ¬ Nat.Coprime n r)).card
      ≤ ∑ p ∈ r.primeFactors, D / p := by
  have hsub : (Finset.Ioc 0 D).filter (fun n => ¬ Nat.Coprime n r)
      ⊆ r.primeFactors.biUnion (fun p => (Finset.Ioc 0 D).filter (fun n => p ∣ n)) := by
    intro n hn
    obtain ⟨hnD, hcop⟩ := Finset.mem_filter.1 hn
    obtain ⟨p, hp, hpn, hpr⟩ := Nat.Prime.not_coprime_iff_dvd.1 hcop
    exact Finset.mem_biUnion.2 ⟨p, Nat.mem_primeFactors.2 ⟨hp, hpr, hr⟩,
      Finset.mem_filter.2 ⟨hnD, hpn⟩⟩
  refine (Finset.card_le_card hsub).trans (Finset.card_biUnion_le.trans ?_)
  refine Finset.sum_le_sum fun p _ => ?_
  rw [Nat.Ioc_filter_dvd_card_eq_div]

/-- The same in real numbers: `#{1 ≤ n ≤ D : (n, r) ≠ 1} ≤ η D` when `∑_{p | r} 1/p ≤ η`. -/
theorem card_not_coprime_le_real (D r : ℕ) (hr : r ≠ 0) (η : ℝ)
    (hη : ∑ p ∈ r.primeFactors, (1 : ℝ) / p ≤ η) :
    (((Finset.Ioc 0 D).filter (fun n => ¬ Nat.Coprime n r)).card : ℝ) ≤ η * D := by
  have h1 := card_not_coprime_le D r hr
  have h2 : (((Finset.Ioc 0 D).filter (fun n => ¬ Nat.Coprime n r)).card : ℝ)
      ≤ ∑ p ∈ r.primeFactors, ((D / p : ℕ) : ℝ) := by exact_mod_cast h1
  have h3 : ∑ p ∈ r.primeFactors, ((D / p : ℕ) : ℝ) ≤ ∑ p ∈ r.primeFactors, (D : ℝ) * (1 / p) := by
    refine Finset.sum_le_sum fun p _ => ?_
    rw [mul_one_div]
    exact Nat.cast_div_le
  have h4 : ∑ p ∈ r.primeFactors, (D : ℝ) * (1 / p) ≤ η * D := by
    rw [← Finset.mul_sum, mul_comm]
    exact mul_le_mul_of_nonneg_right hη (Nat.cast_nonneg D)
  linarith

/-- Splitting `{1..D}` into the `n` coprime to `r` and the others. -/
theorem card_coprime_add (D r : ℕ) :
    (((Finset.Ioc 0 D).filter (fun n => Nat.Coprime n r)).card : ℝ)
      + (((Finset.Ioc 0 D).filter (fun n => ¬ Nat.Coprime n r)).card : ℝ) = D := by
  have h := Finset.card_filter_add_card_filter_not (s := Finset.Ioc 0 D)
    (p := fun n => Nat.Coprime n r)
  rw [Nat.card_Ioc, Nat.sub_zero] at h
  exact_mod_cast h

/-- **Exact copy.** For `r ≠ 0` with `∑_{p | r} 1/p ≤ η`:
`∑_{n ≤ D} 1_{(n,r)=1} ≥ (1 - η) D`. -/
theorem exact_copy_sum_ge (D r : ℕ) (hr : r ≠ 0) (η : ℝ)
    (hη : ∑ p ∈ r.primeFactors, (1 : ℝ) / p ≤ η) :
    (1 - η) * D ≤ (((Finset.Ioc 0 D).filter (fun n => Nat.Coprime n r)).card : ℝ) := by
  have h1 := card_not_coprime_le_real D r hr η hη
  have h2 := card_coprime_add D r
  linarith

/-- **Near copy.** If `v(n) = 1` for `(n, r) = 1` and `‖v(n)‖ ≤ 1` otherwise, then
`Re ∑_{n ≤ D} v(n) ≥ (1 - 2η) D`. -/
theorem near_copy_re_sum_ge (D r : ℕ) (hr : r ≠ 0) (η : ℝ)
    (hη : ∑ p ∈ r.primeFactors, (1 : ℝ) / p ≤ η) (v : ℕ → ℂ)
    (h1 : ∀ n, Nat.Coprime n r → v n = 1) (h2 : ∀ n, ‖v n‖ ≤ 1) :
    (1 - 2 * η) * D ≤ (∑ n ∈ Finset.Ioc 0 D, v n).re := by
  rw [Complex.re_sum, ← Finset.sum_filter_add_sum_filter_not (Finset.Ioc 0 D)
    (fun n => Nat.Coprime n r)]
  have hA : ∑ n ∈ (Finset.Ioc 0 D).filter (fun n => Nat.Coprime n r), (v n).re
      = (((Finset.Ioc 0 D).filter (fun n => Nat.Coprime n r)).card : ℝ) := by
    rw [Finset.card_eq_sum_ones, Nat.cast_sum]
    refine Finset.sum_congr rfl fun n hn => ?_
    rw [h1 n (Finset.mem_filter.1 hn).2]
    simp
  have hB : -(((Finset.Ioc 0 D).filter (fun n => ¬ Nat.Coprime n r)).card : ℝ)
      ≤ ∑ n ∈ (Finset.Ioc 0 D).filter (fun n => ¬ Nat.Coprime n r), (v n).re := by
    rw [Finset.card_eq_sum_ones, Nat.cast_sum, ← Finset.sum_neg_distrib]
    refine Finset.sum_le_sum fun n _ => ?_
    have h3 := Complex.abs_re_le_norm (v n)
    have h4 := h2 n
    simp only [Nat.cast_one]
    have := neg_abs_le (v n).re
    linarith
  have h5 := card_not_coprime_le_real D r hr η hη
  have h6 := card_coprime_add D r
  rw [hA]
  linarith

/-- **Theorem 1.** Members `v i : ℕ → ℂ` (any finite family, multiplicities allowed); `Cs` a set of
members each of which has a modulus `r i ≠ 0` with `∑_{p | r i} 1/p ≤ η`, equals `1` on the `n` coprime
to `r i` and has modulus `≤ 1` elsewhere; `0 ≤ η ≤ 1/2`, `D ≥ 1`. If `Δ` satisfies the large-sieve
inequality on `{1..D}` for all coefficient vectors, then `Δ ≥ (1 - 2η)^2 |Cs| D`. -/
theorem theorem1 {ι : Type*} [Fintype ι] (v : ι → ℕ → ℂ) (D : ℕ) (hD : 1 ≤ D) (η : ℝ)
    (hη0 : η ≤ 1 / 2) (Cs : Finset ι) (r : ι → ℕ) (hr : ∀ i ∈ Cs, r i ≠ 0)
    (hηr : ∀ i ∈ Cs, ∑ p ∈ (r i).primeFactors, (1 : ℝ) / p ≤ η)
    (hcop : ∀ i ∈ Cs, ∀ n, Nat.Coprime n (r i) → v i n = 1)
    (hbdd : ∀ i ∈ Cs, ∀ n, ‖v i n‖ ≤ 1) (Δ : ℝ)
    (hΔ : ∀ a : ℕ → ℂ, ∑ i, ‖∑ n ∈ Finset.Ioc 0 D, a n * v i n‖ ^ 2
      ≤ Δ * ∑ n ∈ Finset.Ioc 0 D, ‖a n‖ ^ 2) :
    (1 - 2 * η) ^ 2 * Cs.card * D ≤ Δ := by
  have hcard : (Finset.Ioc 0 D).card = D := by rw [Nat.card_Ioc, Nat.sub_zero]
  have hne : (Finset.Ioc 0 D).Nonempty := ⟨1, Finset.mem_Ioc.2 ⟨Nat.one_pos, hD⟩⟩
  have h := delta_ge_of_test v (Finset.Ioc 0 D) hne Cs (1 - 2 * η) (by linarith) ?_ Δ hΔ
  · rwa [hcard] at h
  · intro i hi
    rw [hcard]
    exact near_copy_re_sum_ge D (r i) (hr i hi) η (hηr i hi) (v i) (hcop i hi) (hbdd i hi)

/-- **Theorem 1, exact copies.** If the members in `Cs` are exact η-copies, `v i n = 1_{(n, r i) = 1}`,
then `Δ ≥ (1 - η)^2 |Cs| D` for `η ≤ 1` (a better constant than `(1 - 2η)^2`). -/
theorem theorem1_exact {ι : Type*} [Fintype ι] (v : ι → ℕ → ℂ) (D : ℕ) (hD : 1 ≤ D) (η : ℝ)
    (hη0 : η ≤ 1) (Cs : Finset ι) (r : ι → ℕ) (hr : ∀ i ∈ Cs, r i ≠ 0)
    (hηr : ∀ i ∈ Cs, ∑ p ∈ (r i).primeFactors, (1 : ℝ) / p ≤ η)
    (hexact : ∀ i ∈ Cs, ∀ n, v i n = if Nat.Coprime n (r i) then 1 else 0) (Δ : ℝ)
    (hΔ : ∀ a : ℕ → ℂ, ∑ i, ‖∑ n ∈ Finset.Ioc 0 D, a n * v i n‖ ^ 2
      ≤ Δ * ∑ n ∈ Finset.Ioc 0 D, ‖a n‖ ^ 2) :
    (1 - η) ^ 2 * Cs.card * D ≤ Δ := by
  have hcard : (Finset.Ioc 0 D).card = D := by rw [Nat.card_Ioc, Nat.sub_zero]
  have hne : (Finset.Ioc 0 D).Nonempty := ⟨1, Finset.mem_Ioc.2 ⟨Nat.one_pos, hD⟩⟩
  have h := delta_ge_of_test v (Finset.Ioc 0 D) hne Cs (1 - η) (by linarith) ?_ Δ hΔ
  · rwa [hcard] at h
  · intro i hi
    rw [hcard]
    have h1 := exact_copy_sum_ge D (r i) (hr i hi) η (hηr i hi)
    have h2 : (∑ n ∈ Finset.Ioc 0 D, v i n).re
        = (((Finset.Ioc 0 D).filter (fun n => Nat.Coprime n (r i))).card : ℝ) := by
      rw [Complex.re_sum, Finset.card_filter, Nat.cast_sum]
      refine Finset.sum_congr rfl fun n _ => ?_
      rw [hexact i hi n]
      split_ifs <;> simp
    rw [h2]
    exact h1

end RHFormal.CB.L3
