import RHFormal.CB_L1_Squarefull
import Mathlib.NumberTheory.EulerProduct.Basic
import Mathlib.GroupTheory.OrderOfElement

/-!
# COPY_BARRIER L2: the kernel lemma; kernel copies are an S-part times a squarefull number

Source: `rh/specialists/sieve/COPY_BARRIER.md` (SP-sieve), section 2 (Theorem 2, kernel lemma and
counting) and nomination L2.

Informal statements, quoted:

> Kernel lemma. psi_u principal => m_p | v_p(u) for every p not in S.
> Proof. For p not in S, locality and multiplicativity give psi_(u,p) = psi_(p,p)^(v_p(u)) ... A principal
> character has every local component trivial, so psi_(p,p)^(v_p(u)) = 1, i.e. m_p | v_p(u).

> Counting. If P_0 is finite, every copy u factors as u = a b with a supported on S u P_0 and b
> SQUAREFULL (all exponents >= 2), since m_p >= 2 off S u P_0. ...
> Hence C_0(F_H) <= sum_{a (S u P_0)-supported} #{b squarefull, N(b) <= H/N(a)}
> << H^(1/2) prod_{p in S u P_0} (1 - N(p)^(-1/2))^(-1).

> L2. Kernel lemma over N: let m : primes -> N_{>=2}, and call n a copy if m(p) | v_p(n) for all p.
> Then every copy is squarefull, hence #{copies <= X} <= 3 sqrt(X). (With exceptional set P_0 finite:
> <= 3 sqrt(X) prod_{p in P_0} (1 - p^(-1/2))^(-1).)

FORMAL HERE (over ℕ; `v_p(n)` = `n.factorization p`):
* `kernel_lemma` : groups `G p`, elements `g p` (the local generator `psi_(p,p)`), `u ≥ 1` whose local
  components `g p ^ v_p(u)` are all trivial (principal): then `orderOf (g p) ∣ v_p(u)` for every prime `p`;
* `squarefull_of_copy` : if `m p ≠ 1` for every prime `p`, every copy is squarefull;
* `card_copies_le_three`, `card_copies_le_zeta` : `#{copies ≤ X} ≤ 3 √X` and `≤ Re ζ(3/2) √X`;
* `copy_decomp` : with an exceptional finite set `P₀` (`m p ≠ 1` for primes `p ∉ P₀`), every copy is
  `a b` with `a` `P₀`-factored and `b` squarefull;
* `card_copies_le_euler` : `#{copies ≤ X} ≤ 3 √X ∏_{p ∈ P₀ prime} (1 - p^(-1/2))^(-1)`.

DIFFERENCES: over ℚ (ℕ) only; the number-field version is not formalised. The hypothesis
`m : primes → ℕ_{≥2}` is WEAKENED to `m p ≠ 1` (`m p = 0`, an element of infinite order, forces
`v_p = 0` and is allowed). In `kernel_lemma` the identity `psi_(u,p) = psi_(p,p)^(v_p(u))` (locality and
multiplicativity of the family) is the HYPOTHESIS: the lemma formalises the step from it to
`m_p ∣ v_p(u)`. `S` and `P₀` are merged into one finite set `P₀`.
-/

open Finset

namespace RHFormal.CB.L2

open RHFormal.CB.L1

/-- `n` is a copy for the local orders `m`: `n ≥ 1` and `m p ∣ v_p(n)` for every prime `p`. -/
def IsCopy (m : ℕ → ℕ) (n : ℕ) : Prop := 0 < n ∧ ∀ p : ℕ, p.Prime → m p ∣ n.factorization p

/-- **Kernel lemma.** If the local component `g_p ^ v_p(u)` of `u` is trivial at every prime, then
`u` is a copy for the orders `m_p = orderOf g_p`. -/
theorem kernel_lemma {G : ℕ → Type*} [∀ p, Group (G p)] (g : (p : ℕ) → G p) (u : ℕ) (hu : 0 < u)
    (hprincipal : ∀ p : ℕ, p.Prime → g p ^ (u.factorization p) = 1) :
    IsCopy (fun p => orderOf (g p)) u :=
  ⟨hu, fun p hp => orderOf_dvd_of_pow_eq_one (hprincipal p hp)⟩

/-- A prime exponent divisible by some `m ≠ 1` is `0` or `≥ 2`. -/
theorem exp_zero_or_two_le {m k : ℕ} (hm : m ≠ 1) (h : m ∣ k) : k = 0 ∨ 2 ≤ k := by
  rcases Nat.eq_zero_or_pos k with hk | hk
  · exact Or.inl hk
  · right
    rcases Nat.lt_or_ge m 2 with hm2 | hm2
    · interval_cases m
      · exact absurd (Nat.eq_zero_of_zero_dvd h) hk.ne'
      · exact absurd rfl hm
    · exact hm2.trans (Nat.le_of_dvd hk h)

/-- **Copies are squarefull** when `m p ≠ 1` for every prime `p`. -/
theorem squarefull_of_copy (m : ℕ → ℕ) (hm : ∀ p : ℕ, p.Prime → m p ≠ 1) {n : ℕ}
    (hn : IsCopy m n) : Squarefull n := by
  refine ⟨hn.1, fun p hp hpn => ?_⟩
  have hn0 : n ≠ 0 := hn.1.ne'
  have h1 : 1 ≤ n.factorization p := (hp.dvd_iff_one_le_factorization hn0).1 hpn
  rcases exp_zero_or_two_le (hm p hp) (hn.2 p hp) with h | h
  · omega
  · exact (hp.pow_dvd_iff_le_factorization hn0).2 h

/-- **L2, constant 3.** If `m p ≠ 1` for every prime, `#{n ≤ X : n a copy} ≤ 3 √X`. -/
theorem card_copies_le_three (m : ℕ → ℕ) (hm : ∀ p : ℕ, p.Prime → m p ≠ 1) (X : ℕ)
    [DecidablePred (IsCopy m)] [DecidablePred Squarefull] :
    (((Finset.Icc 1 X).filter (IsCopy m)).card : ℝ) ≤ 3 * Real.sqrt X := by
  have hsub : (Finset.Icc 1 X).filter (IsCopy m) ⊆ (Finset.Icc 1 X).filter Squarefull := by
    intro n hn
    rw [Finset.mem_filter] at hn ⊢
    exact ⟨hn.1, squarefull_of_copy m hm hn.2⟩
  have h1 : (((Finset.Icc 1 X).filter (IsCopy m)).card : ℝ)
      ≤ ((Finset.Icc 1 X).filter Squarefull).card := by
    exact_mod_cast Finset.card_le_card hsub
  exact h1.trans (card_squarefull_le_three X)

/-- **L2, constant ζ(3/2).** -/
theorem card_copies_le_zeta (m : ℕ → ℕ) (hm : ∀ p : ℕ, p.Prime → m p ≠ 1) (X : ℕ)
    [DecidablePred (IsCopy m)] [DecidablePred Squarefull] :
    (((Finset.Icc 1 X).filter (IsCopy m)).card : ℝ)
      ≤ (riemannZeta (3 / 2 : ℂ)).re * Real.sqrt X := by
  have hsub : (Finset.Icc 1 X).filter (IsCopy m) ⊆ (Finset.Icc 1 X).filter Squarefull := by
    intro n hn
    rw [Finset.mem_filter] at hn ⊢
    exact ⟨hn.1, squarefull_of_copy m hm hn.2⟩
  have h1 : (((Finset.Icc 1 X).filter (IsCopy m)).card : ℝ)
      ≤ ((Finset.Icc 1 X).filter Squarefull).card := by
    exact_mod_cast Finset.card_le_card hsub
  exact h1.trans (card_squarefull_le_zeta X)

/-! ### The exceptional set `P₀` -/

/-- The `P₀`-part and the `P₀`-free part of `n`. -/
noncomputable def partIn (P₀ : Finset ℕ) (n : ℕ) : ℕ :=
  (n.factorization.filter (· ∈ P₀)).prod (· ^ ·)

noncomputable def partOut (P₀ : Finset ℕ) (n : ℕ) : ℕ :=
  (n.factorization.filter (· ∉ P₀)).prod (· ^ ·)

theorem partIn_mul_partOut (P₀ : Finset ℕ) {n : ℕ} (hn : n ≠ 0) :
    partIn P₀ n * partOut P₀ n = n := by
  rw [partIn, partOut, Finsupp.prod_filter_mul_prod_filter_not, Nat.prod_factorization_pow_eq_self hn]

theorem filter_le_factorization (P : ℕ → Prop) [DecidablePred P] (n : ℕ) :
    n.factorization.filter P ≤ n.factorization := by
  intro p
  by_cases h : P p
  · rw [Finsupp.filter_apply_pos _ _ h]
  · rw [Finsupp.filter_apply_neg _ _ h]
    exact Nat.zero_le _

theorem factorization_partOut (P₀ : Finset ℕ) (n : ℕ) :
    (partOut P₀ n).factorization = n.factorization.filter (· ∉ P₀) :=
  Nat.factorization_prod_pow_eq_self_of_le_factorization (filter_le_factorization _ n)

theorem factorization_partIn (P₀ : Finset ℕ) (n : ℕ) :
    (partIn P₀ n).factorization = n.factorization.filter (· ∈ P₀) :=
  Nat.factorization_prod_pow_eq_self_of_le_factorization (filter_le_factorization _ n)

/-- **Decomposition of copies.** If `m p ≠ 1` for every prime `p ∉ P₀`, a copy `n` is `a b` with
`a = partIn P₀ n` `P₀`-factored and `b = partOut P₀ n` squarefull. -/
theorem copy_decomp (m : ℕ → ℕ) (P₀ : Finset ℕ) (hm : ∀ p : ℕ, p.Prime → p ∉ P₀ → m p ≠ 1)
    {n : ℕ} (hn : IsCopy m n) :
    partIn P₀ n ∈ Nat.factoredNumbers P₀ ∧ Squarefull (partOut P₀ n) := by
  have hn0 : n ≠ 0 := hn.1.ne'
  have hmul := partIn_mul_partOut P₀ hn0
  have ha0 : partIn P₀ n ≠ 0 := fun h => hn0 (by rw [← hmul, h, zero_mul])
  have hb0 : partOut P₀ n ≠ 0 := fun h => hn0 (by rw [← hmul, h, mul_zero])
  constructor
  · rw [Nat.mem_factoredNumbers_iff_primeFactors_subset]
    refine ⟨ha0, fun p hp => ?_⟩
    rw [← Nat.support_factorization, factorization_partIn, Finsupp.support_filter] at hp
    exact (Finset.mem_filter.1 hp).2
  · refine ⟨Nat.pos_of_ne_zero hb0, fun p hp hpb => ?_⟩
    have h1 : 1 ≤ (partOut P₀ n).factorization p :=
      (hp.dvd_iff_one_le_factorization hb0).1 hpb
    rw [factorization_partOut] at h1
    by_cases hpP : p ∈ P₀
    · rw [Finsupp.filter_apply_neg (fun x => x ∉ P₀) n.factorization (a := p) (not_not.2 hpP)]
        at h1
      omega
    · rw [Finsupp.filter_apply_pos (fun x => x ∉ P₀) n.factorization (a := p) hpP] at h1
      rw [hp.pow_dvd_iff_le_factorization hb0, factorization_partOut,
        Finsupp.filter_apply_pos (fun x => x ∉ P₀) n.factorization (a := p) hpP]
      rcases exp_zero_or_two_le (hm p hp hpP) (hn.2 p hp) with h | h
      · omega
      · exact h

/-- The completely multiplicative weight `n ↦ n^(-1/2)` as a monoid hom `ℕ →* ℝ`. -/
noncomputable def invSqrt : ℕ →* ℝ where
  toFun n := (n : ℝ) ^ (-(1 / 2 : ℝ))
  map_one' := by simp
  map_mul' a b := by
    push_cast
    exact Real.mul_rpow (Nat.cast_nonneg a) (Nat.cast_nonneg b)

theorem invSqrt_apply (n : ℕ) : invSqrt n = (n : ℝ) ^ (-(1 / 2 : ℝ)) := rfl

theorem invSqrt_eq (n : ℕ) : invSqrt n = 1 / Real.sqrt n := by
  rw [invSqrt_apply, Real.rpow_neg (Nat.cast_nonneg n), Real.sqrt_eq_rpow, one_div, one_div]

/-- The sum of `a^(-1/2)` over any finite set of `P₀`-factored `a` is at most
`∏_{p ∈ P₀ prime} (1 - p^(-1/2))^(-1)` (Euler product, mathlib's
`EulerProduct.summable_and_hasSum_factoredNumbers_prod_filter_prime_geometric`). -/
theorem sum_factored_le (P₀ : Finset ℕ) (A : Finset ℕ) (hA : ∀ a ∈ A, a ∈ Nat.factoredNumbers P₀) :
    ∑ a ∈ A, invSqrt a ≤ ∏ p ∈ P₀ with p.Prime, (1 - invSqrt p)⁻¹ := by
  have hlt : ∀ {p : ℕ}, p.Prime → ‖invSqrt p‖ < 1 := by
    intro p hp
    have hp1 : (1 : ℝ) < p := by exact_mod_cast hp.one_lt
    rw [invSqrt_apply, Real.norm_eq_abs, abs_of_nonneg (by positivity)]
    exact Real.rpow_lt_one_of_one_lt_of_neg hp1 (by norm_num)
  obtain ⟨hsum, hhas⟩ :=
    EulerProduct.summable_and_hasSum_factoredNumbers_prod_filter_prime_geometric hlt P₀
  have hnn : ∀ m : Nat.factoredNumbers P₀, 0 ≤ invSqrt m := fun m => by
    rw [invSqrt_apply]
    positivity
  have hsum' : Summable (fun m : Nat.factoredNumbers P₀ => invSqrt m) :=
    hhas.summable
  -- the finite set as a set of the subtype
  have e : ∑ a ∈ A, invSqrt a
      = ∑ m ∈ A.subtype (· ∈ Nat.factoredNumbers P₀), invSqrt (m : ℕ) := by
    rw [Finset.sum_subtype_of_mem (fun a => invSqrt a) hA]
  rw [e, ← hhas.tsum_eq]
  exact hsum'.sum_le_tsum _ (fun m _ => hnn m)

/-- `√⌊X/a⌋ ≤ √X · a^(-1/2)` for `a ≥ 1`. -/
theorem sqrt_div_le (X a : ℕ) :
    Real.sqrt ((X / a : ℕ) : ℝ) ≤ Real.sqrt X * invSqrt a := by
  rw [invSqrt_eq a, mul_one_div, ← Real.sqrt_div' _ (Nat.cast_nonneg a)]
  exact Real.sqrt_le_sqrt Nat.cast_div_le

/-- **L2 with exceptional set.** If `m p ≠ 1` for every prime `p ∉ P₀` (`P₀` finite), then
`#{n ≤ X : n a copy} ≤ 3 √X ∏_{p ∈ P₀ prime} (1 - p^(-1/2))^(-1)`. -/
theorem card_copies_le_euler (m : ℕ → ℕ) (P₀ : Finset ℕ)
    (hm : ∀ p : ℕ, p.Prime → p ∉ P₀ → m p ≠ 1) (X : ℕ)
    [DecidablePred (IsCopy m)] [DecidablePred Squarefull]
    [DecidablePred (· ∈ Nat.factoredNumbers P₀)] :
    (((Finset.Icc 1 X).filter (IsCopy m)).card : ℝ)
      ≤ 3 * Real.sqrt X * ∏ p ∈ P₀ with p.Prime, (1 - invSqrt p)⁻¹ := by
  set A := (Finset.Icc 1 X).filter (· ∈ Nat.factoredNumbers P₀) with hAdef
  -- copies inject into pairs (a, b) with a ∈ A, b squarefull, b ≤ X / a
  set T := A.sigma (fun a => (Finset.Icc 1 (X / a)).filter Squarefull) with hTdef
  have hsub : (Finset.Icc 1 X).filter (IsCopy m) ⊆ T.image (fun ab => ab.1 * ab.2) := by
    intro n hn
    obtain ⟨hnX, hcopy⟩ := Finset.mem_filter.1 hn
    have hn0 : n ≠ 0 := hcopy.1.ne'
    obtain ⟨hA, hB⟩ := copy_decomp m P₀ hm hcopy
    have hmul := partIn_mul_partOut P₀ hn0
    have ha0 : 0 < partIn P₀ n := Nat.pos_of_ne_zero (Nat.ne_zero_of_mem_factoredNumbers hA)
    have hnle := (Finset.mem_Icc.1 hnX).2
    have haX : partIn P₀ n ≤ X := by
      have : partIn P₀ n ≤ n :=
        calc partIn P₀ n ≤ partIn P₀ n * partOut P₀ n := Nat.le_mul_of_pos_right _ hB.1
          _ = n := hmul
      omega
    refine Finset.mem_image.2 ⟨⟨partIn P₀ n, partOut P₀ n⟩, ?_, hmul⟩
    refine Finset.mem_sigma.2 ⟨Finset.mem_filter.2 ⟨Finset.mem_Icc.2 ⟨ha0, haX⟩, hA⟩, ?_⟩
    refine Finset.mem_filter.2 ⟨Finset.mem_Icc.2 ⟨hB.1, ?_⟩, hB⟩
    rw [Nat.le_div_iff_mul_le ha0, mul_comm, hmul]
    exact hnle
  have h1 : (((Finset.Icc 1 X).filter (IsCopy m)).card : ℝ) ≤ (T.card : ℝ) := by
    exact_mod_cast (Finset.card_le_card hsub).trans Finset.card_image_le
  have h2 : (T.card : ℝ) = ∑ a ∈ A, (((Finset.Icc 1 (X / a)).filter Squarefull).card : ℝ) := by
    rw [hTdef, Finset.card_sigma]
    push_cast
    rfl
  have h3 : ∑ a ∈ A, (((Finset.Icc 1 (X / a)).filter Squarefull).card : ℝ)
      ≤ ∑ a ∈ A, 3 * Real.sqrt X * invSqrt a := by
    refine Finset.sum_le_sum fun a ha => ?_
    have ha0 : 0 < a := (Finset.mem_Icc.1 (Finset.mem_filter.1 ha).1).1
    have h4 := card_squarefull_le_three (X / a)
    have h5 := sqrt_div_le X a
    calc (((Finset.Icc 1 (X / a)).filter Squarefull).card : ℝ) ≤ 3 * Real.sqrt ((X / a : ℕ) : ℝ) :=
          h4
      _ ≤ 3 * (Real.sqrt X * invSqrt a) := by linarith
      _ = 3 * Real.sqrt X * invSqrt a := by ring
  rw [← Finset.mul_sum] at h3
  have h6 := sum_factored_le P₀ A (fun a ha => (Finset.mem_filter.1 ha).2)
  have h7 : 3 * Real.sqrt X * ∑ a ∈ A, invSqrt a
      ≤ 3 * Real.sqrt X * ∏ p ∈ P₀ with p.Prime, (1 - invSqrt p)⁻¹ :=
    mul_le_mul_of_nonneg_left h6 (by positivity)
  linarith

/-- The Euler factor in the notation of the file: `(1 - invSqrt p)⁻¹ = (1 - p^(-1/2))^(-1)`. -/
theorem euler_factor_eq (p : ℕ) : (1 - invSqrt p)⁻¹ = (1 - (p : ℝ) ^ (-(1 / 2 : ℝ)))⁻¹ := rfl

end RHFormal.CB.L2
