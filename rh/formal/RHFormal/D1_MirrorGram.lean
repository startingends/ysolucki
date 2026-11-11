import Mathlib.NumberTheory.ArithmeticFunction.VonMangoldt
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Tactic
set_option autoImplicit false

/-!
# Theorem D1: the mirror form of the prime atoms is a sum of squares, one per prime

Source: `rh/experiments/r2_curv/PROOF_bochner_parity.md`, Theorem D, item (D1) (seat R2-curv, 2026-11-10).
Used by idea #21 (mirror positivity) and by the theory document's T4 / T6.

Informal statement, quoted:

> (D1) For every finitely supported real function phi on the integers a >= 2:
>      sum_{a,b >= 2} phi(a) phi(b) Lambda(ab)/sqrt(ab)
>        = sum_p (log p) ( sum_{k >= 1} phi(p^k) p^{-k/2} )^2 >= 0.

Written proof, quoted: "Lambda(ab) != 0 with a, b >= 2 forces a = p^i, b = p^j, i, j >= 1, and then
Lambda(ab) = log p: the matrix is a direct sum over p of (log p) v_p v_p^T, v_p(p^k) = p^{-k/2}."

Here `Λ` is mathlib's von Mangoldt function `ArithmeticFunction.vonMangoldt`.

Main results:
* `RHFormal.D1.mirror_form_eq_sum_squares` : the identity for an arbitrary finite support `S ⊆ {a ≥ 2}`;
* `RHFormal.D1.mirror_form_eq_sum_primes` : the identity in the shape of the informal statement
  (support in `[2, N]`, sum over primes `p ≤ N`, inner sum over `k = 1..N` of `φ(p^k) p^(-k/2)`);
* `RHFormal.D1.mirror_form_eq_sum_squares_unweighted` : the same without the weights `1/√a`
  (the wording nominated on the board, B82);
* `RHFormal.D1.mirror_form_nonneg` : the form is `≥ 0`.
-/

open Finset
open scoped ArithmeticFunction

namespace RHFormal.D1

open scoped Classical in
/-- Pointwise form of D1: for `a ≥ 2` and any `b`, `Λ(ab)` is `log p` if `a` and `b` are both powers
of one prime `p`, and `0` otherwise. `P` is any finite set of primes that contains the prime divisors
of `a`. (If `b = 1 = p^0` and `a = p^i` this gives `Λ(a) = log p`, which is correct; in D1 one has `b ≥ 2`.) -/
theorem vonMangoldt_mul_eq_sum (P : Finset ℕ) (hP : ∀ p ∈ P, p.Prime) {a b : ℕ}
    (ha : 2 ≤ a) (haP : ∀ p : ℕ, p.Prime → p ∣ a → p ∈ P) :
    Λ (a * b) = ∑ p ∈ P, if (∃ i : ℕ, a = p ^ i) ∧ (∃ j : ℕ, b = p ^ j) then Real.log p else 0 := by
  by_cases h : IsPrimePow (a * b)
  · obtain ⟨q, n, hq, hn, hqn⟩ := (isPrimePow_nat_iff _).1 h
    have ha' : a ∣ q ^ n := Dvd.intro b hqn.symm
    have hb' : b ∣ q ^ n := Dvd.intro_left a hqn.symm
    obtain ⟨i, -, rfl⟩ := (Nat.dvd_prime_pow hq).1 ha'
    obtain ⟨j, -, rfl⟩ := (Nat.dvd_prime_pow hq).1 hb'
    have hi : i ≠ 0 := by
      rintro rfl
      simp at ha
    have hqP : q ∈ P := haP q hq (dvd_pow_self q hi)
    rw [← hqn, ArithmeticFunction.vonMangoldt_apply_pow hn.ne',
      ArithmeticFunction.vonMangoldt_apply_prime hq, Finset.sum_eq_single q]
    · exact (ite_eq_left ⟨⟨i, rfl⟩, ⟨j, rfl⟩⟩).symm
    · intro p hp hpq
      refine ite_eq_right ?_
      rintro ⟨⟨k, hk⟩, -⟩
      have h1 : q ∣ p ^ k := hk ▸ dvd_pow_self q hi
      exact hpq ((Nat.prime_dvd_prime_iff_eq hq (hP p hp)).1 (hq.dvd_of_dvd_pow h1)).symm
    · intro hq'
      exact absurd hqP hq'
  · rw [ArithmeticFunction.vonMangoldt_eq_zero_iff.2 h]
    symm
    apply Finset.sum_eq_zero
    intro p hp
    refine ite_eq_right ?_
    rintro ⟨⟨i, rfl⟩, ⟨j, rfl⟩⟩
    apply h
    have hi : i ≠ 0 := by
      rintro rfl
      simp at ha
    rw [← pow_add]
    exact (isPrimePow_nat_iff _).2 ⟨p, i + j, hP p hp, by omega, rfl⟩

open scoped Classical in
/-- **Theorem D1, general finite form.** `S` is any finite set of integers `≥ 2` (the support),
`φ` any real function. The mirror form of the von Mangoldt weights on `S` equals a sum over the
primes dividing some element of `S` of `log p` times the square of the sum of `φ(a)/√a` over the
elements `a` of `S` that are powers of `p`. -/
theorem mirror_form_eq_sum_squares (S : Finset ℕ) (hS : ∀ a ∈ S, 2 ≤ a) (φ : ℕ → ℝ) :
    ∑ a ∈ S, ∑ b ∈ S, φ a * φ b * Λ (a * b) / Real.sqrt ((a : ℝ) * (b : ℝ))
      = ∑ p ∈ S.biUnion Nat.primeFactors,
          Real.log p * (∑ a ∈ S with ∃ k : ℕ, a = p ^ k, φ a / Real.sqrt a) ^ 2 := by
  set P := S.biUnion Nat.primeFactors with hPdef
  have hP : ∀ p ∈ P, p.Prime := by
    intro p hp
    obtain ⟨a, -, hpa⟩ := Finset.mem_biUnion.1 hp
    exact Nat.prime_of_mem_primeFactors hpa
  have key : ∀ a ∈ S, ∀ b : ℕ, Λ (a * b)
      = ∑ p ∈ P, if (∃ i : ℕ, a = p ^ i) ∧ (∃ j : ℕ, b = p ^ j) then Real.log p else 0 := by
    intro a ha b
    refine vonMangoldt_mul_eq_sum P hP (hS a ha) ?_
    intro p hp hpa
    have h2 := hS a ha
    exact Finset.mem_biUnion.2 ⟨a, ha, Nat.mem_primeFactors.2 ⟨hp, hpa, by omega⟩⟩
  have rhs : ∀ p ∈ P,
      Real.log p * (∑ a ∈ S with ∃ k : ℕ, a = p ^ k, φ a / Real.sqrt a) ^ 2
        = ∑ a ∈ S, ∑ b ∈ S, φ a * φ b *
            (if (∃ i : ℕ, a = p ^ i) ∧ (∃ j : ℕ, b = p ^ j) then Real.log p else 0)
            / Real.sqrt ((a : ℝ) * (b : ℝ)) := by
    intro p _
    rw [Finset.sum_filter, sq, Finset.sum_mul_sum, Finset.mul_sum]
    refine Finset.sum_congr rfl fun a _ => ?_
    rw [Finset.mul_sum]
    refine Finset.sum_congr rfl fun b _ => ?_
    rw [Real.sqrt_mul (Nat.cast_nonneg a)]
    by_cases h1 : ∃ i : ℕ, a = p ^ i <;> by_cases h2 : ∃ j : ℕ, b = p ^ j
    · rw [ite_eq_left h1, ite_eq_left h2, ite_eq_left ⟨h1, h2⟩]
      ring
    · rw [ite_eq_left h1, ite_eq_right h2, ite_eq_right (fun h => h2 h.2)]
      ring
    · rw [ite_eq_right h1, ite_eq_left h2, ite_eq_right (fun h => h1 h.1)]
      ring
    · rw [ite_eq_right h1, ite_eq_right h2, ite_eq_right (fun h => h1 h.1)]
      ring
  have hR := Finset.sum_congr (rfl : P = P) rhs
  rw [hR]
  symm
  rw [Finset.sum_comm (s := P) (t := S)]
  refine Finset.sum_congr rfl fun a ha => ?_
  rw [Finset.sum_comm (s := P) (t := S)]
  refine Finset.sum_congr rfl fun b _ => ?_
  rw [key a ha b, Finset.mul_sum, Finset.sum_div]

/-- **Theorem D1, positivity.** The mirror form of the prime atoms on integers `≥ 2` is non-negative. -/
theorem mirror_form_nonneg (S : Finset ℕ) (hS : ∀ a ∈ S, 2 ≤ a) (φ : ℕ → ℝ) :
    0 ≤ ∑ a ∈ S, ∑ b ∈ S, φ a * φ b * Λ (a * b) / Real.sqrt ((a : ℝ) * (b : ℝ)) := by
  rw [mirror_form_eq_sum_squares S hS φ]
  exact Finset.sum_nonneg fun p _ => mul_nonneg (Real.log_natCast_nonneg p) (sq_nonneg _)

open scoped Classical in
/-- **Theorem D1 without the weights `1/√a`** (the wording nominated by S1-mirror, board s1, B82):
for a finite set `S` of integers `≥ 2` and real `φ`,
`∑_{a,b ∈ S} φ(a) φ(b) Λ(ab) = ∑_p log p (∑_{a ∈ S, a a power of p} φ(a))^2`. -/
theorem mirror_form_eq_sum_squares_unweighted (S : Finset ℕ) (hS : ∀ a ∈ S, 2 ≤ a) (φ : ℕ → ℝ) :
    ∑ a ∈ S, ∑ b ∈ S, φ a * φ b * Λ (a * b)
      = ∑ p ∈ S.biUnion Nat.primeFactors,
          Real.log p * (∑ a ∈ S with ∃ k : ℕ, a = p ^ k, φ a) ^ 2 := by
  have hpos : ∀ a ∈ S, 0 < Real.sqrt (a : ℝ) := by
    intro a ha
    have h2 := hS a ha
    exact Real.sqrt_pos.2 (Nat.cast_pos.2 (by omega))
  refine Eq.trans ?_
    (Eq.trans (mirror_form_eq_sum_squares S hS (fun a => φ a * Real.sqrt a)) ?_)
  · refine Finset.sum_congr rfl fun a ha => Finset.sum_congr rfl fun b hb => ?_
    have h1 := hpos a ha
    have h2 := hpos b hb
    rw [Real.sqrt_mul (Nat.cast_nonneg a)]
    field_simp
  · refine Finset.sum_congr rfl fun p _ => ?_
    congr 2
    refine Finset.sum_congr rfl fun a ha => ?_
    have h1 := hpos a (Finset.mem_filter.1 ha).1
    field_simp

open scoped Classical in
/-- Re-indexing of the inner sum: for `p ≥ 2` and `φ` vanishing above `N`, the sum of `φ(a)/√a` over
the powers `a` of `p` in `[2, N]` is `∑_{k=1}^{N} φ(p^k) p^(-k/2)` (the terms with `p^k > N` vanish). -/
theorem sum_powers_reindex (N p : ℕ) (hp : 2 ≤ p) (φ : ℕ → ℝ) (hφ : ∀ a, N < a → φ a = 0) :
    ∑ a ∈ Finset.Icc 2 N with ∃ k : ℕ, a = p ^ k, φ a / Real.sqrt a
      = ∑ k ∈ Finset.Icc 1 N, φ (p ^ k) * (p : ℝ) ^ (-(k : ℝ) / 2) := by
  have h1 : ∑ k ∈ Finset.Icc 1 N, φ (p ^ k) * (p : ℝ) ^ (-(k : ℝ) / 2)
      = ∑ k ∈ Finset.Icc 1 N with p ^ k ≤ N, φ (p ^ k) * (p : ℝ) ^ (-(k : ℝ) / 2) := by
    rw [Finset.sum_filter]
    refine Finset.sum_congr rfl fun k _ => ?_
    by_cases h : p ^ k ≤ N
    · rw [ite_eq_left h]
    · rw [ite_eq_right h, hφ _ (not_le.1 h), zero_mul]
  have h2 : (Finset.Icc 2 N).filter (fun a => ∃ k : ℕ, a = p ^ k)
      = ((Finset.Icc 1 N).filter (fun k => p ^ k ≤ N)).image (fun k => p ^ k) := by
    ext a
    simp only [Finset.mem_filter, Finset.mem_Icc, Finset.mem_image]
    constructor
    · rintro ⟨⟨h2a, haN⟩, k, rfl⟩
      refine ⟨k, ⟨⟨?_, ?_⟩, haN⟩, rfl⟩
      · rcases Nat.eq_zero_or_pos k with rfl | hk
        · simp at h2a
        · exact hk
      · exact (Nat.lt_pow_self (by omega : 1 < p)).le.trans haN
    · rintro ⟨k, ⟨⟨hk1, -⟩, hkN⟩, rfl⟩
      refine ⟨⟨?_, hkN⟩, k, rfl⟩
      calc 2 ≤ p := hp
        _ = p ^ 1 := (pow_one p).symm
        _ ≤ p ^ k := Nat.pow_le_pow_right (by omega) hk1
  rw [h1, h2, Finset.sum_image]
  · refine Finset.sum_congr rfl fun k _ => ?_
    have hp0 : (0 : ℝ) ≤ p := Nat.cast_nonneg p
    have h3 : Real.sqrt ((p ^ k : ℕ) : ℝ) = ((p : ℝ) ^ (-(k : ℝ) / 2))⁻¹ := by
      rw [← Real.rpow_neg hp0, Real.sqrt_eq_rpow, Nat.cast_pow, ← Real.rpow_natCast,
        ← Real.rpow_mul hp0]
      congr 1
      ring
    rw [h3, div_inv_eq_mul]
  · intro k _ k' _ h
    exact Nat.pow_right_injective hp h

/-- **Theorem D1 in the shape of the informal statement.** `φ` is a real function on the integers
that vanishes above `N` (finite support); the sums over `a, b` run over `2 ≤ a, b ≤ N`, the sum over
`p` over the primes `p ≤ N`, the inner sum over `k = 1, …, N` (all terms with `p^k > N` vanish, so this
is the full sum over `k ≥ 1`). `p^(-k/2)` is the real power `(p : ℝ) ^ (-(k : ℝ) / 2)`. -/
theorem mirror_form_eq_sum_primes (N : ℕ) (φ : ℕ → ℝ) (hφ : ∀ a, N < a → φ a = 0) :
    ∑ a ∈ Finset.Icc 2 N, ∑ b ∈ Finset.Icc 2 N,
        φ a * φ b * Λ (a * b) / Real.sqrt ((a : ℝ) * (b : ℝ))
      = ∑ p ∈ Finset.Icc 2 N with p.Prime,
          Real.log p * (∑ k ∈ Finset.Icc 1 N, φ (p ^ k) * (p : ℝ) ^ (-(k : ℝ) / 2)) ^ 2 := by
  classical
  have hS : ∀ a ∈ Finset.Icc 2 N, 2 ≤ a := fun a ha => (Finset.mem_Icc.1 ha).1
  have hP : (Finset.Icc 2 N).biUnion Nat.primeFactors = (Finset.Icc 2 N).filter Nat.Prime := by
    ext p
    simp only [Finset.mem_biUnion, Finset.mem_filter, Finset.mem_Icc, Nat.mem_primeFactors]
    constructor
    · rintro ⟨a, ⟨h2a, haN⟩, hp, hpa, -⟩
      exact ⟨⟨hp.two_le, (Nat.le_of_dvd (by omega) hpa).trans haN⟩, hp⟩
    · rintro ⟨⟨h2p, hpN⟩, hp⟩
      exact ⟨p, ⟨h2p, hpN⟩, hp, dvd_refl p, by omega⟩
  rw [mirror_form_eq_sum_squares _ hS φ, hP]
  refine Finset.sum_congr rfl fun p hp => ?_
  have hp' : p.Prime := (Finset.mem_filter.1 hp).2
  have h := sum_powers_reindex N p hp'.two_le φ hφ
  convert rfl using 3
  convert h.symm using 2

/-- Positivity in the shape of the informal statement. -/
theorem mirror_form_nonneg' (N : ℕ) (φ : ℕ → ℝ) :
    0 ≤ ∑ a ∈ Finset.Icc 2 N, ∑ b ∈ Finset.Icc 2 N,
        φ a * φ b * Λ (a * b) / Real.sqrt ((a : ℝ) * (b : ℝ)) :=
  mirror_form_nonneg _ (fun _ ha => (Finset.mem_Icc.1 ha).1) φ

end RHFormal.D1
