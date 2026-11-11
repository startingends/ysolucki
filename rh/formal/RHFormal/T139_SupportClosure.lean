import Mathlib.NumberTheory.ArithmeticFunction.Zeta
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Algebra.Group.Subgroup.ZPowers.Basic
import Mathlib.Tactic
set_option autoImplicit false

/-!
# T139 (algebraic core): Dirichlet products and inverses stay supported on a log-subgroup set;
# zeta's support is not of that kind for any lattice

Source: `rh/THEORY.md`, entry T139 ("Frequency-group no-go"); `rh/specialists/modular/DISCRETE_ORBIT.md`
section 3; NOTEBOOK N89. Coordinator's formulation of the finite core (session 3):

> if a_n, b_n are supported on a multiplicative subgroup-generated set S (n in S iff log n in a subgroup
> G of (R,+)), then the Dirichlet convolution and the Dirichlet inverse (when a_1 != 0) stay supported
> on S; algebraic, over N with a submonoid.

T139's statement (quoted): "Let Z_1, ..., Z_r ... be generalised Dirichlet series sum_lambda a_lambda
e^{-lambda s} whose frequencies all lie in a lattice c Z, c > 0. Then zeta(s) is not equal to
prod_j Z_j(s)^{e_j} (e_j = +-1) on any half-plane."

FORMAL HERE (arithmetic functions = formal Dirichlet series, mathlib's `ArithmeticFunction R`,
`*` = Dirichlet convolution):
* `mul_supported` : `S` any submonoid of `(ℕ, ·)`; `f, g` supported on `S` ⟹ `f * g` supported on `S`;
* `inv_supported` : `R` without zero divisors; `a` supported on `S`, `a 1 ≠ 0`, `a * b = 1` ⟹ `b`
  supported on `S` (any Dirichlet inverse; existence is not needed);
* `logSubmonoid G` : `{n ≥ 1 : log n ∈ G}` for an additive subgroup `G ≤ ℝ` is a submonoid
  (`n ∈ S ↔ log n ∈ G`, as in the coordinator's formulation);
* `not_two_and_three` : for `G = cℤ`, `c > 0`, the numbers `2` and `3` are not both in `logSubmonoid G`
  (`log 2 / log 3` is irrational: `2^l ≠ 3^k`);
* `zeta_not_quotient` : **algebraic T139**: for `G = cℤ`, `c > 0`, there are no `P, Q, Q'` supported on
  `logSubmonoid G` with `Q * Q' = 1` and `ζ * Q = P` (i.e. `ζ = P / Q` with `P, Q` products of factors
  supported there; by `mul_supported` and `inv_supported` any finite product of such factors and of
  their inverses is again supported there).

DIFFERENCES: this is T139 for ORDINARY Dirichlet series (frequencies `log n`, coefficients indexed by
`ℕ`), at the level of coefficients. T139 allows generalised Dirichlet series with arbitrary
frequencies in `cℤ` and is about functions on a half-plane; the analytic step (uniqueness of coefficients
of an absolutely convergent series) and the generalised frequencies are NOT formalised. The route also
differs from K-theory's check (periodicity `s ↦ s + 2πi/c`); both end at the same arithmetic fact,
`log 2, log 3` not in a common lattice, which IS formal here (`not_two_and_three`).
-/

open Finset ArithmeticFunction

-- `ζ` is written out as `ArithmeticFunction.zeta` below: the notation `ζ` is scoped, and without the
-- scope Lean would read `ζ` as a new variable (this happened in the first draft and was caught).

namespace RHFormal.T139

variable {R : Type*}

/-- `f` is supported on `S`: `f n ≠ 0 → n ∈ S`. -/
def SupportedOn [Zero R] (f : ArithmeticFunction R) (S : Submonoid ℕ) : Prop :=
  ∀ n, f n ≠ 0 → n ∈ S

/-- **Dirichlet products stay supported on a submonoid.** -/
theorem mul_supported [Semiring R] (S : Submonoid ℕ) {f g : ArithmeticFunction R}
    (hf : SupportedOn f S) (hg : SupportedOn g S) : SupportedOn (f * g) S := by
  intro n hn
  rw [mul_apply] at hn
  by_contra hS
  apply hn
  refine Finset.sum_eq_zero fun x hx => ?_
  have hx' := (Nat.mem_divisorsAntidiagonal.1 hx).1
  by_contra h
  have h1 : f x.1 ≠ 0 := left_ne_zero_of_mul h
  have h2 : g x.2 ≠ 0 := right_ne_zero_of_mul h
  exact hS (hx' ▸ S.mul_mem (hf _ h1) (hg _ h2))

/-- **Dirichlet inverses stay supported on a submonoid.** If `a` is supported on `S`, `a 1 ≠ 0` and
`a * b = 1`, then `b` is supported on `S`. -/
theorem inv_supported [Semiring R] [NoZeroDivisors R] (S : Submonoid ℕ) {a b : ArithmeticFunction R}
    (ha : SupportedOn a S) (ha1 : a 1 ≠ 0) (hab : a * b = 1) : SupportedOn b S := by
  intro n
  induction n using Nat.strong_induction_on with
  | _ n ih =>
    intro hbn
    rcases Nat.lt_or_ge n 2 with hn | hn
    · interval_cases n
      · exact absurd ArithmeticFunction.map_zero hbn
      · exact S.one_mem
    · by_contra hS
      have h0 : (a * b) n = 0 := by
        rw [hab, ArithmeticFunction.one_apply_ne (by omega)]
      rw [mul_apply] at h0
      have hmem : ((1 : ℕ), n) ∈ n.divisorsAntidiagonal :=
        Nat.mem_divisorsAntidiagonal.2 ⟨one_mul n, by omega⟩
      rw [← Finset.add_sum_erase _ _ hmem] at h0
      have hrest : ∑ x ∈ n.divisorsAntidiagonal.erase (1, n), a x.1 * b x.2 = 0 := by
        refine Finset.sum_eq_zero fun x hx => ?_
        obtain ⟨hx1, hx2⟩ := Finset.mem_erase.1 hx
        obtain ⟨hprod, -⟩ := Nat.mem_divisorsAntidiagonal.1 hx2
        by_contra h
        have h1 : a x.1 ≠ 0 := left_ne_zero_of_mul h
        have h2 : b x.2 ≠ 0 := right_ne_zero_of_mul h
        -- x.1 ≥ 2, so x.2 < n
        have hx1ne : x.1 ≠ 1 := by
          intro h1'
          apply hx1
          have : x.2 = n := by rw [← hprod, h1', one_mul]
          exact Prod.ext h1' this
        have hx10 : x.1 ≠ 0 := by
          intro h0'
          rw [h0', zero_mul] at hprod
          omega
        have hx20 : x.2 ≠ 0 := by
          intro h0'
          rw [h0', mul_zero] at hprod
          omega
        have hlt : x.2 < n := by
          rw [← hprod]
          have : 2 ≤ x.1 := by omega
          nlinarith [Nat.pos_of_ne_zero hx20]
        exact hS (hprod ▸ S.mul_mem (ha _ h1) (ih _ hlt h2))
      rw [hrest, add_zero] at h0
      exact hbn ((mul_eq_zero.1 h0).resolve_left ha1)

/-- The set `{n ≥ 1 : log n ∈ G}` for an additive subgroup `G` of `ℝ` is a submonoid of `(ℕ, ·)`. -/
noncomputable def logSubmonoid (G : AddSubgroup ℝ) : Submonoid ℕ where
  carrier := {n | 0 < n ∧ Real.log n ∈ G}
  one_mem' := ⟨Nat.one_pos, by simp [G.zero_mem]⟩
  mul_mem' := by
    rintro m n ⟨hm, hmG⟩ ⟨hn, hnG⟩
    refine ⟨Nat.mul_pos hm hn, ?_⟩
    push_cast
    rw [Real.log_mul (by positivity) (by positivity)]
    exact G.add_mem hmG hnG

theorem mem_logSubmonoid (G : AddSubgroup ℝ) (n : ℕ) :
    n ∈ logSubmonoid G ↔ 0 < n ∧ Real.log n ∈ G := Iff.rfl

/-- **No lattice contains `log 2` and `log 3`.** For `c > 0`, `2` and `3` are not both in
`logSubmonoid (cℤ)`. -/
theorem not_two_and_three (c : ℝ) (hc : 0 < c) :
    ¬ (2 ∈ logSubmonoid (AddSubgroup.zmultiples c) ∧ 3 ∈ logSubmonoid (AddSubgroup.zmultiples c)) := by
  rintro ⟨⟨-, h2⟩, ⟨-, h3⟩⟩
  obtain ⟨k, hk⟩ := AddSubgroup.mem_zmultiples_iff.1 h2
  obtain ⟨l, hl⟩ := AddSubgroup.mem_zmultiples_iff.1 h3
  simp only [zsmul_eq_mul] at hk hl
  push_cast at hk hl
  have hlog2 : 0 < Real.log 2 := Real.log_pos (by norm_num)
  have hlog3 : 0 < Real.log 3 := Real.log_pos (by norm_num)
  have hk0 : (0 : ℝ) < k := by
    by_contra h
    rw [not_lt] at h
    nlinarith
  have hl0 : (0 : ℝ) < l := by
    by_contra h
    rw [not_lt] at h
    nlinarith
  have hk0' : 0 < k := by exact_mod_cast hk0
  have hl0' : 0 < l := by exact_mod_cast hl0
  obtain ⟨k', rfl⟩ := Int.eq_ofNat_of_zero_le hk0'.le
  obtain ⟨l', rfl⟩ := Int.eq_ofNat_of_zero_le hl0'.le
  -- l log 2 = k log 3, so 2^l = 3^k
  have e : Real.log ((2 : ℝ) ^ l') = Real.log ((3 : ℝ) ^ k') := by
    rw [Real.log_pow, Real.log_pow, ← hk, ← hl]
    push_cast
    ring
  have e2 : (2 : ℝ) ^ l' = (3 : ℝ) ^ k' :=
    Real.log_injOn_pos (Set.mem_Ioi.2 (by positivity)) (Set.mem_Ioi.2 (by positivity)) e
  have e3 : (2 : ℕ) ^ l' = 3 ^ k' := by exact_mod_cast e2
  have hl1 : l' ≠ 0 := by
    intro h
    rw [h] at hl0'
    simp at hl0'
  have hdvd : 2 ∣ 3 ^ k' := e3 ▸ dvd_pow_self 2 hl1
  have hodd : ¬ 2 ∣ 3 ^ k' := by
    rw [Nat.two_dvd_ne_zero, Nat.pow_mod]
    norm_num
  exact hodd hdvd

/-- **Algebraic T139.** For a lattice `cℤ`, `c > 0`, zeta (as a formal Dirichlet series with complex
coefficients) is not `P / Q` with `P, Q` supported on `{n : log n ∈ cℤ}`: there are no such `P, Q, Q'`
with `Q * Q' = 1` and `ζ * Q = P`. -/
theorem zeta_not_quotient (c : ℝ) (hc : 0 < c) (P Q Q' : ArithmeticFunction ℂ)
    (hP : SupportedOn P (logSubmonoid (AddSubgroup.zmultiples c)))
    (hQ' : SupportedOn Q' (logSubmonoid (AddSubgroup.zmultiples c)))
    (hQQ' : Q * Q' = 1) (hζ : ((ArithmeticFunction.zeta : ArithmeticFunction ℕ) : ArithmeticFunction ℂ) * Q = P) : False := by
  -- ζ = P * Q' is supported on the log-submonoid
  have h1 : ((ArithmeticFunction.zeta : ArithmeticFunction ℕ) : ArithmeticFunction ℂ) = P * Q' := by
    rw [← hζ, mul_assoc, hQQ', mul_one]
  have hsupp : SupportedOn ((ArithmeticFunction.zeta : ArithmeticFunction ℕ) : ArithmeticFunction ℂ) (logSubmonoid (AddSubgroup.zmultiples c)) := by
    rw [h1]
    exact mul_supported _ hP hQ'
  have hz : ∀ n, n ≠ 0 → ((ArithmeticFunction.zeta : ArithmeticFunction ℕ) : ArithmeticFunction ℂ) n ≠ 0 := by
    intro n hn
    rw [natCoe_apply, ArithmeticFunction.zeta_apply_ne hn]
    simp
  exact not_two_and_three c hc ⟨hsupp 2 (hz 2 (by norm_num)), hsupp 3 (hz 3 (by norm_num))⟩

/-- The same with `Q'` obtained from `inv_supported`: `Q` supported, `Q 1 ≠ 0`, `Q * Q' = 1`. -/
theorem zeta_not_quotient' (c : ℝ) (hc : 0 < c) (P Q Q' : ArithmeticFunction ℂ)
    (hP : SupportedOn P (logSubmonoid (AddSubgroup.zmultiples c)))
    (hQ : SupportedOn Q (logSubmonoid (AddSubgroup.zmultiples c))) (hQ1 : Q 1 ≠ 0)
    (hQQ' : Q * Q' = 1) (hζ : ((ArithmeticFunction.zeta : ArithmeticFunction ℕ) : ArithmeticFunction ℂ) * Q = P) : False :=
  zeta_not_quotient c hc P Q Q' hP (inv_supported _ hQ hQ1 hQQ') hQQ' hζ

end RHFormal.T139
