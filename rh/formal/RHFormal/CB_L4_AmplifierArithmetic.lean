import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Tactic

/-!
# COPY_BARRIER L4: the amplifier arithmetic (Theorem 3 as a statement about real numbers)

Source: `rh/specialists/sieve/COPY_BARRIER.md` (SP-sieve, session 3), section 3 (Theorem 3) and the
nomination L4 of section 6.

Informal statements, quoted:

> L4. Amplifier arithmetic: for H >= D >= 1, H D/(3 sqrt H) >= D^(3/2)/3 (so x^2 C <= H D with
> C <= 3 sqrt H never yields x^2 < D^(3/2)/3).

> (Theorem 3) the best bound the chain can output is |A_1|^2 <= 2 S/C + O(eta^2 D^2) with C << H^(1/2),
> i.e. inf over H >= D^(1-eps0) of H D^(1+eps) / H^(1/2) = D^(3/2 - eps0/2 + eps), so
> |A_1| << D^(3/4 - eps0/4 + eps) at best ... the general form of the output is 1 - delta/2 with
> delta = (log C)/(log H).

FORMAL HERE (real numbers, `x ^ y` the real power):
* `amplifier_floor` : `1 ≤ D ≤ H`, `0 < C ≤ 3 √H`  ⟹  `D √D / 3 ≤ H D / C`  (L4 as nominated);
* `amplifier_floor_bound` : the reading in brackets: if `x^2 ≤ H D / C` is the bound obtained, then
  that bound is never below `D^(3/2)/3` (stated as `D √D / 3 ≤ H D / C`, so `x^2 < D √D / 3` cannot be
  concluded from it);
* `exponent_floor` : `D ≥ 1`, `H ≥ D^(1-ε₀)`: `H D^(1+ε) / H^(1/2) ≥ D^(3/2 - ε₀/2 + ε)`;
* `exponent_floor_attained` : equality at `H = D^(1-ε₀)`; together: the infimum is
  `D^(3/2 - ε₀/2 + ε)`, attained;
* `sqrt_exponent` : the square root of `D^(3/2 - ε₀/2 + ε)` is `D^(3/4 - ε₀/4 + ε/2)`;
* `delta_floor` : the general form: `H ≥ D ≥ 1`, `0 < C ≤ H^δ`, `δ ≤ 1`: `H D^(1+ε)/C ≥ D^(2-δ+ε)`,
  whose square root is `D^(1 - δ/2 + ε/2)`.

DIFFERENCES: the file writes `|A_1| << D^(3/4 - eps0/4 + eps)`; the square root of
`D^(3/2 - eps0/2 + eps)` is `D^(3/4 - eps0/4 + eps/2)`: the `eps` is halved (harmless, `eps` is
arbitrary). The `O(eta^2 D^2)` term and the factor 2 are not part of these statements.
-/

namespace RHFormal.CB.L4

/-- **L4.** For `1 ≤ D ≤ H` and `0 < C ≤ 3 √H`: `H D / C ≥ D √D / 3`. -/
theorem amplifier_floor (H D C : ℝ) (hD : 1 ≤ D) (hDH : D ≤ H) (hC : 0 < C)
    (hCH : C ≤ 3 * Real.sqrt H) : D * Real.sqrt D / 3 ≤ H * D / C := by
  have hD0 : 0 < D := by linarith
  have hsD : Real.sqrt D ≤ Real.sqrt H := Real.sqrt_le_sqrt hDH
  have hsH : 0 < Real.sqrt H := Real.sqrt_pos.2 (by linarith)
  rw [div_le_div_iff₀ (by norm_num) hC]
  -- D √D C ≤ D √H · 3 √H = 3 H D
  have h1 : D * Real.sqrt D * C ≤ D * Real.sqrt H * (3 * Real.sqrt H) := by
    apply mul_le_mul (mul_le_mul_of_nonneg_left hsD hD0.le) hCH hC.le
    positivity
  have h2 : D * Real.sqrt H * (3 * Real.sqrt H) = H * D * 3 := by
    calc D * Real.sqrt H * (3 * Real.sqrt H) = 3 * D * (Real.sqrt H * Real.sqrt H) := by ring
      _ = 3 * D * H := by rw [Real.mul_self_sqrt (by linarith)]
      _ = H * D * 3 := by ring
  linarith

/-- The reading in brackets of L4: from `x^2 C ≤ H D` the best conclusion is `x^2 ≤ H D / C`, and
that bound is at least `D √D / 3`: so the chain never yields `x^2 < D √D / 3`. Formally: every `y` with
`y ≥ H D / C` (every bound the chain can output) satisfies `y ≥ D √D / 3`. -/
theorem amplifier_floor_bound (H D C : ℝ) (hD : 1 ≤ D) (hDH : D ≤ H) (hC : 0 < C)
    (hCH : C ≤ 3 * Real.sqrt H) (y : ℝ) (hy : H * D / C ≤ y) : D * Real.sqrt D / 3 ≤ y :=
  (amplifier_floor H D C hD hDH hC hCH).trans hy

/-- **Theorem 3, exponent.** For `D ≥ 1` and `H ≥ D^(1-ε₀)`:
`H D^(1+ε) / H^(1/2) ≥ D^(3/2 - ε₀/2 + ε)`. -/
theorem exponent_floor (H D ε ε₀ : ℝ) (hD : 1 ≤ D) (hH : D ^ (1 - ε₀) ≤ H) :
    D ^ (3 / 2 - ε₀ / 2 + ε) ≤ H * D ^ (1 + ε) / H ^ (1 / 2 : ℝ) := by
  have hD0 : 0 < D := by linarith
  have hDp : 0 < D ^ (1 - ε₀) := Real.rpow_pos_of_pos hD0 _
  have hH0 : 0 < H := lt_of_lt_of_le hDp hH
  -- H / H^(1/2) = H^(1/2)
  have e1 : H * D ^ (1 + ε) / H ^ (1 / 2 : ℝ) = H ^ (1 / 2 : ℝ) * D ^ (1 + ε) := by
    have h2 : 0 < H ^ (1 / 2 : ℝ) := Real.rpow_pos_of_pos hH0 _
    rw [div_eq_iff h2.ne', mul_right_comm, ← Real.rpow_add hH0]
    norm_num
  rw [e1]
  -- H^(1/2) ≥ (D^(1-ε₀))^(1/2) = D^((1-ε₀)/2)
  have h3 : D ^ ((1 - ε₀) / 2) ≤ H ^ (1 / 2 : ℝ) := by
    have h4 : (D ^ (1 - ε₀)) ^ (1 / 2 : ℝ) ≤ H ^ (1 / 2 : ℝ) :=
      Real.rpow_le_rpow hDp.le hH (by norm_num)
    rw [← Real.rpow_mul hD0.le] at h4
    have e2 : (1 - ε₀) * (1 / 2) = (1 - ε₀) / 2 := by ring
    rw [e2] at h4
    exact h4
  have e3 : D ^ (3 / 2 - ε₀ / 2 + ε) = D ^ ((1 - ε₀) / 2) * D ^ (1 + ε) := by
    rw [← Real.rpow_add hD0]
    congr 1
    ring
  rw [e3]
  exact mul_le_mul_of_nonneg_right h3 (Real.rpow_pos_of_pos hD0 _).le

/-- **Theorem 3, the infimum is attained** at `H = D^(1-ε₀)`. -/
theorem exponent_floor_attained (D ε ε₀ : ℝ) (hD : 0 < D) :
    D ^ (1 - ε₀) * D ^ (1 + ε) / (D ^ (1 - ε₀)) ^ (1 / 2 : ℝ) = D ^ (3 / 2 - ε₀ / 2 + ε) := by
  rw [← Real.rpow_mul hD.le, ← Real.rpow_add hD, ← Real.rpow_sub hD]
  congr 1
  ring

/-- The square root of the floor: `(D^(3/2 - ε₀/2 + ε))^(1/2) = D^(3/4 - ε₀/4 + ε/2)`. -/
theorem sqrt_exponent (D ε ε₀ : ℝ) (hD : 0 < D) :
    (D ^ (3 / 2 - ε₀ / 2 + ε)) ^ (1 / 2 : ℝ) = D ^ (3 / 4 - ε₀ / 4 + ε / 2) := by
  rw [← Real.rpow_mul hD.le]
  congr 1
  ring

/-- **The general form `1 - δ/2`.** If `H ≥ D ≥ 1`, `0 < C ≤ H^δ` with `δ ≤ 1`, then
`H D^(1+ε) / C ≥ D^(2 - δ + ε)`; its square root is `D^(1 - δ/2 + ε/2)`. -/
theorem delta_floor (H D C δ ε : ℝ) (hD : 1 ≤ D) (hDH : D ≤ H) (hC : 0 < C) (hδ : δ ≤ 1)
    (hCH : C ≤ H ^ δ) : D ^ (2 - δ + ε) ≤ H * D ^ (1 + ε) / C := by
  have hD0 : 0 < D := by linarith
  have hH0 : 0 < H := by linarith
  have hHd : 0 < H ^ δ := Real.rpow_pos_of_pos hH0 _
  -- H D^(1+ε)/C ≥ H D^(1+ε)/H^δ = H^(1-δ) D^(1+ε) ≥ D^(1-δ) D^(1+ε)
  have h1 : H * D ^ (1 + ε) / H ^ δ ≤ H * D ^ (1 + ε) / C :=
    div_le_div_of_nonneg_left (by positivity) hC hCH
  have e1 : H * D ^ (1 + ε) / H ^ δ = H ^ (1 - δ) * D ^ (1 + ε) := by
    rw [Real.rpow_sub hH0, Real.rpow_one]
    field_simp
  have h2 : D ^ (1 - δ) ≤ H ^ (1 - δ) := Real.rpow_le_rpow hD0.le hDH (by linarith)
  have e2 : D ^ (2 - δ + ε) = D ^ (1 - δ) * D ^ (1 + ε) := by
    rw [← Real.rpow_add hD0]
    congr 1
    ring
  rw [e2]
  calc D ^ (1 - δ) * D ^ (1 + ε) ≤ H ^ (1 - δ) * D ^ (1 + ε) :=
        mul_le_mul_of_nonneg_right h2 (Real.rpow_pos_of_pos hD0 _).le
    _ = H * D ^ (1 + ε) / H ^ δ := e1.symm
    _ ≤ H * D ^ (1 + ε) / C := h1

end RHFormal.CB.L4
