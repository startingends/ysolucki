import Mathlib.Data.Nat.Squarefree
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.PSeries
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.Tactic
set_option autoImplicit false

/-!
# COPY_BARRIER L1: the number of squarefull `n ≤ X` is at most `3 √X` (and at most `ζ(3/2) √X`)

Source: `rh/specialists/sieve/COPY_BARRIER.md` (SP-sieve), section 2 ("Counting") and nomination L1.

Informal statements, quoted:

> Squarefull ideals: b = c^2 d^3 (d squarefree) gives #{N(b) <= X} <= sum_d #{c : N(c) <= (X/N(d)^3)^(1/2)}
> << X^(1/2). ... Over Q: #{n <= X squarefull} <= zeta(3/2) X^(1/2) (proof as above).

> L1. For X >= 1: #{n <= X : n squarefull} <= zeta(3/2) sqrt(X) (or the cruder 3 sqrt(X)), via the
> unique decomposition n = a^2 b^3, b squarefree.

FORMAL HERE (`X : ℕ`; `n` squarefull means: `n ≥ 1` and `p ∣ n ⟹ p^2 ∣ n` for every prime `p`):
* `squarefull_decomp` : every squarefull `n ≥ 1` is `a^2 b^3` with `a, b ≥ 1` (and `b` squarefree);
* `card_le_sqrt_div` : for `b ≥ 1`, `#{a ≥ 1 : a^2 b^3 ≤ X} ≤ √X / (b √b)`;
* `sum_inv_le` : `∑_{b=1}^{B} 1/(b √b) ≤ 3 - 2/√B` for `B ≥ 1` (telescoping);
* `card_squarefull_le_three` : **`#{1 ≤ n ≤ X squarefull} ≤ 3 √X`** (the cruder constant of L1);
* `card_squarefull_le_tsum` : **`#{1 ≤ n ≤ X squarefull} ≤ (∑' n, 1/n^(3/2)) √X`**, i.e. `ζ(3/2) √X`
  with `ζ(3/2)` written as the real series `∑_{n ≥ 1} n^(-3/2)` (the `n = 0` term is `1/0 = 0` in Lean);
* `tsum_eq_zeta` : that series is `riemannZeta (3/2)` (as a complex number), and
  `card_squarefull_le_zeta` : the count is `≤ Re ζ(3/2) · √X`.

DIFFERENCES: the uniqueness of the decomposition is not used (only existence: the count of pairs
`(a, b)` is an upper bound); the restriction "b squarefree" is not used in the count (so the bound
counts all pairs, which is how the file's sum over `d` is bounded too). `X` is a natural number (for
real `X ≥ 1` apply it to `⌊X⌋`; `√⌊X⌋ ≤ √X`). `X = 0` is allowed (both sides are 0).
-/

open Finset

namespace RHFormal.CB.L1

/-- `n` is squarefull: `n ≥ 1` and every prime divisor divides it to at least the second power. -/
def Squarefull (n : ℕ) : Prop := 0 < n ∧ ∀ p : ℕ, p.Prime → p ∣ n → p ^ 2 ∣ n

/-- **Decomposition.** Every squarefull `n` is `a^2 b^3` with `a, b ≥ 1`, `b` squarefree. -/
theorem squarefull_decomp {n : ℕ} (hn : Squarefull n) :
    ∃ a b : ℕ, 0 < a ∧ 0 < b ∧ Squarefree b ∧ n = a ^ 2 * b ^ 3 := by
  obtain ⟨t, s, ht, hs, hst, hsqf⟩ := Nat.sq_mul_squarefree_of_pos hn.1
  -- every prime factor of the squarefree part t divides s
  have hdiv : ∀ p ∈ t.primeFactors, p ∣ s := by
    intro p hp
    have hpp := Nat.prime_of_mem_primeFactors hp
    have hpt := Nat.dvd_of_mem_primeFactors hp
    have hpn : p ∣ n := hst ▸ Dvd.dvd.mul_left hpt (s ^ 2)
    have h2 := hn.2 p hpp hpn
    by_contra hps
    have hcop : Nat.Coprime (p ^ 2) (s ^ 2) :=
      Nat.Coprime.pow 2 2 ((Nat.Prime.coprime_iff_not_dvd hpp).2 hps)
    rw [← hst] at h2
    have h3 : p ^ 2 ∣ t := hcop.dvd_of_dvd_mul_left h2
    have h4 : p * p ∣ t := by rw [← sq]; exact h3
    exact hpp.one_lt.ne' (Nat.isUnit_iff.1 (hsqf p h4))
  have hts : t ∣ s := by
    rw [← Nat.prod_primeFactors_of_squarefree hsqf]
    exact Finset.prod_primes_dvd s (fun p hp => (Nat.prime_of_mem_primeFactors hp).prime) hdiv
  obtain ⟨c, rfl⟩ := hts
  refine ⟨c, t, Nat.pos_of_ne_zero fun h => by simp [h] at hs, ht, hsqf, ?_⟩
  rw [← hst]
  ring

/-- For `b ≥ 1`: `#{1 ≤ a ≤ X : a^2 b^3 ≤ X} ≤ √X / (b √b)`. -/
theorem card_le_sqrt_div (X b : ℕ) (hb : 1 ≤ b) :
    (((Finset.Icc 1 X).filter (fun a => a ^ 2 * b ^ 3 ≤ X)).card : ℝ)
      ≤ Real.sqrt X / (b * Real.sqrt b) := by
  have hb0 : (0 : ℝ) < b := by exact_mod_cast hb
  have hsb : 0 < Real.sqrt b := Real.sqrt_pos.2 hb0
  have hden : 0 < (b : ℝ) * Real.sqrt b := mul_pos hb0 hsb
  set r := Real.sqrt X / (b * Real.sqrt b) with hr
  have hr0 : 0 ≤ r := div_nonneg (Real.sqrt_nonneg _) hden.le
  have hsub : (Finset.Icc 1 X).filter (fun a => a ^ 2 * b ^ 3 ≤ X) ⊆ Finset.Icc 1 ⌊r⌋₊ := by
    intro a ha
    obtain ⟨haX, hab⟩ := Finset.mem_filter.1 ha
    have ha1 : 1 ≤ a := (Finset.mem_Icc.1 haX).1
    refine Finset.mem_Icc.2 ⟨ha1, Nat.le_floor ?_⟩
    have ha0 : (0 : ℝ) < a := by exact_mod_cast ha1
    rw [hr, le_div_iff₀ hden]
    have hpos : 0 < (a : ℝ) * (b * Real.sqrt b) := mul_pos ha0 hden
    rw [Real.le_sqrt' hpos]
    have e : ((a : ℝ) * (b * Real.sqrt b)) ^ 2 = (a : ℝ) ^ 2 * (b : ℝ) ^ 3 := by
      have : Real.sqrt b ^ 2 = b := Real.sq_sqrt hb0.le
      calc ((a : ℝ) * (b * Real.sqrt b)) ^ 2 = (a : ℝ) ^ 2 * (b : ℝ) ^ 2 * Real.sqrt b ^ 2 := by
            ring
        _ = (a : ℝ) ^ 2 * (b : ℝ) ^ 3 := by rw [this]; ring
    rw [e]
    exact_mod_cast hab
  have h1 := Finset.card_le_card hsub
  rw [Nat.card_Icc, Nat.add_sub_cancel] at h1
  calc (((Finset.Icc 1 X).filter (fun a => a ^ 2 * b ^ 3 ≤ X)).card : ℝ) ≤ (⌊r⌋₊ : ℝ) := by
        exact_mod_cast h1
    _ ≤ r := Nat.floor_le hr0

/-- One telescoping step: `1/((B+1) √(B+1)) ≤ 2/√B - 2/√(B+1)` for `B ≥ 1`. -/
theorem step (B : ℝ) (hB : 1 ≤ B) :
    1 / ((B + 1) * Real.sqrt (B + 1)) ≤ 2 / Real.sqrt B - 2 / Real.sqrt (B + 1) := by
  set u := Real.sqrt B with hu
  set v := Real.sqrt (B + 1) with hv
  have hu0 : 0 < u := Real.sqrt_pos.2 (by linarith)
  have hv0 : 0 < v := Real.sqrt_pos.2 (by linarith)
  have hu2 : u ^ 2 = B := Real.sq_sqrt (by linarith)
  have hv2 : v ^ 2 = B + 1 := Real.sq_sqrt (by linarith)
  have huv : u ≤ v := Real.sqrt_le_sqrt (by linarith)
  have hkey : 0 ≤ 2 * v ^ 3 - 2 * u * v ^ 2 - u := by
    have e : (2 * v ^ 3 - 2 * u * v ^ 2 - u) * (v + u) = (v - u) * (2 * v + u) := by
      have : v ^ 2 = u ^ 2 + 1 := by rw [hu2, hv2]
      linear_combination (2 * v ^ 2) * this
    have h1 : 0 ≤ (v - u) * (2 * v + u) := mul_nonneg (by linarith) (by linarith)
    rw [← e] at h1
    by_contra hc
    push Not at hc
    have := mul_neg_of_neg_of_pos hc (by linarith : 0 < v + u)
    linarith
  have e2 : 2 / u - 2 / v - 1 / ((B + 1) * v) = (2 * v ^ 3 - 2 * u * v ^ 2 - u) / (u * v ^ 3) := by
    rw [← hv2]
    field_simp
  have h3 : 0 ≤ (2 * v ^ 3 - 2 * u * v ^ 2 - u) / (u * v ^ 3) := by positivity
  linarith

/-- **Telescoping bound.** `∑_{k < B} 1/((k+1) √(k+1)) ≤ 3 - 2/√B` for `B ≥ 1`. -/
theorem sum_range_le (B : ℕ) (hB : 1 ≤ B) :
    ∑ k ∈ Finset.range B, 1 / (((k : ℝ) + 1) * Real.sqrt ((k : ℝ) + 1))
      ≤ 3 - 2 / Real.sqrt B := by
  induction B with
  | zero => omega
  | succ B ih =>
    rcases Nat.eq_zero_or_pos B with rfl | hB1
    · norm_num
    · rw [Finset.sum_range_succ]
      have h1 := ih hB1
      have h2 := step (B : ℝ) (by exact_mod_cast hB1)
      push_cast
      linarith

/-- **`∑_{b=1}^{B} 1/(b √b) ≤ 3`.** -/
theorem sum_inv_le (B : ℕ) :
    ∑ b ∈ Finset.Icc 1 B, 1 / ((b : ℝ) * Real.sqrt b) ≤ 3 := by
  rcases Nat.eq_zero_or_pos B with rfl | hB
  · simp
  have e : ∑ b ∈ Finset.Icc 1 B, 1 / ((b : ℝ) * Real.sqrt b)
      = ∑ k ∈ Finset.range B, 1 / (((k : ℝ) + 1) * Real.sqrt ((k : ℝ) + 1)) := by
    refine Finset.sum_nbij' (fun b => b - 1) (fun k => k + 1) ?_ ?_ ?_ ?_ ?_
    · intro b hb
      have := Finset.mem_Icc.1 hb
      exact Finset.mem_range.2 (by omega)
    · intro k hk
      have := Finset.mem_range.1 hk
      exact Finset.mem_Icc.2 ⟨by omega, by omega⟩
    · intro b hb
      have := Finset.mem_Icc.1 hb
      omega
    · intro k _
      simp
    · intro b hb
      have := Finset.mem_Icc.1 hb
      have hb' : ((b - 1 : ℕ) : ℝ) + 1 = b := by
        rw [Nat.cast_sub this.1]
        ring
      rw [hb']
  rw [e]
  have h1 := sum_range_le B hB
  have h2 : 0 ≤ 2 / Real.sqrt (B : ℝ) := by positivity
  linarith

/-- Counting pairs: the squarefull numbers in `[1, X]` are at most the pairs `(a, b) ∈ [1,X]^2` with
`a^2 b^3 ≤ X`. -/
theorem card_squarefull_le_pairs (X : ℕ) [DecidablePred Squarefull] :
    ((Finset.Icc 1 X).filter Squarefull).card
      ≤ ((Finset.Icc 1 X ×ˢ Finset.Icc 1 X).filter (fun ab => ab.1 ^ 2 * ab.2 ^ 3 ≤ X)).card := by
  have hsub : (Finset.Icc 1 X).filter Squarefull
      ⊆ ((Finset.Icc 1 X ×ˢ Finset.Icc 1 X).filter (fun ab => ab.1 ^ 2 * ab.2 ^ 3 ≤ X)).image
          (fun ab => ab.1 ^ 2 * ab.2 ^ 3) := by
    intro n hn
    obtain ⟨hnX, hsf⟩ := Finset.mem_filter.1 hn
    obtain ⟨a, b, ha, hb, -, rfl⟩ := squarefull_decomp hsf
    have hle := (Finset.mem_Icc.1 hnX).2
    have haX : a ≤ X := by
      have h1 : a ≤ a ^ 2 * b ^ 3 := by
        have : 1 ≤ a * b ^ 3 := Nat.one_le_iff_ne_zero.2 (by positivity)
        nlinarith
      omega
    have hbX : b ≤ X := by
      have h1 : b ≤ a ^ 2 * b ^ 3 := by
        have h2 : 1 ≤ a ^ 2 * b ^ 2 := Nat.one_le_iff_ne_zero.2 (by positivity)
        nlinarith
      omega
    refine Finset.mem_image.2 ⟨(a, b), Finset.mem_filter.2 ⟨?_, hle⟩, rfl⟩
    exact Finset.mem_product.2 ⟨Finset.mem_Icc.2 ⟨ha, haX⟩, Finset.mem_Icc.2 ⟨hb, hbX⟩⟩
  exact (Finset.card_le_card hsub).trans Finset.card_image_le

/-- The pair count, fibred over `b`. -/
theorem card_pairs_eq (X : ℕ) :
    ((Finset.Icc 1 X ×ˢ Finset.Icc 1 X).filter (fun ab => ab.1 ^ 2 * ab.2 ^ 3 ≤ X)).card
      = ∑ b ∈ Finset.Icc 1 X, ((Finset.Icc 1 X).filter (fun a => a ^ 2 * b ^ 3 ≤ X)).card := by
  rw [Finset.card_filter, Finset.sum_product_right]
  refine Finset.sum_congr rfl fun b _ => ?_
  rw [Finset.card_filter]

/-- **L1, constant 3.** `#{1 ≤ n ≤ X : n squarefull} ≤ 3 √X`. -/
theorem card_squarefull_le_three (X : ℕ) [DecidablePred Squarefull] :
    (((Finset.Icc 1 X).filter Squarefull).card : ℝ) ≤ 3 * Real.sqrt X := by
  have h1 := card_squarefull_le_pairs X
  rw [card_pairs_eq] at h1
  have h2 : (((Finset.Icc 1 X).filter Squarefull).card : ℝ)
      ≤ ∑ b ∈ Finset.Icc 1 X, (((Finset.Icc 1 X).filter (fun a => a ^ 2 * b ^ 3 ≤ X)).card : ℝ) := by
    exact_mod_cast h1
  have h3 : ∑ b ∈ Finset.Icc 1 X, (((Finset.Icc 1 X).filter (fun a => a ^ 2 * b ^ 3 ≤ X)).card : ℝ)
      ≤ ∑ b ∈ Finset.Icc 1 X, Real.sqrt X * (1 / ((b : ℝ) * Real.sqrt b)) := by
    refine Finset.sum_le_sum fun b hb => ?_
    rw [mul_one_div]
    exact card_le_sqrt_div X b (Finset.mem_Icc.1 hb).1
  rw [← Finset.mul_sum] at h3
  have h4 := sum_inv_le X
  have h5 : Real.sqrt X * ∑ b ∈ Finset.Icc 1 X, 1 / ((b : ℝ) * Real.sqrt b) ≤ Real.sqrt X * 3 :=
    mul_le_mul_of_nonneg_left h4 (Real.sqrt_nonneg _)
  linarith

/-- `1/(b √b) = 1/b^(3/2)` for `b ≥ 0`. -/
theorem inv_eq_rpow (b : ℝ) (hb : 0 ≤ b) : 1 / (b * Real.sqrt b) = 1 / b ^ (3 / 2 : ℝ) := by
  rcases hb.eq_or_lt with rfl | hb0
  · simp
  · congr 1
    rw [Real.sqrt_eq_rpow, ← Real.rpow_one_add' hb0.le (by norm_num)]
    norm_num

/-- **L1, constant ζ(3/2).** `#{1 ≤ n ≤ X : n squarefull} ≤ (∑' n, 1/n^(3/2)) √X`. -/
theorem card_squarefull_le_tsum (X : ℕ) [DecidablePred Squarefull] :
    (((Finset.Icc 1 X).filter Squarefull).card : ℝ)
      ≤ (∑' n : ℕ, 1 / (n : ℝ) ^ (3 / 2 : ℝ)) * Real.sqrt X := by
  have h1 := card_squarefull_le_pairs X
  rw [card_pairs_eq] at h1
  have h2 : (((Finset.Icc 1 X).filter Squarefull).card : ℝ)
      ≤ ∑ b ∈ Finset.Icc 1 X, (((Finset.Icc 1 X).filter (fun a => a ^ 2 * b ^ 3 ≤ X)).card : ℝ) := by
    exact_mod_cast h1
  have h3 : ∑ b ∈ Finset.Icc 1 X, (((Finset.Icc 1 X).filter (fun a => a ^ 2 * b ^ 3 ≤ X)).card : ℝ)
      ≤ ∑ b ∈ Finset.Icc 1 X, Real.sqrt X * (1 / (b : ℝ) ^ (3 / 2 : ℝ)) := by
    refine Finset.sum_le_sum fun b hb => ?_
    rw [← inv_eq_rpow _ (Nat.cast_nonneg b), mul_one_div]
    exact card_le_sqrt_div X b (Finset.mem_Icc.1 hb).1
  rw [← Finset.mul_sum] at h3
  have hsum : Summable (fun n : ℕ => 1 / (n : ℝ) ^ (3 / 2 : ℝ)) :=
    Real.summable_one_div_nat_rpow.2 (by norm_num)
  have h4 : ∑ b ∈ Finset.Icc 1 X, 1 / (b : ℝ) ^ (3 / 2 : ℝ)
      ≤ ∑' n : ℕ, 1 / (n : ℝ) ^ (3 / 2 : ℝ) :=
    hsum.sum_le_tsum _ (fun n _ => by positivity)
  have h5 := mul_le_mul_of_nonneg_left h4 (Real.sqrt_nonneg (X : ℝ))
  linarith

/-- The constant of `card_squarefull_le_tsum` is `ζ(3/2)`: `riemannZeta (3/2) = ∑' n, 1/n^(3/2)`. -/
theorem tsum_eq_zeta :
    riemannZeta (3 / 2 : ℂ) = ((∑' n : ℕ, 1 / (n : ℝ) ^ (3 / 2 : ℝ) : ℝ) : ℂ) := by
  rw [zeta_eq_tsum_one_div_nat_cpow (by norm_num), Complex.ofReal_tsum]
  refine tsum_congr fun n => ?_
  rw [Complex.ofReal_div, Complex.ofReal_one, Complex.ofReal_cpow (Nat.cast_nonneg n)]
  push_cast
  rfl

/-- **L1 with ζ.** `#{1 ≤ n ≤ X : n squarefull} ≤ Re ζ(3/2) √X` (`ζ(3/2)` is real). -/
theorem card_squarefull_le_zeta (X : ℕ) [DecidablePred Squarefull] :
    (((Finset.Icc 1 X).filter Squarefull).card : ℝ) ≤ (riemannZeta (3 / 2 : ℂ)).re * Real.sqrt X := by
  rw [tsum_eq_zeta, Complex.ofReal_re]
  exact card_squarefull_le_tsum X

end RHFormal.CB.L1
