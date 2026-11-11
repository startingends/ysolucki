import Mathlib.NumberTheory.ArithmeticFunction.VonMangoldt
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Tactic

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
-/

open Finset
open scoped ArithmeticFunction

namespace RHFormal.D1

/-- Pointwise form of D1: for `a, b ≥ 2`, `Λ(ab)` is `log p` if `a` and `b` are both powers of one
prime `p`, and `0` otherwise. `P` is any finite set of primes that contains the prime divisors of `a`. -/
theorem vonMangoldt_mul_eq_sum (P : Finset ℕ) (hP : ∀ p ∈ P, p.Prime) {a b : ℕ}
    (ha : 2 ≤ a) (haP : ∀ p : ℕ, p.Prime → p ∣ a → p ∈ P) :
    Λ (a * b) = ∑ p ∈ P, if (∃ i : ℕ, a = p ^ i) ∧ (∃ j : ℕ, b = p ^ j) then Real.log p else 0 := by
  classical
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
    · rw [if_pos ⟨⟨i, rfl⟩, ⟨j, rfl⟩⟩]
    · intro p hp hpq
      rw [if_neg]
      rintro ⟨⟨k, hk⟩, -⟩
      have h1 : q ∣ p ^ k := hk ▸ dvd_pow_self q hi
      exact hpq ((Nat.prime_dvd_prime_iff_eq hq (hP p hp)).1 (hq.dvd_of_dvd_pow h1)).symm
    · intro hq'
      exact absurd hqP hq'
  · rw [ArithmeticFunction.vonMangoldt_eq_zero_iff.2 h]
    symm
    apply Finset.sum_eq_zero
    intro p hp
    rw [if_neg]
    rintro ⟨⟨i, rfl⟩, ⟨j, rfl⟩⟩
    apply h
    have hi : i ≠ 0 := by
      rintro rfl
      simp at ha
    rw [← pow_add]
    exact (isPrimePow_nat_iff _).2 ⟨p, i + j, hP p hp, by omega, rfl⟩

/-- **Theorem D1, general finite form.** `S` is any finite set of integers `≥ 2` (the support),
`φ` any real function. The mirror form of the von Mangoldt weights on `S` equals a sum over the
primes dividing some element of `S` of `log p` times the square of the sum of `φ(a)/√a` over the
elements `a` of `S` that are powers of `p`. -/
theorem mirror_form_eq_sum_squares (S : Finset ℕ) (hS : ∀ a ∈ S, 2 ≤ a) (φ : ℕ → ℝ) :
    ∑ a ∈ S, ∑ b ∈ S, φ a * φ b * Λ (a * b) / Real.sqrt ((a : ℝ) * (b : ℝ))
      = ∑ p ∈ S.biUnion Nat.primeFactors,
          Real.log p * (∑ a ∈ S with ∃ k : ℕ, a = p ^ k, φ a / Real.sqrt a) ^ 2 := by
  classical
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
    · rw [if_pos h1, if_pos h2, if_pos ⟨h1, h2⟩]
      ring
    · rw [if_pos h1, if_neg h2, if_neg (fun h => h2 h.2)]
      ring
    · rw [if_neg h1, if_pos h2, if_neg (fun h => h1 h.1)]
      ring
    · rw [if_neg h1, if_neg h2, if_neg (fun h => h1 h.1)]
      ring
  rw [Finset.sum_congr rfl rhs, Finset.sum_comm]
  refine Finset.sum_congr rfl fun a ha => ?_
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl fun b _ => ?_
  rw [key a ha b, Finset.mul_sum, Finset.sum_div]

/-- **Theorem D1, positivity.** The mirror form of the prime atoms on integers `≥ 2` is non-negative. -/
theorem mirror_form_nonneg (S : Finset ℕ) (hS : ∀ a ∈ S, 2 ≤ a) (φ : ℕ → ℝ) :
    0 ≤ ∑ a ∈ S, ∑ b ∈ S, φ a * φ b * Λ (a * b) / Real.sqrt ((a : ℝ) * (b : ℝ)) := by
  rw [mirror_form_eq_sum_squares S hS φ]
  exact Finset.sum_nonneg fun p _ => mul_nonneg (Real.log_natCast_nonneg p) (sq_nonneg _)

end RHFormal.D1
